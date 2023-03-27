// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repository_info_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RepositoryInfoStore on _RepositoryInfo, Store {
  late final _$listRepositoryFavoriteAtom =
      Atom(name: '_RepositoryInfo.listRepositoryFavorite', context: context);

  @override
  ObservableList<RepositoryInfoDto> get listRepositoryFavorite {
    _$listRepositoryFavoriteAtom.reportRead();
    return super.listRepositoryFavorite;
  }

  @override
  set listRepositoryFavorite(ObservableList<RepositoryInfoDto> value) {
    _$listRepositoryFavoriteAtom
        .reportWrite(value, super.listRepositoryFavorite, () {
      super.listRepositoryFavorite = value;
    });
  }

  late final _$qtdNumberFavoriteAtom =
      Atom(name: '_RepositoryInfo.qtdNumberFavorite', context: context);

  @override
  int get qtdNumberFavorite {
    _$qtdNumberFavoriteAtom.reportRead();
    return super.qtdNumberFavorite;
  }

  @override
  set qtdNumberFavorite(int value) {
    _$qtdNumberFavoriteAtom.reportWrite(value, super.qtdNumberFavorite, () {
      super.qtdNumberFavorite = value;
    });
  }

  late final _$isToggleSaveAtom =
      Atom(name: '_RepositoryInfo.isToggleSave', context: context);

  @override
  List<bool> get isToggleSave {
    _$isToggleSaveAtom.reportRead();
    return super.isToggleSave;
  }

  @override
  set isToggleSave(List<bool> value) {
    _$isToggleSaveAtom.reportWrite(value, super.isToggleSave, () {
      super.isToggleSave = value;
    });
  }

  late final _$_RepositoryInfoActionController =
      ActionController(name: '_RepositoryInfo', context: context);

  @override
  dynamic remove(int index) {
    final _$actionInfo = _$_RepositoryInfoActionController.startAction(
        name: '_RepositoryInfo.remove');
    try {
      return super.remove(index);
    } finally {
      _$_RepositoryInfoActionController.endAction(_$actionInfo);
    }
  }

  @override
  void checkSaveRepository(RepositoryInfoDto dto) {
    final _$actionInfo = _$_RepositoryInfoActionController.startAction(
        name: '_RepositoryInfo.checkSaveRepository');
    try {
      return super.checkSaveRepository(dto);
    } finally {
      _$_RepositoryInfoActionController.endAction(_$actionInfo);
    }
  }

  @override
  void checkDeleteRepository(
      {required RepositoryInfoDto dto, required int id}) {
    final _$actionInfo = _$_RepositoryInfoActionController.startAction(
        name: '_RepositoryInfo.checkDeleteRepository');
    try {
      return super.checkDeleteRepository(dto: dto, id: id);
    } finally {
      _$_RepositoryInfoActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic toggleSave(int index) {
    final _$actionInfo = _$_RepositoryInfoActionController.startAction(
        name: '_RepositoryInfo.toggleSave');
    try {
      return super.toggleSave(index);
    } finally {
      _$_RepositoryInfoActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
listRepositoryFavorite: ${listRepositoryFavorite},
qtdNumberFavorite: ${qtdNumberFavorite},
isToggleSave: ${isToggleSave}
    ''';
  }
}
