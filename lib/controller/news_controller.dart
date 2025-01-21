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
    customLog("ggg ${dotenv.env['API_KEY']}");
    topHeadLinesApiResponse = APIResponse(data: null, loading: true);
    update();
    try {
      final response = await HttpApiService().apiRequest(
          withToken: true,
          url: "${ApiUrl.topHeadLinesEndPoint}&apiKey=${dotenv.env['API_KEY']}",
          method: 'get');
      if (response?.statusCode == 200 || response?.statusCode == 201) {
        // customLog(".>>>>> response ${response?.body}");
        topNewsModel = TopNewsListModel.fromJson(json.decode(response!.body));
        customLog("******8${response?.body}");

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
    update();
    return topHeadLinesApiResponse;
  }
}
