import 'package:flutter/material.dart';
import 'package:imc_dio/helps/app_image.dart';
import 'package:intl/intl.dart';
import 'dart:math' as math;

import 'componets/meus_registros_tile.dart';

class HistoricoImc extends StatefulWidget {
  const HistoricoImc({super.key});

  @override
  State<HistoricoImc> createState() => _HistoricoImcState();
}

class _HistoricoImcState extends State<HistoricoImc> {
  final alturaEC = TextEditingController();
  final pesoEC = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    alturaEC.dispose();
    pesoEC.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Histórico IMC'),
      ),
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              //? grafico do imc "figura"
              Image.asset(
                AppImage.imcGrafico,
                fit: BoxFit.cover,
              ),

              //? Lista dos registro de imc realizados
              Expanded(
                child: ListView(
                  children: [
                    //  DateFormat('dd-MM-yyyy').format(DateTime.now()) .toString(),
                    //  String imc, Color cor, String data, String altura, String pes
                    MeusRegistrosTile(
                      imc: 17,
                      cor: Colors.blue.shade400,
                      data: DateFormat('dd-MM-yyyy')
                          .format(DateTime.now())
                          .toString(),
                      altura: 1.89,
                      peso: 85.3,
                    ),
                    MeusRegistrosTile(
                      imc: 20,
                      cor: Colors.green.shade400,
                      data: DateFormat('dd-MM-yyyy')
                          .format(DateTime.now())
                          .toString(),
                      altura: 1.89,
                      peso: 85.3,
                    ),
                    MeusRegistrosTile(
                      imc: 24.2,
                      cor: Colors.amber.shade400,
                      data: DateFormat('dd-MM-yyyy')
                          .format(DateTime.now())
                          .toString(),
                      altura: 1.89,
                      peso: 85.3,
                    ),
                    MeusRegistrosTile(
                      imc: 28,
                      cor: Colors.red.shade300,
                      data: DateFormat('dd-MM-yyyy')
                          .format(DateTime.now())
                          .toString(),
                      altura: 1.89,
                      peso: 85.3,
                    ),
                    MeusRegistrosTile(
                      imc: 31,
                      cor: Colors.red,
                      data: DateFormat('dd-MM-yyyy')
                          .format(DateTime.now())
                          .toString(),
                      altura: 1.89,
                      peso: 85.3,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      //? botao para registar novo imc
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          pesoEC.text = "";
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text(
                    "Novo registro",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextField(
                        controller: alturaEC,
                        maxLength: 4,
                        keyboardType: const TextInputType.numberWithOptions(
                          decimal: true,
                        ),
                        decoration: InputDecoration(
                          label: const Text('Altura'),
                          prefixIcon: Transform.rotate(
                            angle: 90 * math.pi / 180,
                            child: const Icon(Icons.straighten),
                          ),
                        ),
                      ),
                      TextField(
                        controller: pesoEC,
                        maxLength: 5,
                        keyboardType: const TextInputType.numberWithOptions(
                          decimal: true,
                        ),
                        decoration: const InputDecoration(
                          label: Text('Peso'),
                          prefixIcon: Icon(Icons.scale),
                        ),
                      ),
                    ],
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text("Cancelar"),
                    ),
                    TextButton.icon(
                      onPressed: () {
                        debugPrint(
                            "Alruta: ${alturaEC.text}  Peso: ${pesoEC.text}");
                        if (pesoEC.text.isNotEmpty &&
                            alturaEC.text.isNotEmpty) {
                          Navigator.of(context).pop();
                        }
                      },
                      icon: const Icon(Icons.save),
                      label: const Text("Registrar"),
                    )
                  ],
                );
              });
        },
        child: Container(
          color: Colors.red,
          child: Image.asset(AppImage.balanca),
        ),
      ),
    );
  }
}
