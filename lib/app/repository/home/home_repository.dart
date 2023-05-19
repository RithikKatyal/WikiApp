

import 'package:wiki_app/app/repository/home/model/wiki_result.dart';
import 'package:wiki_app/app/repository/retro_client/retro_client.dart';
import 'package:wiki_app/resources/api_endpoints.dart';
import 'package:wiki_app/services/api/service_manager.dart';

class HomeRepository {
  ApiClient? _apiClient;

  HomeRepository() {
    var dioClient = ServiceManager.get().getDioClient(baseUrl: Apis.kBaseUrl);
    _apiClient = ApiClient(dioClient);
  }

  Future<WikiResults?> getSearchData(String keyword) async {
    try {
      var response = await _apiClient!.getSearchResultsByKeyword(keyword);
      return response;
    } on Exception {
      return null;
    }
  }
}
