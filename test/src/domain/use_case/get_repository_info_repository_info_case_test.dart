import 'package:flutter_test/flutter_test.dart';
import 'package:repository_explorer/src/app/modules/domain/entites/repository_info_entity.dart';
import 'package:repository_explorer/src/app/modules/domain/repositories/repository_info_repository.dart';
import 'package:repository_explorer/src/app/modules/domain/use_cases/get_repository_info_use_case.dart';
import 'package:repository_explorer/src/app/modules/domain/use_cases/get_repository_info_use_case_imp.dart';
import 'package:repository_explorer/src/app/shared/response/response_presentation.dart';

class GetRepositoryInfoRepositoryImpl implements GetRepositoryInfoRepository {
  @override
  Future<List<RepositoryInfoEntity>> call() async {
    return [
      RepositoryInfoEntity(
        description: 'teste para descrição 1',
        qtdNumberStar: '8',
        dateCreate: '14-10-2022',
        name: 'Thaísa',
        language: 'dart',
      ),
    ];
  }
}

main() {
  test('Espero que retorne uma instancia do responsePresentation', () {
    GetRepositoryInfoUseCase getUseCase =
        GetRepositoryInfoUseCaseImp(GetRepositoryInfoRepositoryImpl());

    var result = getUseCase();

    expect(result, isInstanceOf<Future<ResponsePresentation>>());
  });
}
