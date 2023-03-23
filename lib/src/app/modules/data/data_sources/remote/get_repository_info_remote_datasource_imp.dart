import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:repository_explorer/src/app/modules/data/data_sources/remote/get_repository_info_remote_datasource.dart';

final $GetRepositoryInfoRemoteDatasourceImpl =
    Bind.singleton((i) => GetRepositoryInfoRemoteDatasourceImpl());

class GetRepositoryInfoRemoteDatasourceImpl
    implements GetRepositoryInfoRemoteDatasource {
  final httpClient = Dio();

  @override
  Future<List<Map<String, dynamic>>> call() async {
    httpClient.options.baseUrl = 'http://api.github.com';
    httpClient.options.connectTimeout = const Duration(seconds: 5);
    httpClient.options.receiveTimeout = const Duration(seconds: 3);

    var res = await httpClient.get('/users/flutter/repos');
    return List.from(res.data);
  }
}
