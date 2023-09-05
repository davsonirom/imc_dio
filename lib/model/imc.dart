import 'dart:math';

import 'package:flutter/material.dart';

abstract class Imc {
  static calulcarIMC(double altura, double peso) {
// IMC = Peso ÷ (Altura × Altura)
// Exemplo de como calcular o IMC:
// IMC = 80 kg ÷ (1,80 m × 1,80 m) = 24,69 kg/m2 (Peso ideal)

    double imc = peso / pow(altura, 2);
    return imc;
  }

  static precisaoDecimal(double imc) => imc.toStringAsPrecision(2);

  static Map classicacao(double imc) {
    Map<String, dynamic> classificacao = {};
    if (imc < 18.9) {
      classificacao['descricao'] = 'Abaixo do peso';
      classificacao['cor'] = Colors.blue.shade400;
    } else if (imc < 24.9) {
      classificacao['descricao'] = "Peso Ideal (continue com a boa saúde!)";
      classificacao['cor'] = Colors.green.shade400;
    } else if (imc < 29.9) {
      classificacao['descricao'] = "Levemente acima do peso";
      classificacao['cor'] = Colors.orange.shade400;
    } else if (imc < 34.9) {
      classificacao['descricao'] = "Obesidade grau I";
      classificacao['cor'] = Colors.red.shade200;
    } else if (imc < 39.9) {
      classificacao['descricao'] = "Obesidade grau II (severa)";
      classificacao['cor'] = Colors.red.shade300;
    } else if (imc > 40) {
      classificacao['descricao'] = "Obesidade III (mórbida)";
      classificacao['cor'] = Colors.red;
    }
    return classificacao;
  }
}
