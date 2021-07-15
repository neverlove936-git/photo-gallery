// Cores
import 'dart:io';
import 'package:dio/dio.dart';
// Services
import 'package:photo_gallery/flavors.dart';
import 'package:photo_gallery/services/connection.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../utils/constants/index.dart';
// Utils

class ApiMethod {
  static const get = 'Get';
}

Future dioService({
  String url = '',
  String method = ApiResource.get,
  String path = '',
  Map<String, dynamic> params = const {},
  Map<String, String> authHeader = const {},
  dynamic body = const {},
  CancelToken? tokenCancel,
  String savePathDownload = '',
  Function(int received, int total)? onReceiveProgress,
}) async {
  final dio = Dio(BaseOptions(method: method));
  dio.interceptors.add(
    PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: true,
      maxWidth: 90,
    ),
  );

  final status = await ConnectionService().isConnectNetwork();

  if (!status) {
    throw DioError(
      requestOptions: RequestOptions(path: path),
      error: 'noInternetConnection'.tr,
      response: Response(
        requestOptions: RequestOptions(path: path),
        data: {'message': 'noInternetConnection'.tr},
      ),
    );
  }

  dio.options.headers = {...dio.options.headers, ...authHeader};

  // Check type and switch base url
  final apiUrl = url.isEmpty ? '${Env.value.baseUrl}$path' : url;

  Response response;
  addInterceptors(dio, apiUrl);
  switch (method) {
    case 'DOWNLOAD':
      response = await dio.download(
        url,
        savePathDownload,
        options: Options(
          headers: {
            HttpHeaders.acceptEncodingHeader: '*',
          },
          followRedirects: false,
        ),
        deleteOnError: true,
        onReceiveProgress: onReceiveProgress,
        cancelToken: tokenCancel,
      );
      break;
    default:
      response = await dio.request(
        apiUrl,
        data: body,
        queryParameters: params,
        onSendProgress: onReceiveProgress,
        cancelToken: tokenCancel,
      );
      break;
  }
  return response;
}

Dio addInterceptors(Dio dio, String apiUrl) {
  return dio
    ..interceptors.add(
      InterceptorsWrapper(
        onError: (dioError, handler) =>
            errorInterceptor(dioError, handler, apiUrl),
      ),
    );
}

dynamic errorInterceptor(
    DioError err, ErrorInterceptorHandler handler, String path) async {
  if (err.error is SocketException) {
    return DioError(
      requestOptions: RequestOptions(path: path),
      error: 'noInternetConnection'.tr,
      response: Response(
        data: {'message': 'noInternetConnection'.tr},
        requestOptions: RequestOptions(path: path),
      ),
    );
  }
  return handler.next(err);
}
