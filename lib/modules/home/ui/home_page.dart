import 'package:condofy/modules/home/ui/home_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeStore store = GetIt.I<HomeStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meus condomínios'),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
      ),
      body: Observer(
        builder: (_) {
          if (store.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (store.condominiums.isEmpty) {
            return const Center(child: Text('Nenhum condomínio encontrado.'));
          }

          return ListView.builder(
            itemCount: store.condominiums.length,
            itemBuilder: (context, index) {
              final condo = store.condominiums[index];
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Observer(
                    builder: (_) {
                      return ListTile(
                        leading: CircleAvatar(
                          child: Text(condo.name[0]),
                        ),
                        title: Text(condo.name),
                        subtitle: Text(condo.address),
                        trailing: IconButton(
                          icon: Icon(
                            condo.isFavorite ? Icons.favorite : Icons.favorite_border,
                            color: condo.isFavorite ? Colors.red : null,
                          ),
                          onPressed: () {
                            store.toggleFavorite(condo);
                          },
                        ),
                      );
                    }
                ),
              );
            },
          );
        },
      ),
    );
  }
}