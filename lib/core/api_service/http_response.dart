enum APIstatus { onError, onLoading, onEmpty, onSuccess, onNetworkError }

class APIResponse<T> {
  T data;
  int statusCode;
  APIstatus? status;
  String message;
  int pageNo;
  bool pagination;
  bool? loading;
  bool? error, noInternet;
  APIResponse(
      {required this.data,
      this.status,
      this.pageNo = 1,
      this.statusCode = 1000,
      this.message = '',
      this.pagination = true,
      this.loading = false,
      this.error = false,
      this.noInternet = false});

  APIResponse copyWith(
          {T? data,
          APIstatus? status,
          String? message,
          int? statusCode,
          bool? loading,
          int? pageNo,
          bool? pagination}) =>
      APIResponse(
          data: data ?? this.data,
          statusCode: statusCode ?? this.statusCode,
          message: message ?? this.message,
          pageNo: pageNo ?? this.pageNo,
          pagination: pagination ?? this.pagination,
          status: status ?? status,
          loading: loading ?? this.loading);
}
