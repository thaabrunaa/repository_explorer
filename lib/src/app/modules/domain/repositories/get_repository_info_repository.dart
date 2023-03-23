import 'package:repository_explorer/src/app/modules/domain/entites/repository_info_entity.dart';

abstract class GetRepositoryInfoRepository {
  Future<List<RepositoryInfoEntity>> call();
}
