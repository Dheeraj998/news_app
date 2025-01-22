import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:news_app/controller/news_controller.dart';
import 'package:news_app/core/api_service/http_response.dart';
import 'package:news_app/core/utils/custom_print.dart';
import 'package:news_app/model/top_news_model/top_news_model.dart';
import 'package:news_app/view/detail_page.dart';
import 'package:news_app/view/widgets/all_news_listtile_widget.dart';
import 'package:news_app/view/widgets/common_text.dart';
import 'package:shimmer/shimmer.dart';

class AllNewsScreen extends StatefulWidget {
  const AllNewsScreen({super.key});

  @override
  State<AllNewsScreen> createState() => _AllNewsScreenState();
}

class _AllNewsScreenState extends State<AllNewsScreen> {
  final TextEditingController _searchController = TextEditingController();
  ScrollController listController = ScrollController();
  int pageCount = 1;
  Timer? _debounceTimer;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<NewsController>().getAllNewsApiFn();
    });
    // _searchController.addListener(_onSearchChanged);
    // FocusScope.of(context).unfocus();

    listController.addListener(() {
      if (listController.position.pixels >=
          listController.position.maxScrollExtent) {
        customLog("**** reached at end");
        List<ArticlesModel> list = Get.find<NewsController>().allNewsList;
        if (list.length % 20 == 0 &&
            !(Get.find<NewsController>().paginationLoader)) {
          if (list.length <= 20) {
            pageCount = 1;
          }
          pageCount++;
          Get.find<NewsController>().getAllNewsApiFn(page: pageCount);
        }
      }
    });
    super.initState();
  }

  void _onSearchChanged() {
    if (_debounceTimer?.isActive ?? false) _debounceTimer?.cancel();

    // Start a new debounce timer
    _debounceTimer = Timer(const Duration(milliseconds: 300), () {
      // Filter list after the delay

      Get.find<NewsController>().getAllNewsApiFn(
          query: _searchController.text.isEmpty ? null : _searchController.text,
          page: 1);
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    listController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            GetBuilder<NewsController>(builder: (val) {
              return val.queryy == null
                  ? const SizedBox()
                  : InkWell(
                      onTap: () {
                        _searchController.clear();
                        FocusScope.of(context).unfocus();
                      },
                      child: const Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: CommonText(text: "Clear"),
                      ),
                    );
            })
          ],
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const SizedBox(height: 10),
                TextField(
                  controller: _searchController,
                  onChanged: (query) {
                    _onSearchChanged();
                  },
                  decoration: InputDecoration(
                    labelText: 'Search',
                    hintText: 'Type to search...',
                    suffixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                _allNewsWidget()
              ],
            ),
          ),
        ));
  }

  Expanded _allNewsWidget() {
    return Expanded(child: GetBuilder<NewsController>(builder: (news) {
      List<ArticlesModel> list = news.allNewsList.toList() ?? [];
      return news.allNewsApiResponse?.loading == true
          ? ListView.separated(
              controller: listController,
              itemCount: 30,
              separatorBuilder: (context, index) => const SizedBox(height: 20),
              itemBuilder: (context, index) {
                return Shimmer.fromColors(
                    baseColor: Colors.blueGrey.withOpacity(.1),
                    highlightColor: Colors.grey[100]!,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                borderRadius: BorderRadius.circular(7)),
                            height: 140,
                            width: double.maxFinite,
                          ),
                          const SizedBox(height: 10),
                          Container(
                            height: 10,
                            // width: double.maxFinite,
                            color: Theme.of(context).primaryColor,
                            child: const CommonText(
                                text:
                                    "--------------------------------------------"),
                          ),
                          const SizedBox(height: 5),
                          Container(
                            height: 10,
                            // width: double.maxFinite,
                            color: Theme.of(context).primaryColor,
                            child: const CommonText(
                                text:
                                    "--------------------------------------------"),
                          )
                        ],
                      ),
                    ));
              },
            )
          : news.allNewsApiResponse?.status == APIstatus.onNetworkError
              ? const Center(child: CommonText(text: "No internet found"))
              : news.allNewsApiResponse?.status == APIstatus.onError
                  ? const Center(child: CommonText(text: "Something wentwrong"))
                  : (list.isEmpty)
                      ? const Center(child: CommonText(text: "No news to show"))
                      : ListView.separated(
                          controller: listController,
                          itemBuilder: (context, index) {
                            return news.paginationLoader &&
                                    list.length == index + 1
                                ? Center(
                                    child: CupertinoActivityIndicator(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .tertiary))
                                : AllNewsListTileWidget(
                                    onTap: () {
                                      Navigator.of(context)
                                          .push(SlideUpPageRoute(
                                              builder: (context) => DetailsPage(
                                                    articlesModel: list[index],
                                                  )));
                                    },
                                    newsModel: list[index]);
                          },
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 10),
                          itemCount: list.length);
    }));
  }
}
