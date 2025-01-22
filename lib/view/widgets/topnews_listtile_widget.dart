import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_app/model/top_news_model/top_news_model.dart';
import 'package:news_app/view/widgets/common_text.dart';

class TopNewsListTileWidget extends StatelessWidget {
  const TopNewsListTileWidget({
    super.key,
    required this.topNews,
    required this.onTap,
  });

  final ArticlesModel? topNews;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 300,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                  topNews?.urlToImage ?? "",
                  errorBuilder: (context, error, stackTrace) => Image.network(
                      height: 160,
                      width: 300,
                      fit: BoxFit.cover,
                      'https://media.istockphoto.com/id/1177502660/photo/young-woman-reading-the-news-on-a-modern-tablet-computer-while-sitting-in-her-living-room.jpg?s=1024x1024&w=is&k=20&c=lcFzelAHLx4AssYinkhrKgYmor33U2BsfJ8yX_DD2V8='),
                ),
              ),
            ),
            const SizedBox(height: 10),
            CommonText(
              text: topNews?.title ?? "",
              fontSize: 16,
              fontWeight: FontWeight.w700,
              maxLines: 3,
              textOverflow: TextOverflow.ellipsis,
            ),
            const Spacer(),
            Align(
              alignment: Alignment.centerRight,
              child: CommonText(
                  text: topNews?.publishedAt == null
                      ? ""
                      : DateFormat('MMM dd,yyyy')
                          .format(topNews!.publishedAt!)),
            )
          ],
        ),
      ),
    );
  }
}
