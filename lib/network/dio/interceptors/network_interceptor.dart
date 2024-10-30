import 'package:dio/dio.dart';

import '../../../data/local_storage/local_storage_repository.dart';
import '../../../helpers/constants.dart';

class NetworkInterceptor extends Interceptor {
  final LocalStorageRepository localStorageRepository;
  NetworkInterceptor(this.localStorageRepository);

  // final String _tokenValue = "";

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    var body = response.data;
    if (body != null) {
      // if (body["token"] != null) {
      //   _tokenValue = body['token'];
      //   localStorageRepository.setValue(tokenKey, _tokenValue);
      // }
    }
    return handler.next(response);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    localStorageRepository.getValue(tokenKey).then(
          (result) => result.fold(
            (error) {},
            (token) {
              // options.headers['Authorization'] = 'Bearer $token';
            },
          ),
        );
    return handler.next(options);
  }
}
