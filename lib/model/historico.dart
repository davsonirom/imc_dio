// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class Historico {
  final String _id = UniqueKey().toString();
  final double _imc;
  final double _altura;
  final double _peso;
  final String _data;
  final String _classificacao;
  final Color _cor;
  Historico(
    this._imc,
    this._altura,
    this._peso,
    this._data,
    this._classificacao,
    this._cor,
  );

  String get id => _id;
  double get imc => _imc;
  double get altura => _altura;
  double get peso => _peso;
  String get date => _data;
  String get classificadao => _classificacao;
  Color get cor => _cor;

  set imc(double imc) => _imc;
  set altura(double altura) => _altura;
  set peso(double peso) => _peso;
  set data(String data) => _data;
  set classificacao(String classicacao) => _classificacao;
  set cor(Color cor) => _cor;
}
