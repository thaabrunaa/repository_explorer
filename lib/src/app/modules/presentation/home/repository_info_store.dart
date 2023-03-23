import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:repository_explorer/src/app/modules/data/dto/repository_info_dto.dart';

part 'repository_info_store.g.dart';

// flutter packages pub run build_runner build
final $RepositoryInfoStore = Bind.lazySingleton<RepositoryInfoStore>(
  (i) => RepositoryInfoStore(),
);
class RepositoryInfoStore = _RepositoryInfo with _$RepositoryInfoStore;

abstract class _RepositoryInfo with Store {
  @observable
  List<RepositoryInfoDto> listRepositoryFavorite = [];

  @observable
  int qtdNumberFavorite = 0;

  @observable
  bool isButtonSave = true;

  @action
  void checkSaveRepository(int id) {
    qtdNumberFavorite++;
    isButtonSave = true;
  }

  @action
  void checkDeleteRepository(int id) {
    qtdNumberFavorite--;
    listRepositoryFavorite.removeWhere((item) => item.idRepository == id);
    print(listRepositoryFavorite);
    isButtonSave = false;
  }
}
