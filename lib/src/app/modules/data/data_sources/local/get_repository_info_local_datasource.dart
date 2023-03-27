import 'package:repository_explorer/src/app/modules/data/dto/repository_info_dto.dart';

abstract class GetRepositoryInfoLocalDatasource {
  Future initDB();

  insert(RepositoryInfoDto repositoryInfo);

  Future<List<RepositoryInfoDto>> getRepositorySave();

  Future<bool> deleteId(int id);

  Future<int> deleteAll();
}
