import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get_it/get_it.dart';
import 'package:repository_explorer/src/app/app_module.dart';
import 'package:repository_explorer/src/app/app_widget.dart';

import 'src/app/modules/presentation/home/repository_info_store.dart';

void main() {
  GetIt.I.registerSingleton<RepositoryInfoStore>(RepositoryInfoStore());
  runApp(
    ModularApp(
      module: AppModule(),
      child: AppWidget(),
    ),
  );
}
