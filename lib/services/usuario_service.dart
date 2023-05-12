import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ipheira/models/usuario.dart';

class UsuarioService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<String?> cadastrarUsuario(Usuario usuario) async {
    try{
      await firestore.collection("usuario").doc(usuario.id_usuario.toString()).set(usuario.toMap());
    } on FirebaseException catch(e) {
      switch (e.code ){
        case "not-found":
          return "Usuário não encontrado";
      }
      print(e.code);
      return e.code;

    }
    return null;
  }
}