import 'package:flutter/material.dart';

// Para criar um snackbar é necessário o contexto do widget pai
showSnackBar(
    {required BuildContext context,
    required String mensagem,
    bool isErro = true}) {
  SnackBar snackBar = SnackBar(
    content: Text(mensagem),
    backgroundColor: (isErro) ? Colors.red : Colors.green,
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
