import 'package:flutter/material.dart';
import 'package:ipheira/pages/communidades/home_comunidades.dart';
import 'package:ipheira/pages/login/component/show_snackbar.dart';
import 'package:ipheira/pages/login/register.dart';
import 'package:ipheira/utils/image_url.dart';

import '../../services/auth_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  //Objeto com as funcões de autenticação
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
                  // BEM-VINDO
                  RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                      text: 'Bem-vindo\n',
                      style: TextStyle(color: Colors.black, fontSize: 19),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'ao\n',
                          style: TextStyle(color: Colors.black, fontSize: 19),
                        ),
                        TextSpan(
                            text: 'Ipheira\n',
                            style: TextStyle(
                                color: Color.fromRGBO(77, 167, 104, 1),
                                fontSize: 19)),
                      ],
                    ),
                  ),
                  // EMAIL
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
                      // Validação do campo email
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
                  // PASSWORD
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
                  // BOTÃO LOGIN
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 18, horizontal: 8),
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _entrarUsuario(
                              email: emailController.text,
                              senha: passwordController.text);
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (newContext) => const RegisterForm()));
                    },
                    child: const Text(
                      'Ainda não tem conta? cadastre-se agora',
                      style: TextStyle(
                          decoration: TextDecoration.none,
                          color: Color.fromRGBO(0, 102, 51, 1)),
                    ),
                  ),
                  SizedBox(height: 15,),
                  GestureDetector(
                    onTap: () {},
                    child: const Text(
                      'Esqueceu a senha?',
                      style: TextStyle(
                          decoration: TextDecoration.none,
                          color: Colors.red),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // METODO DE AUTENTICAÇÃO FIREBASE
  _entrarUsuario({required String email, required String senha}) {
    authService.entrarUsuario(email: email, senha: senha).then((String? erro) {
      if (erro == null) {
        showSnackBar(context: context, mensagem: "Bem vindo!", isErro: false);
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (newContext) => const HomeComunidades()));
      } else {
        showSnackBar(context: context, mensagem: erro);
      }
    });
    // Navigator.push(context, MaterialPageRoute(builder: (newContext) => const HomeComunidades()));
  }
}
