import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ipheira/models/comunidade.dart';

class HomeComunidades extends StatefulWidget {
  const HomeComunidades({Key? key}) : super(key: key);

  @override
  State<HomeComunidades> createState() => _HomeComunidadesState();
}

class _HomeComunidadesState extends State<HomeComunidades> {
  List<Comunidade> comunidade = [];
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  void initState() {
    // TODO: implement initState
    refresh();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Comunidades"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            refresh();
          },
          child: const Icon(Icons.add),
        ),
        body: (comunidade.isEmpty)
            ? const Center(
                child: Text(
                  "Nenhuma Comunidade encontrada!\nCadastre uma comunidade primeiramente!",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18),
                ),
              )
            : ListView(
                children: List.generate(comunidade.length, (index) {
                Comunidade model = comunidade[index];
                return ListTile(
                  leading: const Icon(Icons.list_alt_rounded),
                  title: Text(model.nome_comunidade),
                  subtitle: Text(model.nome_comunidade),
                );
              })));
  }

  refresh() async {
    List<Comunidade> temp = [];
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await firestore.collection("comunidades").get();
    for (var doc in snapshot.docs) {
      print(doc.data());
      temp.add(Comunidade.fromMap(doc.data()));
    }
    ;

    setState(() {
      comunidade = temp;
    });
  }
}
