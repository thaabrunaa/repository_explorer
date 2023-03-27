import 'package:repository_explorer/src/app/config/data_repository_info_constants.dart';
import 'package:repository_explorer/src/app/modules/domain/entites/repository_info_entity.dart';

class RepositoryInfoDto extends RepositoryInfoEntity {
  Function? isButtonSave;
  late int? idRepository;
  final String nameRepository;
  final String descriptionRepository;
  final String dtCreate;
  final String qtNumberStar;
  final String language;
  RepositoryInfoDto({
    this.isButtonSave,
    this.idRepository,
    required this.nameRepository,
    required this.descriptionRepository,
    required this.dtCreate,
    required this.qtNumberStar,
    required this.language,
  }) : super(
            idRepository: idRepository,
            name: nameRepository,
            description: descriptionRepository,
            dateCreate: dtCreate,
            qtdNumberStar: qtNumberStar,
            language: language);

  Map<String, dynamic> toMap() {
    return {
      'id': idRepository,
      'name': nameRepository,
      'description': descriptionRepository,
      'created_at': dtCreate,
      'stargazers_count': qtNumberStar,
      'language': language,
    };
  }

  factory RepositoryInfoDto.fromMap(Map map) {
    return RepositoryInfoDto(
      idRepository: map['id'],
      nameRepository: map['name'] ?? '',
      descriptionRepository: map['description'] ?? '',
      dtCreate: map['created_at'] ?? '',
      language: map['language'] ?? '',
      qtNumberStar: map['stargazers_count'].toString(),
    );
  }

  factory RepositoryInfoDto.fromJson(Map<String, Object?> map) {
    return RepositoryInfoDto(
      idRepository: (map[REPOSITORY_COLUMN_REPOSITORYID] as num).toInt(),
      nameRepository: (map[REPOSITORY_COLUMN_NAME] as String).toString(),
      descriptionRepository:
          (map[REPOSITORY_COLUMN_DESCRIPTION] as String).toString(),
      dtCreate: (map[REPOSITORY_COLUMN_CREATE_AT] as String).toString(),
      language: (map[REPOSITORY_COLUMN_LANGUAGE] as String).toString(),
      qtNumberStar:
          (map[REPOSITORY_COLUMN_STARGAZERS_COUNT] as String).toString(),
    );
  }

  RepositoryInfoDto copyWith({
    Function? isButtonSave,
    int? idRepository,
    String? nameRepository,
    String? descriptionRepository,
    String? dtCreate,
    String? qtNumberStar,
    String? language,
  }) {
    return RepositoryInfoDto(
      isButtonSave: isButtonSave ?? this.isButtonSave,
      idRepository: idRepository ?? this.idRepository,
      nameRepository: nameRepository ?? this.nameRepository,
      descriptionRepository:
          descriptionRepository ?? this.descriptionRepository,
      dtCreate: dtCreate ?? this.dtCreate,
      language: language ?? this.language,
      qtNumberStar: qtNumberStar ?? this.qtNumberStar,
    );
  }
}
