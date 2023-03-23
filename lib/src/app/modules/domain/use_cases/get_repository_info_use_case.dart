import 'package:repository_explorer/src/app/shared/response/response_presentation.dart';

abstract class GetRepositoryInfoUseCase {
  Future<ResponsePresentation> call();
}
