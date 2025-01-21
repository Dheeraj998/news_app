import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:news_app/controller/news_controller.dart';
import 'package:news_app/core/utils/constants/colors.dart';
import 'package:news_app/core/utils/custom_print.dart';
import 'package:news_app/model/top_news_model/top_news_model.dart';
import 'package:news_app/view/widgets/all_news_listtile_widget.dart';
import 'package:news_app/view/widgets/common_text.dart';
import 'package:news_app/view/widgets/topnews_listtile_widget.dart';
import 'package:shimmer/shimmer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<NewsController>().getTopHeadLinesNewsApiFn();
      Get.find<NewsController>().getAllNewsApiFn();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // TextField(),
          _headerWidget(context),
          const SizedBox(height: 10),
          _headTittle(),
          const SizedBox(height: 10),
          _topNewsWidget(),
          const SizedBox(height: 10),
          _allNewsTitle(),
          const SizedBox(height: 10),
          _allNewsWidget()
        ],
      ),
    ));
  }

  Expanded _allNewsWidget() {
    return Expanded(child: GetBuilder<NewsController>(builder: (news) {
      List<ArticlesModel> list = news.allNewsModel?.articles?.toList() ?? [];
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView.separated(
            itemBuilder: (context, index) {
              return AllNewsListTileWidget(newsModel: list[index]);
            },
            separatorBuilder: (context, index) => const SizedBox(height: 10),
            itemCount: list.length),
      );
    }));
  }

  Padding _allNewsTitle() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: CommonText(
        text: "All News",
        fontSize: 17,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Padding _headTittle() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          const CommonText(
            text: "Top HeadLines",
            fontSize: 17,
            fontWeight: FontWeight.w600,
          ),
          const Spacer(),
          CommonText(
            text: "See all",
            fontSize: 13,
            color: Colors.grey.withOpacity(.8),
            fontWeight: FontWeight.w400,
          ),
        ],
      ),
    );
  }

  Row _headerWidget(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: (MediaQuery.of(context).size.width / 2) - 60,
          child: const Divider(
            color: AppColors.cBlack,
          ),
        ),
        const CircleAvatar(
          radius: 3.5,
          backgroundColor: AppColors.cBlack,
        ),
        Column(
          children: [
            CommonText(
              text: "today",
              textStyle:
                  GoogleFonts.arapey(fontSize: 25, fontWeight: FontWeight.w700),
            ),
            Row(
              children: [
                CommonText(
                  text: DateFormat('MMM dd, ').format(DateTime.now()),
                  textStyle: const TextStyle(fontSize: 11),
                ),
                CommonText(
                  text: DateFormat('EEEE').format(DateTime.now()),
                  textStyle: const TextStyle(fontSize: 11),
                ),
              ],
            ),
          ],
        )
      ],
    );
  }

  GetBuilder<NewsController> _topNewsWidget() {
    return GetBuilder<NewsController>(
        id: 'top-news',
        builder: (data) {
          List<ArticlesModel>? topNewsList =
              data.topNewsModel?.articles?.toList() ?? [];
          return data.topHeadLinesApiResponse?.loading == true
              ? SizedBox(
                  height: 270,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: 30,
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 20),
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
                                  width: 300,
                                ),
                                const SizedBox(height: 10),
                                Container(
                                  height: 10,
                                  // width: double.maxFinite,
                                  color: Theme.of(context).primaryColor,
                                  child: const CommonText(
                                      text:
                                          "-------------------------------------------------"),
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
                  ),
                )
              : SizedBox(
                  height: 270,
                  child: ListView.separated(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return TopNewsListTileWidget(
                            topNews: topNewsList[index]);
                      },
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: 10),
                      itemCount: topNewsList.length));
        });
  }
}
