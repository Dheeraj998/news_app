import 'dart:convert';
import 'dart:io';

import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:news_app/core/api_service/api_url.dart';
import 'package:news_app/core/api_service/http_response.dart';
import 'package:news_app/core/api_service/http_service.dart';
import 'package:news_app/core/utils/custom_print.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:news_app/model/top_news_model/top_news_model.dart';

class NewsController extends GetxController {
  APIResponse? topHeadLinesApiResponse;

  @override
  void onInit() {
    // getTopHeadLinesNewsApiFn();
    super.onInit();
  }

  TopNewsListModel? topNewsModel;
  Future<APIResponse?> getTopHeadLinesNewsApiFn() async {
    topHeadLinesApiResponse = APIResponse(data: null, loading: true);
    update(['top-news']);
    try {
      final response = await HttpApiService().apiRequest(
          withToken: true,
          url: "${ApiUrl.topHeadLinesEndPoint}&apiKey=${dotenv.env['API_KEY']}",
          method: 'get');
      if (response?.statusCode == 200 || response?.statusCode == 201) {
        // customLog(".>>>>> response ${response?.body}");
        topNewsModel = TopNewsListModel.fromJson(json.decode(response!.body));
        // customLog("******8${response?.body}");

        topHeadLinesApiResponse = topHeadLinesApiResponse?.copyWith(
            // message: jsonDecode(response!.body)['message'] ?? '',
            loading: false,
            status: APIstatus.onSuccess);
      } else {
        topHeadLinesApiResponse = topHeadLinesApiResponse?.copyWith(
            loading: false,
            message: jsonDecode(response!.body)['message'] ?? '',
            status: APIstatus.onError);
      }
    } on SocketException catch (_) {
      topHeadLinesApiResponse = topHeadLinesApiResponse?.copyWith(
          loading: false,
          message: 'No internet available',
          status: APIstatus.onNetworkError);
    } catch (e) {
      customLog("________ ${e.toString()}");
      topHeadLinesApiResponse = topHeadLinesApiResponse?.copyWith(
          loading: false,
          message: 'Something went wrong',
          status: APIstatus.onError);
    }
    update(['top-news']);
    return topHeadLinesApiResponse;
  }

  TopNewsListModel? allNewsModel;
  APIResponse? allNewsApiResponse;
  bool paginationLoader = false;
  List<ArticlesModel> allNewsList = [];
  String? queryy;
  Future<APIResponse?> getAllNewsApiFn({String? query, int? page = 1}) async {
    queryy = query;
    if (page == 1) {
      allNewsApiResponse = APIResponse(data: null, loading: true);
      // allNewsModel = allNewsModel?.copyWith(articles: []);
      allNewsList = [];
    }
    paginationLoader = true;
    update();
    try {
      final response = await HttpApiService().apiRequest(
          withToken: true,
          url:
              "${ApiUrl.allNewsEndPoint}?q=$query&page=$page&pageSize=20&apiKey=${dotenv.env['API_KEY']}",
          method: 'get');
      // customLog(".>>>>> response ${response?.body}");

      if (response?.statusCode == 200 || response?.statusCode == 201) {
        allNewsModel = TopNewsListModel.fromJson(json.decode(response!.body));
        // customLog("******8${response?.body}");

        List<ArticlesModel> list = allNewsList.toList() ?? [];

        list.addAll(allNewsModel?.articles ?? []);

        allNewsList = list;
        allNewsApiResponse = allNewsApiResponse?.copyWith(
            // message: jsonDecode(response!.body)['message'] ?? '',
            loading: false,
            status: APIstatus.onSuccess);
      } else {
        allNewsApiResponse = allNewsApiResponse?.copyWith(
            loading: false,
            message: jsonDecode(response!.body)['message'] ?? '',
            status: APIstatus.onError);
      }
    } on SocketException catch (_) {
      allNewsApiResponse = allNewsApiResponse?.copyWith(
          loading: false,
          message: 'No internet available',
          status: APIstatus.onNetworkError);
    } catch (e) {
      customLog("________ ${e.toString()}");
      allNewsApiResponse = allNewsApiResponse?.copyWith(
          loading: false,
          message: 'Something went wrong',
          status: APIstatus.onError);
    }
    paginationLoader = false;
    update();
    return allNewsApiResponse;
  }
}
