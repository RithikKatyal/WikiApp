import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_hive_store/dio_cache_interceptor_hive_store.dart';
import 'package:path_provider/path_provider.dart';
import 'package:retrofit/http.dart';
import 'package:wiki_app/app/repository/home/model/wiki_result.dart';
import 'package:wiki_app/core_utils/path_provider.dart';
import 'package:wiki_app/resources/api_endpoints.dart';

part 'retro_client.g.dart';

@RestApi()
abstract class ApiClient {
  factory ApiClient(
    Dio dio,
  ) {
    dio.interceptors.add(
        DioCacheInterceptor(
          options: CacheOptions(
            store: HiveCacheStore(PathProvider.path),
            policy: CachePolicy.refreshForceCache,
            hitCacheOnErrorExcept: [],
            maxStale: const Duration(
              days: 10,
            ), //increase number of days for loger cache
            priority: CachePriority.high,
          ),
        ));
    return _ApiClient(dio);
  }


  @GET('${Apis.kBaseUrl}/api.php?format=json&gsrsearch={keyWord}${Apis.kGetSearchByKeyword}')
  Future<WikiResults> getSearchResultsByKeyword(
      @Path('keyWord') String keyword);
}