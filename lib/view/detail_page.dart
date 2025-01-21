import 'package:flutter/material.dart';
import 'package:news_app/model/top_news_model/top_news_model.dart';
import 'package:news_app/view/widgets/common_text.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key, this.articlesModel});
  final ArticlesModel? articlesModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                height: 250,
                width: double.maxFinite,
                errorBuilder: (context, error, stackTrace) => Image.network(
                    height: 250,
                    width: double.maxFinite,
                    fit: BoxFit.cover,
                    'https://media.istockphoto.com/id/1177502660/photo/young-woman-reading-the-news-on-a-modern-tablet-computer-while-sitting-in-her-living-room.jpg?s=1024x1024&w=is&k=20&c=lcFzelAHLx4AssYinkhrKgYmor33U2BsfJ8yX_DD2V8='),
                fit: BoxFit.cover,
                articlesModel?.urlToImage ?? "",
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                            color: Colors.lightBlue.withOpacity(.2),
                            borderRadius: BorderRadius.circular(5)),
                        child: CommonText(text: articlesModel?.author ?? '')),
                    const SizedBox(height: 20),
                    CommonText(
                      text: articlesModel?.title ?? '',
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                    const SizedBox(height: 15),
                    CommonText(
                      text: articlesModel?.description ?? '',
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
