import 'package:condofy/core/services/local_storage/local_storage_service.dart';
import 'package:mobx/mobx.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStoreBase with _$LoginStore;

abstract class _LoginStoreBase with Store {
  final ILocalStorageService _storage;
  _LoginStoreBase(this._storage);

  @observable
  String email = '';

  @observable
  String password = '';

  @observable
  bool isLoading = false;

  @observable
  String? errorMessage;

  @observable
  bool saveCredentials = false;

  @observable
  bool isPasswordVisible = false;

  @action
  void setEmail(String value) => email = value;

  @action
  void setPassword(String value) => password = value;

  @action
  void setSaveCredentials(bool value) => saveCredentials = value;

  @action
  void togglePasswordVisibility() => isPasswordVisible = !isPasswordVisible;

  @computed
  bool get areCredentialsValid => email.isNotEmpty && password.isNotEmpty;

  @action
  void loadSavedData() {
    final shouldLoad = _storage.getBool('saveCredentials');
    saveCredentials = shouldLoad;

    if (shouldLoad) {
      email = _storage.getString('savedEmail');
      password = _storage.getString('savedPassword');
    }
  }

  @action
  Future<bool> login() async {
    isLoading = true;
    errorMessage = null;
    await Future.delayed(const Duration(seconds: 2));

    if (email == 'teste@condofy.com' && password == '1234') {
      await _storage.setBool('isUserLoggedIn', true);
      await _storage.setBool('saveCredentials', saveCredentials);

      if (saveCredentials) {
        await _storage.setString('savedEmail', email);
        await _storage.setString('savedPassword', password);
      } else {
        await _storage.setString('savedEmail', '');
        await _storage.setString('savedPassword', '');
      }
      isLoading = false;
      return true;
    } else {
      errorMessage = 'Credenciais inválidas. Tente novamente.';
      isLoading = false;
      return false;
    }
  }
}