import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:repository_explorer/src/app/modules/data/data_sources/local/get_repository_info_local_datasource_imp.dart';
import 'package:repository_explorer/src/app/modules/data/dto/repository_info_dto.dart';
import 'package:repository_explorer/src/app/modules/domain/use_cases/get_repository_info_use_case.dart';
import 'package:repository_explorer/src/app/modules/presentation/repository_info/store/repository_info_store.dart';

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

    repositoryInfoStore.listRepositoryDto.addAll(listInfoRepository);

    repositoryInfoStore.isToggleSave =
        List<bool>.generate(listInfoRepository.length, (i) {
      return false;
    });
  }

  Future<void> insertRepositoryInfo({
    required RepositoryInfoDto repositoryInfo,
    required BuildContext context,
  }) async {
    await RepositoryInfoLocal.db.insert(
      RepositoryInfoDto(
        idRepository: repositoryInfo.idRepository,
        nameRepository: repositoryInfo.name,
        descriptionRepository: repositoryInfo.description,
        dtCreate: repositoryInfo.dateCreate,
        qtNumberStar: repositoryInfo.qtdNumberStar,
        language: repositoryInfo.language,
      ),
    );
    repositoryInfoStore.checkSaveRepository(repositoryInfo);
  }

  void goToPage() {
    Modular.to.navigate('/favoriteInfoPage');
  }
}
