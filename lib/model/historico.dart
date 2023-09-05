// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class Historico {
  final String _id = UniqueKey().toString();
  final double _imc;
  final double _altura;
  final double _peso;
  final DateTime _data;
  Historico(
    this._imc,
    this._altura,
    this._peso,
    this._data,
  );

  String get id => _id;
  double get imc => _imc;
  double get altura => _altura;
  double get peso => _peso;
  DateTime get date => _data;

  set imc(double imc) => _imc;
  set altura(double altura) => _altura;
  set peso(double peso) => _peso;
  set data(DateTime data) => _data;
}
