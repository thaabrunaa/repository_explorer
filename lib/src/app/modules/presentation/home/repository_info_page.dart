import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:repository_explorer/src/app/modules/presentation/home/repository_info_controller.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

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
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF051615),
      appBar: AppBar(
        backgroundColor: const Color(0xFF051615),
        title: const Center(
          child: Text(
            'Repositórios',
            style: TextStyle(fontSize: 24),
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
      body: ListView.builder(
        itemCount: controller.listInfoRepository.length,
        itemBuilder: (_, index) {
          final model = controller.listInfoRepository[index];
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          model.name,
                          style: const TextStyle(
                            fontSize: 24,
                          ),
                        ),
                        MountStar(
                          qtdStar: model.qtNumberStar,
                        )
                      ],
                    ),
                    Text(
                      model.description,
                      style: const TextStyle(
                        fontSize: 24,
                      ),
                    ),
                    Text(
                      model.language,
                      style: const TextStyle(
                        fontSize: 24,
                      ),
                      maxLines: 2,
                    ),
                    Observer(
                      builder: (_) {
                        return TextButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.black),
                          ),
                          onPressed: () {
                            controller.insertRepositoryInfo(
                              repositoryInfo: model,
                              context: context,
                              idRepository: model.idRepository!,
                            );
                          },
                          child: Text(
                            'Salvar repositorio',
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
      ),
    );
  }
}

class MountStar extends StatefulWidget {
  final String qtdStar;
  const MountStar({super.key, required this.qtdStar});

  @override
  State<MountStar> createState() => _MountStarState();
}

class _MountStarState extends State<MountStar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "${widget.qtdStar}",
          style: const TextStyle(fontSize: 20),
        ),
        const Icon(Icons.star, size: 28),
      ],
    );
  }
}
