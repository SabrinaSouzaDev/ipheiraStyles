import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  // Instancia o objeto _firebaseAuth com os recursos do Authentication
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // Método para autenticar o usuário
  Future<String?> entrarUsuario({required String email, required String senha}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: senha);
    } on FirebaseAuthException catch (e) {
      switch(e.code) {
        case "user-not-found":
          return "Usuário não encontrado";
        case "wrong-password":
          return "Senha incorreta";
      }
      print(e.code);
      return e.code;
    }
    return null;
  }

  // Metodo para cadastrar uma autenticação
  Future<String?> cadastrarUsuario({
    // Future<String?> => Funcção assincrona que permite retornar uma string ou não
    required String email,
    required String senha,
    required String nome,
  }) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: senha);
      await userCredential.user!.updateDisplayName(nome);
      print("Cadastrar usuário");
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "email-already-in-use":
          return "Email já está cadastrado!";
        case "weak-password":
          return "Senha muito fraca!";
      }
      return e.code;
    }
    return null;
  }
}
