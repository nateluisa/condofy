import 'package:condofy/modules/home/ui/home_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import '../../../core/services/local_storage/local_storage_service.dart';
import '../../../core/services/local_storage/settings_store.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeStore store = GetIt.I<HomeStore>();
  final SettingsStore settingsStore = GetIt.I<SettingsStore>();
  final ILocalStorageService storageService = GetIt.I<ILocalStorageService>();

  void _logout() async {
    await storageService.setBool('isUserLoggedIn', false);
    await settingsStore.setUserEmail('');
    if (mounted) {
      context.go('/login');
    }
  }

  void _showLogoutDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Atenção', textAlign: TextAlign.center,),
          content: const Text('Você tem certeza que deseja sair do aplicativo?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancelar'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: const Text('Sair'),
              onPressed: () {
                Navigator.of(context).pop();
                _logout();
              },
            ),
          ],
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Meus Condomínios'),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: theme.colorScheme.primary,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.house_rounded, color: theme.colorScheme.onPrimary, size: 48),
                  const SizedBox(height: 12),
                  Text(
                    'Condofy',
                    style: theme.textTheme.headlineSmall?.copyWith(
                      color: theme.colorScheme.onPrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Observer(
                    builder: (_) {
                      return Text(
                        'Olá, ${settingsStore.userEmail}',
                        style: theme.textTheme.titleMedium?.copyWith(
                          color: theme.colorScheme.onPrimary,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Configurações'),
              onTap: () {
                Navigator.pop(context);
                context.push('/settings');
              },
            ),
            ListTile(
              leading: const Icon(Icons.public),
              title: const Text('Nosso Site'),
              onTap: () {
                Navigator.pop(context);
                context.push('/webview');
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Sair'),
              onTap: () {
                Navigator.pop(context);
                _showLogoutDialog();
              },
            ),
          ],
        ),
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


      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 6.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.home_outlined),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.bar_chart_outlined),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.message_outlined),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
                context.push('/settings');
              },
            ),
          ],
        ),
      ),
    );
  }
}