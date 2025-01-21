import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:news_app/controller/news_controller.dart';
import 'package:news_app/core/utils/constants/colors.dart';
import 'package:news_app/model/top_news_model/top_news_model.dart';
import 'package:news_app/view/widgets/common_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    Get.find<NewsController>().getTopHeadLinesNewsApiFn();
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
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: CommonText(
              text: "All News",
              fontSize: 17,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 10),

          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ListView.separated(
                itemBuilder: (context, index) {
                  return Container(child: CommonText(text: 'ss'));
                },
                separatorBuilder: (context, index) => SizedBox(
                      height: 10,
                    ),
                itemCount: 40),
          ))
        ],
      ),
    ));
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
    return GetBuilder<NewsController>(builder: (data) {
      List<ArticlesModel>? topNewsList =
          data.topNewsModel?.articles?.toList() ?? [];
      return SizedBox(
          height: 270,
          child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  width: 300,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.lightBlue.withOpacity(.05)),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: SizedBox(
                          height: 140,
                          width: 300,
                          child: Image.network(
                            height: 160,
                            width: 300,
                            fit: BoxFit.cover,
                            topNewsList[index].urlToImage ?? "",
                            errorBuilder: (context, error, stackTrace) =>
                                Image.network(
                                    height: 160,
                                    width: 300,
                                    fit: BoxFit.cover,
                                    'https://media.istockphoto.com/id/1177502660/photo/young-woman-reading-the-news-on-a-modern-tablet-computer-while-sitting-in-her-living-room.jpg?s=1024x1024&w=is&k=20&c=lcFzelAHLx4AssYinkhrKgYmor33U2BsfJ8yX_DD2V8='),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      CommonText(
                        text: topNewsList[index].title ?? "",
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        maxLines: 3,
                        textOverflow: TextOverflow.ellipsis,
                      ),
                      Spacer(),
                      Align(
                        alignment: Alignment.centerRight,
                        child: CommonText(
                            text: topNewsList[index].publishedAt == null
                                ? ""
                                : DateFormat('MMM dd,yyyy')
                                    .format(topNewsList[index].publishedAt!)),
                      )
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) => SizedBox(width: 10),
              itemCount: topNewsList.length));
    });
  }
}
