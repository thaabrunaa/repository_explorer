import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:repository_explorer/src/app/modules/data/data_sources/local/get_repository_info_local_datasource_imp.dart';
import 'package:repository_explorer/src/app/modules/presentation/home/repository_info_store.dart';

final $FavoriteRepositoryController = Bind.singleton(
  (i) => FavoriteRepositoryController(
    repositoryInfoStore: i(),
  ),
);

class FavoriteRepositoryController {
  final RepositoryInfoStore repositoryInfoStore;

  FavoriteRepositoryController({
    required this.repositoryInfoStore,
  });

  Future<void> getFavoriteRepository() async {
    var res = await RepositoryInfoLocal.db.getRepositorySave();

    repositoryInfoStore.listRepositoryFavorite = res;
  }

  Future<void> deleteFavoriteRepository(
      {required BuildContext context, required int idRepository}) async {
    await RepositoryInfoLocal.db.deleteId(idRepository);

    repositoryInfoStore.checkDeleteRepository(idRepository);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Repositório excluido com sucesso'),
      ),
    );
  }
}
