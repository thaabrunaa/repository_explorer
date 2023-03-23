import 'package:flutter_test/flutter_test.dart';
import 'package:repository_explorer/src/app/modules/data/data_sources/remote/get_repository_info_remote_datasource.dart';
import 'package:repository_explorer/src/app/modules/data/data_sources/remote/get_repository_info_remote_datasource_imp.dart';

import 'package:repository_explorer/src/app/modules/data/repositories/get_repository_info_repository_imp.dart';
import 'package:repository_explorer/src/app/modules/domain/repositories/get_repository_info_repository.dart';

main() {
  test('Espero que o retorno não seja nulo ', () {
    GetRepositoryInfoRemoteDatasource datasource =
        GetRepositoryInfoRemoteDatasourceImpl();
    GetRepositoryInfoRepository repository =
        GetRepositoryInfoRepositoryImpl(datasource);

    var result = repository();

    expect(result, isNotNull);
  });
}
