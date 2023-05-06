import 'package:flutter/material.dart';
import 'package:ipheira/utils/image_url.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController userTypeController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              const SizedBox(height: 75,),
              SingleChildScrollView(
                child: Column(
                  children: [
                    TextFormField(
                      textAlign: TextAlign.start,
                      controller: nameController,
                      obscureText: true,
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
                    TextFormField(
                      textAlign: TextAlign.start,
                      controller: userTypeController,
                      obscureText: true,
                      onChanged: (text) {
                        setState(() {});
                      },
                      keyboardType: TextInputType.visiblePassword,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Tipo de Usuário (1 ou 2)',
                        hintStyle: TextStyle(color: Colors.black),
                        fillColor: Color.fromRGBO(200, 200, 200, 1),
                        filled: true,
                      ),
                    ),
                    TextFormField(
                      textAlign: TextAlign.start,
                      controller: emailController,
                      obscureText: true,
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
                    ),
                    TextFormField(
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
                    ),
                    ElevatedButton(
                        onPressed: (){
                          print(passwordController.text);
                          print(emailController.text);
                          print(userTypeController.text);
                          print(nameController.text);
                        },
                        child: const Text("Cadastrar")
                    ),
                    const SizedBox(height: 12,),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Faça Login',
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Color.fromRGBO(0, 102, 51, 1)
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}
