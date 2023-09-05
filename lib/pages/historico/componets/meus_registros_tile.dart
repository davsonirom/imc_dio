// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class MeusRegistrosTile extends StatelessWidget {
  const MeusRegistrosTile({
    Key? key,
    required this.imc,
    required this.cor,
    required this.data,
    required this.altura,
    required this.peso,
  }) : super(key: key);
  final double imc;
  final Color cor;
  final String data;
  final double altura;
  final double peso;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      leading: CircleAvatar(
        radius: 28,
        backgroundColor: cor,
        child: Text("$imc"),
      ),
      title: Text(data),
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
