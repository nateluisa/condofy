import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'login_store.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginStore store = GetIt.I<LoginStore>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    store.loadSavedData();

    _emailController.text = store.email;
    _passwordController.text = store.password;
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              Icon(Icons.house_rounded,
                  size: 80, color: theme.colorScheme.primary),
              const SizedBox(height: 16),
              Text('Bem-vindo(a) ao Condofy',
                  textAlign: TextAlign.center,
                  style: theme.textTheme.headlineMedium
                      ?.copyWith(fontWeight: FontWeight.bold)),
              const SizedBox(height: 68),
              TextField(
                controller: _emailController,
                onChanged: store.setEmail,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'E-mail',
                  prefixIcon: Icon(Icons.person_outline),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                ),
              ),
              const SizedBox(height: 16),
              Observer(builder: (_) {
                return TextField(
                  controller: _passwordController,
                  onChanged: store.setPassword,
                  obscureText: !store.isPasswordVisible,
                  decoration: InputDecoration(
                    labelText: 'Senha',
                    prefixIcon: const Icon(Icons.lock_outline),
                    suffixIcon: IconButton(
                      icon: Icon(store.isPasswordVisible
                          ? Icons.visibility_off
                          : Icons.visibility),
                      onPressed: store.togglePasswordVisibility,
                    ),
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                  ),
                );
              }),
              const SizedBox(height: 16),
              Observer(builder: (_) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Salvar informações de login?'),
                    Switch(
                      value: store.saveCredentials,
                      onChanged: (value) => store.setSaveCredentials(value),
                    ),
                  ],
                );
              }),
              const SizedBox(height: 16),
              Observer(builder: (_) {
                if (store.errorMessage != null) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(store.errorMessage!,
                        style: TextStyle(color: theme.colorScheme.error),
                        textAlign: TextAlign.center),
                  );
                }
                return const SizedBox.shrink();
              }),
              Observer(builder: (_) {
                return ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  onPressed: store.areCredentialsValid && !store.isLoading
                      ? () async {
                          final isLoggedIn = await store.login();
                          if (isLoggedIn && mounted) {
                            context.go('/home');
                          }
                        }
                      : null,
                  child: store.isLoading
                      ? const SizedBox(
                          height: 24,
                          width: 24,
                          child: CircularProgressIndicator(
                              color: Colors.white, strokeWidth: 2))
                      : const Text('Entrar', style: TextStyle(fontSize: 16)),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
