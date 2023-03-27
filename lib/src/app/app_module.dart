import 'package:flutter_modular/flutter_modular.dart';
import 'package:repository_explorer/src/app/modules/presentation/favorite_repository/favorite_repository_page.dart';
import 'package:repository_explorer/src/app/modules/presentation/repository_info/repository_info_module.dart';

class AppModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/', module: RepositoryInfoModule()),
        ChildRoute(
          '/favoriteRepositoryPage',
          child: (context, args) => const FavoriteRepositoryPage(),
        ),
      ];
}
