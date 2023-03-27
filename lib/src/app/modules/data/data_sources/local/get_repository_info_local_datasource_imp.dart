import 'dart:convert';
import 'dart:io';
import 'package:path/path.dart';

import 'package:path_provider/path_provider.dart';
import 'package:repository_explorer/src/app/config/data_repository_info_constants.dart';
import 'package:repository_explorer/src/app/modules/data/data_sources/local/get_repository_info_local_datasource.dart';
import 'package:repository_explorer/src/app/modules/data/dto/repository_info_dto.dart';
import 'package:sqflite/sqflite.dart';

class RepositoryInfoLocal implements GetRepositoryInfoLocalDatasource {
  static Database? _database;
  static final RepositoryInfoLocal db = RepositoryInfoLocal._();

  RepositoryInfoLocal._();

  Future<Database> get database async {
    // If database exists, return database
    if (_database != null) return _database!;

    // If database don't exists, create one
    _database = await initDB();

    return _database!;
  }

  // Create the database and the repository table
  Future initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, DATABASE_NAME);

    return await openDatabase(
      path,
      version: 1,
      onOpen: (db) {},
      onCreate: (db, version) async {
        await db.execute(CREATE_REPOSITORY_TABLE_SCRIPT);
      },
    );
  }

  // Insert repository
  insert(RepositoryInfoDto repositoryInfo) async {
    try {
      final Database db = await initDB();

      repositoryInfo.idRepository =
          await db.rawInsert('''insert into $REPOSITORY_TABLE_NAME(
          $REPOSITORY_COLUMN_REPOSITORYID, $REPOSITORY_COLUMN_NAME, $REPOSITORY_COLUMN_DESCRIPTION,
          $REPOSITORY_COLUMN_CREATE_AT, $REPOSITORY_COLUMN_LANGUAGE,
          $REPOSITORY_COLUMN_STARGAZERS_COUNT)
          VALUES(
            '${repositoryInfo.idRepository}', '${repositoryInfo.name}', '${repositoryInfo.description}',
            '${repositoryInfo.dateCreate}', '${repositoryInfo.qtdNumberStar}',
            '${repositoryInfo.language}')
        ''');
    } catch (e) {
      return;
    }
  }

  // get list repository save
  Future<List<RepositoryInfoDto>> getRepositorySave() async {
    try {
      final Database db = await initDB();

      final List<Map<String, dynamic>> repositoryInfoMap = await db.query(
        REPOSITORY_TABLE_NAME,
      );

      return List.generate(repositoryInfoMap.length, (index) {
        return RepositoryInfoDto.fromJson(repositoryInfoMap[index]);
      });
    } catch (e) {
      return List.empty();
    }
  }

  Future<bool> deleteId(int id) async {
    try {
      final db = await database;
      db.delete(REPOSITORY_TABLE_NAME, where: "repositoryID = $id");
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<int> deleteAll() async {
    final db = await database;
    final res = await db.rawDelete('DELETE FROM repository');
    return res;
  }
}
