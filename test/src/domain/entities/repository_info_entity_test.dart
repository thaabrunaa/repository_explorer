import 'package:flutter_test/flutter_test.dart';
import 'package:repository_explorer/src/app/modules/domain/entites/repository_info_entity.dart';

main() {
  test('Espero que a entidade destinada a usuários não seja nula', () {
    RepositoryInfoEntity repositoryInfoEntity = RepositoryInfoEntity(
        name: 'thaabruna',
        description: 'teste descrição',
        dateCreate: '14-10-2022',
        qtdNumberStar: '8',
        language: 'dart');

    expect(repositoryInfoEntity, isNotNull);
  });
}
