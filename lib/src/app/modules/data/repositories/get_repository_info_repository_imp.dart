import 'package:flutter_modular/flutter_modular.dart';
import 'package:repository_explorer/src/app/modules/data/data_sources/remote/get_repository_info_remote_datasource.dart';
import 'package:repository_explorer/src/app/modules/data/dto/repository_info_dto.dart';
import 'package:repository_explorer/src/app/modules/domain/repositories/repository_info_repository.dart';

final $GetRepositoryInfoRepositoryImpl =
    Bind.singleton((i) => GetRepositoryInfoRepositoryImpl(i()));

class GetRepositoryInfoRepositoryImpl implements GetRepositoryInfoRepository {
  final GetRepositoryInfoRemoteDatasource _getRepositoryInfoRemoteDatasource;

  GetRepositoryInfoRepositoryImpl(this._getRepositoryInfoRemoteDatasource);

  @override
  Future<List<RepositoryInfoDto>> call() async {
    try {
      var res = await _getRepositoryInfoRemoteDatasource();
      return res.map((e) => RepositoryInfoDto.fromMap(e)).toList();
    } catch (e) {
      rethrow;
    }
  }
}
