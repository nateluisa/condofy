import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../../../core/services/local_storage/settings_store.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final settingsStore = GetIt.I<SettingsStore>();
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Configurações'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Text(
            'Informações do usuário',
            style: theme.textTheme.titleLarge?.copyWith(
              color: theme.colorScheme.primary,
            ),
          ),
          const SizedBox(height: 8),
          Card(
            child: Column(
              children: [
                const ListTile(
                  leading: Icon(Icons.person),
                  title: Text('Nome do usuário'),
                  subtitle: Text('Nathália Camargo'),
                ),
                Observer(
                  builder: (_) {
                    return ListTile(
                      leading: const Icon(Icons.email),
                      title: const Text('E-mail'),
                      subtitle: Text(settingsStore.userEmail),
                    );
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          const Divider(),
          const SizedBox(height: 24),
           Text(
            'Preferências',
            style: theme.textTheme.titleLarge?.copyWith(
              color: theme.colorScheme.primary,
            ),
          ),
          const SizedBox(height: 8),
          Observer(
            builder: (_) {
              return Card(
                child: ListTile(
                  leading: const Icon(Icons.dark_mode_outlined),
                  title: const Text('Tema Escuro'),
                  trailing: Switch(
                    value: settingsStore.themeMode == ThemeMode.dark,
                    onChanged: (isDark) {
                      if (isDark) {
                        settingsStore.changeTheme(ThemeMode.dark);
                      } else {
                        settingsStore.changeTheme(ThemeMode.light);
                      }
                    },
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}