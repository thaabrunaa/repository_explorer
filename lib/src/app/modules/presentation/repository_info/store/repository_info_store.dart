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
  ObservableList<RepositoryInfoDto> listRepositoryFavorite =
      ObservableList<RepositoryInfoDto>();

  @observable
  int qtdNumberFavorite = 0;

  ObservableList<RepositoryInfoDto> listRepositoryDto =
      ObservableList<RepositoryInfoDto>();

  @action
  remove(int index) {
    listRepositoryDto.removeAt(index);
  }

  @action
  void checkSaveRepository(RepositoryInfoDto dto) {
    qtdNumberFavorite++;

    int index = listRepositoryDto
        .indexWhere((element) => element.idRepository == dto.idRepository);

    dto = dto.copyWith(isButtonSave: toggleSave(index));
    remove(index);
    listRepositoryDto.insert(index, dto);
  }

  @action
  void checkDeleteRepository(
      {required RepositoryInfoDto dto, required int id}) {
    qtdNumberFavorite--;
    listRepositoryFavorite.removeWhere((item) => item.idRepository == id);

    int index = listRepositoryDto
        .indexWhere((element) => element.idRepository == dto.idRepository);
    dto = dto.copyWith(isButtonSave: toggleSave(index));
    remove(index);
    listRepositoryDto.insert(index, dto);
    print(listRepositoryDto);
  }

  @observable
  List<bool> isToggleSave = [];

  @action
  toggleSave(int index) {
    isToggleSave[index] = !isToggleSave[index];
  }
}
