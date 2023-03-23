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
            'Repositórios Favoritos',
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: controller.repositoryInfoStore.listRepositoryFavorite.length,
        itemBuilder: (_, index) {
          final model =
              controller.repositoryInfoStore.listRepositoryFavorite[index];
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
                                MaterialStateProperty.all<Color>(Colors.white),
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.black),
                          ),
                          onPressed: () {
                            controller.deleteFavoriteRepository(
                              context: context,
                              idRepository: model.idRepository!,
                            );
                            setState(() {});
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
      ),
    );
  }
}
