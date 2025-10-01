Como rodar o projeto 

Pré-requisitos
Instalar o Flutter SDK 
 
Instale as dependências:
flutter pub get


Execute o gerador de código (Build Runner):
Este passo é essencial para que o MobX funcione corretamente, executar o comando no terminal na raiz do projeto.
flutter pub run build_runner build --delete-conflicting-outputs


Execute o aplicativo:
Necessitra que um emulador esteja rodando ou que um dispositivo fisico esteja conectado.
flutter run


Credenciais pra acesso
Para acessar o aplicativo, utilize as seguintes credenciais mockadas:

E-mail: teste@condofy.com

Senha: 1234