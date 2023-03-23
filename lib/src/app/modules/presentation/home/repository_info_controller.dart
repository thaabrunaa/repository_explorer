import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get_it/get_it.dart';
import 'package:repository_explorer/src/app/modules/data/data_sources/local/get_repository_info_local_datasource_imp.dart';
import 'package:repository_explorer/src/app/modules/data/dto/repository_info_dto.dart';
import 'package:repository_explorer/src/app/modules/domain/use_cases/get_repository_info_use_case.dart';
import 'package:repository_explorer/src/app/modules/presentation/home/repository_info_store.dart';

final $RepositoryInfoController = Bind.singleton(
  (i) => RepositoryInfoController(
    getRepositoryInfoUseCase: i(),
    repositoryInfoStore: i(),
  ),
);

class RepositoryInfoController {
  final GetRepositoryInfoUseCase getRepositoryInfoUseCase;
  final RepositoryInfoStore repositoryInfoStore;

  RepositoryInfoController({
    required this.getRepositoryInfoUseCase,
    required this.repositoryInfoStore,
  });

  List<RepositoryInfoDto> listInfoRepository = [];

  Future<void> getInfoRepository() async {
    RepositoryInfoLocal.db.deleteAll();
    var res = await getRepositoryInfoUseCase();

    if (!res.success) {
      return;
    }

    listInfoRepository = res.body as List<RepositoryInfoDto>;
  }

  Future<void> insertRepositoryInfo(
      {required RepositoryInfoDto repositoryInfo,
      required BuildContext context,
      required int idRepository}) async {
    await RepositoryInfoLocal.db.insert(
      RepositoryInfoDto(
        nameRepository: repositoryInfo.name,
        descriptionRepository: repositoryInfo.description,
        dtCreate: repositoryInfo.dateCreate,
        qtNumberStar: repositoryInfo.qtdNumberStar,
        language: repositoryInfo.language,
      ),
    );
    repositoryInfoStore.checkSaveRepository(idRepository);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Repositório salvo'),
      ),
    );
  }

  void goToPage() {
    Modular.to.navigate('/favoriteInfoPage');
  }
}
