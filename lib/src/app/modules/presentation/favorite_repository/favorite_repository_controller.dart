import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:repository_explorer/src/app/modules/data/data_sources/local/get_repository_info_local_datasource_imp.dart';
import 'package:repository_explorer/src/app/modules/data/dto/repository_info_dto.dart';
import 'package:repository_explorer/src/app/modules/presentation/repository_info/store/repository_info_store.dart';

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
    repositoryInfoStore.listRepositoryFavorite.clear();
    var res = await RepositoryInfoLocal.db.getRepositorySave();
    repositoryInfoStore.listRepositoryFavorite.addAll(res);
  }

  Future<void> deleteFavoriteRepository({
    required BuildContext context,
    required int idRepository,
    required RepositoryInfoDto repositoryDto,
  }) async {
    await RepositoryInfoLocal.db.deleteId(idRepository);

    repositoryInfoStore.checkDeleteRepository(
      id: idRepository,
      dto: repositoryDto,
    );
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Repositório excluido com sucesso'),
      ),
    );
  }
}
