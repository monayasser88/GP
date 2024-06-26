import 'package:dio/dio.dart';
import 'package:gp_project/cache/cache_helper.dart';
import 'package:gp_project/core/api/end_ponits.dart';


class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers[ApiKey.token] =
        CacheHelper().getData(key: ApiKey.token) != null
            ? '${CacheHelper().getData(key: ApiKey.token)}'
            : null;
        //options.headers['Accept-Language'] = "en";
        
    super.onRequest(options, handler);
  }
}
