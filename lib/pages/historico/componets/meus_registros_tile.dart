// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class MeusRegistrosTile extends StatelessWidget {
  final double altura;
  final double peso;
  final String data;
  final double imc;
  final String descricao;
  final Color cor;

  const MeusRegistrosTile({
    Key? key,
    required this.altura,
    required this.peso,
    required this.data,
    required this.imc,
    required this.descricao,
    required this.cor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      leading: CircleAvatar(
        radius: 28,
        backgroundColor: cor,
        child: Text("$imc"),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(data),
          Text(descricao),
        ],
      ),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Altura: $altura cm"),
          Text("Peso: $peso kg"),
        ],
      ),
    );
  }
}
