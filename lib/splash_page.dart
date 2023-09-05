import 'dart:async';

import 'package:flutter/material.dart';
import 'package:imc_dio/helps/app_image.dart';
import 'package:imc_dio/pages/historico/historico_imc_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 4), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => const HistoricoImcPage(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black45,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text(
            "Desafio proposto pelo curso de Flutter na ",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Center(
            child: Image.asset(
              AppImage.logoDio,
              fit: BoxFit.fill,
            ),
          ),
          const Text("Calculadora IMC com lista de histórico.",
              style: TextStyle(
                color: Colors.white60,
              ))
        ],
      ),
    );
  }
}
