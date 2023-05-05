import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:ipheira/utils/image_url.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(ImageUrl.background.value),
              fit: BoxFit.scaleDown,
              alignment: Alignment.bottomCenter
            ),
            color: Colors.white
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                color: Colors.white,
                height: 200,
                width: 225,
                child: Image.network(ImageUrl.logo.value, fit: BoxFit.fill,),
              ),
              RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  text: 'Bem-vindo\n',
                  style: TextStyle(color: Colors.black, fontSize: 16),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'ao\n',
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                    TextSpan(
                      text: 'Ipheira\n',
                      style: TextStyle(color: Color.fromRGBO(77,167,104,1),
                          fontSize: 16
                    )),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: TextFormField(
                  textAlign: TextAlign.start,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Email',
                    hintStyle: TextStyle(color: Colors.black),
                    fillColor: Color.fromRGBO(200,200,200,1),
                    filled: true,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: TextFormField(
                  textAlign: TextAlign.start,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Senha',
                    hintStyle: TextStyle(color: Colors.black),
                    fillColor: Color.fromRGBO(200,200,200,1),
                    filled: true,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 8),
                child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 18),
                      padding: const EdgeInsets.symmetric(horizontal: 33, vertical: 13)
                    ),
                    child: const Text("Login"),
                ),
              ),
              GestureDetector(
                onTap: () {
                  // ação a ser executada ao clicar no hyperlink
                },
                child: const Text(
                  'Ainda não tem conta? cadastre-se agora',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: Color.fromRGBO(0,102,51,1)
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  // ação a ser executada ao clicar no hyperlink
                },
                child: const Text(
                  'Esqueceu a senha?',
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Colors.red
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
