import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _firebaseAuthn = FirebaseAuth.instance;

  entrarUsuario({required String email, required String senha}) {
    print("Metodo Logar");
  }

  Future<String?> cadastrarUsuario({ // Future<String?> => Funcção assincrona que permite retornar uma string ou não
    required String email,
    required String senha,
    required String nome,
    required String cpfCnpj,
    required bool ativo,
    required bool excluir,
    required String cep,
    required String dt_nasc,
    required String endereco,
    required String telefone,
    required int tipo_user, // 1 para cliente, 2 para lojista
    required int codLoja, // zero se não for lojista
  }) async {
    try {
      UserCredential userCredential = await _firebaseAuthn
          .createUserWithEmailAndPassword(email: email, password: senha);
      await userCredential.user!.updateDisplayName(nome);
      print("Cadastrar usuário");
    } on FirebaseAuthException catch (e) {
      switch(e.code){
        case "email-alredy-in-use":
          return "Email já está cadastrado!";
      }
      return e.code;
    }
    return null;
  }
}
