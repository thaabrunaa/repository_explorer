import 'package:flutter_modular/flutter_modular.dart';
import 'package:repository_explorer/src/app/modules/domain/repositories/repository_info_repository.dart';
import 'package:repository_explorer/src/app/modules/domain/use_cases/get_repository_info_use_case.dart';
import 'package:repository_explorer/src/app/shared/response/response_presentation.dart';

final $GetRepositoryInfoUseCaseImp = Bind.singleton(
  (i) => GetRepositoryInfoUseCaseImp(i()),
);

class GetRepositoryInfoUseCaseImp implements GetRepositoryInfoUseCase {
  final GetRepositoryInfoRepository _GetRepositoryInfoRepository;

  GetRepositoryInfoUseCaseImp(this._GetRepositoryInfoRepository);

  @override
  Future<ResponsePresentation> call() async {
    try {
      var res = await _GetRepositoryInfoRepository();
      return ResponsePresentation(success: true, body: res);
    } catch (e) {
      return ResponsePresentation(success: false, message: e.toString());
    }
  }
}
