import 'package:flutter/material.dart';
import 'package:ipheira/pages/register.dart';
import 'package:ipheira/utils/image_url.dart';

import '../services/auth_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        body: Center(
          child: Container(
            height: 1000,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(ImageUrl.background.value),
                    fit: BoxFit.scaleDown,
                    alignment: Alignment.bottomCenter // alterado aqui
                    ),
                color: Colors.white),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Container(
                    color: Colors.white,
                    height: 200,
                    width: 225,
                    child: Image.network(
                      ImageUrl.logo.value,
                      fit: BoxFit.fill,
                    ),
                  ),
                  RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                      text: 'Bem-vindo\n',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 21),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'ao\n',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 21),
                        ),
                        TextSpan(
                            text: 'Ipheira\n',
                            style: TextStyle(
                                color: Color.fromRGBO(77, 167, 104, 1),
                                fontSize: 21,
                                fontWeight: FontWeight.bold
                            )),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: TextFormField(
                      textAlign: TextAlign.start,
                      onChanged: (text) {
                        setState(() {});
                      },
                      controller: emailController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Email',
                        hintStyle: TextStyle(color: Colors.black),
                        fillColor: Color.fromRGBO(200, 200, 200, 1),
                        filled: true,
                      ),
                      validator: (value) {
                        if (value == null || value == "") {
                          return "O valor de email deve ser preenchido";
                        }
                        if (!value.contains("@") ||
                            !value.contains(".") ||
                            value.length < 4) {
                          return "O email deve ser válido";
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: TextFormField(
                      textAlign: TextAlign.start,
                      controller: passwordController,
                      obscureText: true,
                      onChanged: (text) {
                        setState(() {});
                      },
                      keyboardType: TextInputType.visiblePassword,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Senha',
                        hintStyle: TextStyle(color: Colors.black),
                        fillColor: Color.fromRGBO(200, 200, 200, 1),
                        filled: true,
                      ),
                      validator: (value) {
                        if (value == null || value.length < 4) {
                          return "A senha deve ser válida";
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 20, horizontal: 8),
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          print(emailController.text);
                          print(passwordController.text);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          textStyle: const TextStyle(fontSize: 18),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 33, vertical: 13)),
                      child: const Text("Login"),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (newContext) => const RegisterForm()));
                    },
                    child: const Text(
                      'Ainda não tem conta? cadastre-se agora',
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Color.fromRGBO(0, 102, 51, 1)),
                    ),
                  ),
                  const SizedBox(height: 12,),
                  GestureDetector(
                    onTap: () {

                    },
                    child: const Text(
                      'Esqueceu a senha?',
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Colors.red),
                    ),
                  ),
                  const SizedBox(height: 25,),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  botaoEnviarClicado() {
    String email = emailController.text;
    String senha = passwordController.text;
    //String nome = _nomeController.text;

    // if (_formKey.currentState!.validate()) {
    //   if (isEntrando) {
    //     _entrarUsuario(email: email, senha: senha);
    //   } else {
    //     _criarUsuario(email: email, senha: senha, nome: nome);
    //   }
    // }
  }

  // _criarUsuario(
  //     {required String email, required String senha, required String nome, }) async {
  //   String? erro = await authService.cadastrarUsuario(email: email, senha: senha, nome: nome, cpfCnpj: cpfCnpj, ativo: ativo, excluir: excluir, cep: cep, dt_nasc: dt_nasc, endereco: endereco, telefone: telefone, tipo_user: tipo_user, codLoja: codLoja)
  //   if(erro == null) {
  //     print("Usuário Cadastrado");
  //   } else {
  //     print(erro);
  //   }
  //   print("Criar usuário $email, $senha, $nome");
  // }

  _entrarUsuario({required String email, required String senha}) {
    authService.entrarUsuario(email: email, senha: senha);
  }
}
