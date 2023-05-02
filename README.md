# Firebase Flutter
## Configuração Glogal
* Installar Node
* npm install -g firebase-tools
* firebase login
* firebase projects:list
* Adicione esse caminho nas variáveis de ambiente C:\Users\victor.nascimento\AppData\Local\Pub\Cache\bin
* dart pub global activate flutterfire_cli

## No seu projeto
Os comandos a seguir devem ser feitos no diretório raiz do projeto
* flutterfire configure (toda vez que for instalado uma biblioteca nova do firebase)
* flutter pub add firebase_core
* flutter pub add cloud_firestore
* flutterfire configure
* colar o segunte import na main :

import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';

* colar o seguinte código antes da run:

void main() async {
WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp(
options: DefaultFirebaseOptions.currentPlatform,
);
runApp(const MaterialApp(home: MyApp(),));
}

## Configuração na pasta android
* entre no arquivo android/app/build.gradle
* Edite o valor de minSdkVersion para 19
* Adicione uma chave/valor multiDexEnabled true