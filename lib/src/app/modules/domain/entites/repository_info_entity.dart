import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class RepositoryInfoEntity extends Equatable {
  late int? idRepository;
  final String name;
  final String description;
  final String dateCreate;
  final String qtdNumberStar;
  final String language;

  RepositoryInfoEntity({
    this.idRepository,
    required this.name,
    required this.description,
    required this.dateCreate,
    required this.qtdNumberStar,
    required this.language,
  });

  @override
  List<Object?> get props => [idRepository];
}
