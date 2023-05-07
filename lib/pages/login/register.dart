import 'package:flutter/material.dart';
import 'package:ipheira/pages/login/component/show_snackbar.dart';
import 'package:ipheira/services/auth_service.dart';
import 'package:ipheira/utils/image_url.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  int userTypeController = 1;

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
          child: Column(
            children: [
              const SizedBox(
                height: 75,
              ),
              SingleChildScrollView(
                child: Column(
                  children: [
                    //NOME
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        textAlign: TextAlign.start,
                        controller: nameController,
                        obscureText: false,
                        onChanged: (text) {
                          setState(() {});
                        },
                        keyboardType: TextInputType.visiblePassword,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Nome da Loja ou Cliente',
                          hintStyle: TextStyle(color: Colors.black),
                          fillColor: Color.fromRGBO(200, 200, 200, 1),
                          filled: true,
                        ),
                      ),
                    ),
                    // TIPO DE USUÁRIO
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          ListTile(
                            title: const Text("Lojista"),
                            leading: Radio<int>(
                              value: 1,
                              groupValue: userTypeController,
                              onChanged: (value) {
                                setState(() {
                                  userTypeController = value!;
                                });
                              },
                            )
                          ),
                          ListTile(
                              title: const Text("Cliente"),
                              leading: Radio<int>(
                                value: 2,
                                groupValue: userTypeController,
                                onChanged: (value) {
                                  setState(() {
                                    userTypeController = value!;
                                  });
                                },
                              )
                          )
                        ],
                      ),
                      // child: TextFormField(
                      //   textAlign: TextAlign.start,
                      //   controller: userTypeController,
                      //   obscureText: true,
                      //   onChanged: (text) {
                      //     setState(() {});
                      //   },
                      //   keyboardType: TextInputType.visiblePassword,
                      //   decoration: const InputDecoration(
                      //     border: OutlineInputBorder(),
                      //     hintText: 'Tipo de Usuário (1 ou 2)',
                      //     hintStyle: TextStyle(color: Colors.black),
                      //     fillColor: Color.fromRGBO(200, 200, 200, 1),
                      //     filled: true,
                      //   ),
                      // ),
                    ),
                    // EMAIL
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        textAlign: TextAlign.start,
                        controller: emailController,
                        obscureText: false,
                        onChanged: (text) {
                          setState(() {});
                        },
                        keyboardType: TextInputType.visiblePassword,
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
                    // PASSWORD
                    Padding(
                      padding: const EdgeInsets.all(8.0),
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
                    // BOTÃO CADASTRAR
                    ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _criarUsuario(
                                email: emailController.text,
                                senha: passwordController.text,
                                nome: nameController.text);
                            // print(passwordController.text);
                            // print(emailController.text);
                            // print(userTypeController.text);
                            // print(nameController.text);
                          };

                        },
                        child: const Text("Cadastrar")),
                    const SizedBox(
                      height: 12,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Faça Login',
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Color.fromRGBO(0, 102, 51, 1)),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      )),
    );
  }

  // METODO DE CRIAÇÃO DE AUTENTICAÇÃO FIREBASE
  _criarUsuario({
    required String email,
    required String senha,
    required String nome,
  }){
    //String? erro = await authService.cadastrarUsuario(email: email, senha: senha, nome: nome, cpfCnpj: cpfCnpj, ativo: ativo, excluir: excluir, cep: cep, dt_nasc: dt_nasc, endereco: endereco, telefone: telefone, tipo_user: tipo_user, codLoja: codLoja)
    authService
        .cadastrarUsuario(
      email: email,
      senha: senha,
      nome: nome,
    )
        .then((String? erro) {
      if (erro == null) {
        showSnackBar(
            context: context,
            mensagem: "Usuário Cadastrado com sucesso!",
            isErro: false);
        Navigator.pop(context);
      } else {
        showSnackBar(context: context, mensagem: erro);
      }
    });
  }
}
