import 'package:flutter_modular/flutter_modular.dart';
import 'package:repository_explorer/src/app/modules/presentation/favorite_repository/favorite_repository_page.dart';
import 'package:repository_explorer/src/app/modules/presentation/home/repository_info_module.dart';

class AppModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/', module: HomeModule()),
        ChildRoute('/favoriteRepositoryPage',
            child: (context, args) => const FavoriteRepositoryPage()),
      ];
}
