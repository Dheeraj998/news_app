import 'dart:async';
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/core/api_service/api_url.dart';
import 'package:news_app/core/utils/custom_print.dart';

class HttpApiService {
  Future<http.Response?> apiRequest({
    required String url,
    required String method,
    String? otherApiUrl,
    Map<dynamic, dynamic>? body,
    Object? bodyy,
    bool withToken = false,
    bool? isSocketErrorPrint,
  }) async {
    customLog("$bodyy");
    customPrint("api called ${ApiUrl.baseUrl}/$url");

    final headerWithout = {'Content-Type': 'application/json'};
    final headers = {
      'Authorization': 'Bearer ${dotenv.env['API_KEY']}',
      'Content-Type': 'application/json',
    };
    http.Response? response;

    String apiUrl = otherApiUrl ?? '${ApiUrl.baseUrl}/$url';

    switch (method) {
      case 'get':
        response = await http
            .get(
                Uri.parse(
                  apiUrl,
                ),
                headers: withToken ? headers : headerWithout)
            .timeout(const Duration(seconds: 10));
        break;

      case 'post':
        response = await http
            .post(Uri.parse(apiUrl),
                headers: withToken ? headers : headerWithout,
                body: bodyy ?? jsonEncode(body))
            .timeout(const Duration(seconds: 10));
        break;
      case 'put':
        response = await http
            .put(Uri.parse(apiUrl),
                headers: withToken ? headers : headerWithout,
                body: bodyy ?? (body != null ? jsonEncode(body) : null))
            .timeout(const Duration(seconds: 10));
        break;

      case 'patch':
        response = await http
            .patch(Uri.parse(apiUrl),
                headers: withToken ? headers : headerWithout,
                body: jsonEncode(body))
            .timeout(const Duration(seconds: 10));
        break;

      case 'delete':
        response = await http
            .delete(
              Uri.parse(apiUrl),
              body: body == null ? null : jsonEncode(body),
              headers: withToken ? headers : headerWithout,
            )
            .timeout(const Duration(seconds: 10));
        break;
      default:
    }
    // customLog("response.cc ${response?.body}");
    if (response?.statusCode == 200) {
      customPrint(apiUrl);
      return response;
    } else if (response?.statusCode == 401 || response?.statusCode == 403) {
      // await CacheHelper().clearSingleData(key: 'token');

      return response;
    } else {
      customLog('error status code is --${response?.statusCode}');
      return response;
    }
  }
}
