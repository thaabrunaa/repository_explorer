import 'package:flutter_modular/flutter_modular.dart';
import 'package:repository_explorer/src/app/modules/data/data_sources/remote/get_repository_info_remote_datasource_imp.dart';
import 'package:repository_explorer/src/app/modules/data/repositories/get_repository_info_repository_imp.dart';
import 'package:repository_explorer/src/app/modules/domain/use_cases/get_repository_info_use_case_imp.dart';
import 'package:repository_explorer/src/app/modules/presentation/favorite_repository/favorite_repository_controller.dart';
import 'package:repository_explorer/src/app/modules/presentation/favorite_repository/favorite_repository_page.dart';
import 'package:repository_explorer/src/app/modules/presentation/repository_info/repository_info_controller.dart';
import 'package:repository_explorer/src/app/modules/presentation/repository_info/repository_info_page.dart';
import 'package:repository_explorer/src/app/modules/presentation/repository_info/store/repository_info_store.dart';

class RepositoryInfoModule extends Module {
  @override
  final List<Bind> binds = [
    //Datasource
    $GetRepositoryInfoRemoteDatasourceImpl,

    //Repository
    $GetRepositoryInfoRepositoryImpl,

    //Usecase
    $GetRepositoryInfoUseCaseImp,

    //controller
    $RepositoryInfoController,
    $FavoriteRepositoryController,

    //store
    $RepositoryInfoStore,
  ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.initialRoute,
          child: (_, args) => const RepositoryInfoPage(),
        ),
        ChildRoute(
          '/favoriteRepositoryPage',
          child: (context, args) => FavoriteRepositoryPage(),
        )
      ];
}
