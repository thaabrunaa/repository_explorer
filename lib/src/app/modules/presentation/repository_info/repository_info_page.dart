import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:repository_explorer/src/app/modules/presentation/repository_info/repository_info_controller.dart';

import '../../data/dto/repository_info_dto.dart';

class RepositoryInfoPage extends StatefulWidget {
  const RepositoryInfoPage({super.key});

  @override
  State<RepositoryInfoPage> createState() => _RepositoryInfoPageState();
}

class _RepositoryInfoPageState extends State<RepositoryInfoPage> {
  final controller = Modular.get<RepositoryInfoController>();

  @override
  void initState() {
    super.initState();
    getInfoRepository();
  }

  void getInfoRepository() async {
    await controller.getInfoRepository();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF051615),
      appBar: AppBar(
        backgroundColor: const Color(0xFF051615),
        title: const Center(
          child: Text(
            'Lista de Repositórios',
            style: TextStyle(fontSize: 22),
          ),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 15),
            child: Row(
              children: [
                Observer(
                  builder: (_) {
                    return Text(
                      controller.repositoryInfoStore.qtdNumberFavorite
                          .toString(),
                      style: TextStyle(fontSize: 24),
                    );
                  },
                ),
                SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () => Navigator.of(context)
                      .pushNamed('./favoriteRepositoryPage'),
                  child: Icon(
                    Icons.save,
                    size: 30,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Observer(
        builder: (_) {
          return controller.repositoryInfoStore.listRepositoryDto.isEmpty ||
                  controller.repositoryInfoStore.listRepositoryDto == null
              ? Center(
                  child: CircularProgressIndicator(
                    color: Color(0xFF26BEBF),
                  ),
                )
              : ListView.builder(
                  itemCount:
                      controller.repositoryInfoStore.listRepositoryDto.length,
                  itemBuilder: (_, index) {
                    RepositoryInfoDto model =
                        controller.listInfoRepository[index];
                    return Column(
                      children: [
                        Container(
                          width: 400,
                          height: 250,
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: const Color(0xFF26BEBF),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                model.name,
                                style: const TextStyle(
                                  fontSize: 21,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(
                                model.description,
                                style: const TextStyle(
                                  fontSize: 21,
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Visibility(
                                    visible: model.language.isNotEmpty,
                                    child: MountIconText(
                                      icon: Icons.circle,
                                      qtdStar: model.language,
                                    ),
                                  ),
                                  MountIconText(
                                    icon: Icons.star_border_outlined,
                                    qtdStar: model.qtNumberStar,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              Observer(
                                builder: (_) {
                                  return controller.repositoryInfoStore
                                          .isToggleSave[index]
                                      ? Container(
                                          child: MountIconText(
                                            icon: Icons.check_circle,
                                            qtdStar:
                                                'Repositório salvo com sucesso',
                                          ),
                                        )
                                      : TextButton(
                                          style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all<
                                                    Color>(Colors.white),
                                            foregroundColor:
                                                MaterialStateProperty.all<
                                                    Color>(Colors.black),
                                          ),
                                          onPressed: () => {
                                            controller.insertRepositoryInfo(
                                              repositoryInfo: model,
                                              context: context,
                                            ),
                                          },
                                          child: Text(
                                            'Salvar repositório',
                                            style: TextStyle(fontSize: 20),
                                          ),
                                        );
                                },
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        )
                      ],
                    );
                  },
                );
        },
      ),
    );
  }
}

class MountIconText extends StatefulWidget {
  final IconData icon;
  final String qtdStar;
  const MountIconText({super.key, required this.icon, required this.qtdStar});

  @override
  State<MountIconText> createState() => _MountIconTextState();
}

class _MountIconTextState extends State<MountIconText> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(widget.icon, size: 24),
        Text(
          "${widget.qtdStar}",
          style: const TextStyle(fontSize: 18),
          maxLines: 2,
        ),
      ],
    );
  }
}
