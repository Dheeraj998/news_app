import 'package:flutter/material.dart';
import 'package:news_app/model/top_news_model/top_news_model.dart';
import 'package:news_app/view/widgets/common_text.dart';

class AllNewsListTileWidget extends StatelessWidget {
  const AllNewsListTileWidget({
    super.key,
    this.newsModel,
  });

  final ArticlesModel? newsModel;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.maxFinite,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.lightBlue.withOpacity(.05)),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: SizedBox(
                height: 80,
                width: double.maxFinite,
                child: Image.network(
                  height: 80,
                  width: double.maxFinite,
                  fit: BoxFit.cover,
                  newsModel?.urlToImage ?? "",
                  errorBuilder: (context, error, stackTrace) => Image.network(
                      height: 70,
                      width: double.maxFinite,
                      fit: BoxFit.cover,
                      'https://media.istockphoto.com/id/1177502660/photo/young-woman-reading-the-news-on-a-modern-tablet-computer-while-sitting-in-her-living-room.jpg?s=1024x1024&w=is&k=20&c=lcFzelAHLx4AssYinkhrKgYmor33U2BsfJ8yX_DD2V8='),
                ),
              ),
            ),
            const SizedBox(height: 5),
            CommonText(
              text: newsModel?.author?.toUpperCase() ?? "",
              fontSize: 12,
            ),
            const SizedBox(height: 5),
            CommonText(
              text: newsModel?.title ?? "",
              fontSize: 15,
              fontWeight: FontWeight.w600,
              maxLines: 3,
              textOverflow: TextOverflow.ellipsis,
            ),
          ],
        ));
  }
}
