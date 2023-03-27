import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:repository_explorer/src/app/modules/presentation/favorite_repository/favorite_repository_controller.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class FavoriteRepositoryPage extends StatefulWidget {
  static const String route = 'favoriteRepositoryPage';
  const FavoriteRepositoryPage({super.key});

  @override
  State<FavoriteRepositoryPage> createState() => _FavoriteRepositoryPageState();
}

class _FavoriteRepositoryPageState extends State<FavoriteRepositoryPage> {
  final controller = Modular.get<FavoriteRepositoryController>();

  @override
  void initState() {
    super.initState();
    getFavoriteRepository();
  }

  void getFavoriteRepository() async {
    await controller.getFavoriteRepository();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF051615),
      appBar: AppBar(
        backgroundColor: const Color(0xFF051615),
        title: const Center(
          child: Text(
            'Meus repositórios',
            style: TextStyle(fontSize: 22),
          ),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 15),
            child: Icon(
              Icons.star,
              size: 24,
              color: Color.fromARGB(255, 247, 189, 0),
            ),
          ),
        ],
      ),
      body: Observer(
        builder: (_) {
          return controller.repositoryInfoStore.listRepositoryFavorite.isEmpty
              ? Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      'Você ainda não possui nenhum repositório salvo :(',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 24,
                      ),
                    ),
                  ),
                )
              : ListView.builder(
                  itemCount: controller
                      .repositoryInfoStore.listRepositoryFavorite.length,
                  itemBuilder: (_, index) {
                    final model = controller
                        .repositoryInfoStore.listRepositoryFavorite[index];
                    return Column(
                      children: [
                        Container(
                          width: 400,
                          height: 250,
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 250, 175, 175),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    model.name,
                                    style: const TextStyle(
                                      fontSize: 24,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Observer(
                                builder: (_) {
                                  return TextButton(
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.white),
                                      foregroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.black),
                                    ),
                                    onPressed: () {
                                      controller.deleteFavoriteRepository(
                                        context: context,
                                        idRepository: model.idRepository!,
                                        repositoryDto: model,
                                      );
                                    },
                                    child: Text(
                                      'Excluir repositório',
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
