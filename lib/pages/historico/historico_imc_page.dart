import 'package:flutter/material.dart';
import 'package:imc_dio/helps/app_image.dart';
import 'package:imc_dio/model/historico.dart';
import 'package:imc_dio/repository/imc_repository.dart';
import 'package:intl/intl.dart';
import 'dart:math' as math;

import '../../model/imc.dart';
import 'componets/meus_registros_tile.dart';

class HistoricoImcPage extends StatefulWidget {
  const HistoricoImcPage({super.key});

  @override
  State<HistoricoImcPage> createState() => _HistoricoImcPageState();
}

class _HistoricoImcPageState extends State<HistoricoImcPage> {
  final alturaEC = TextEditingController();
  final pesoEC = TextEditingController();
  ImcRepository gravar = ImcRepository();
  List historico = [];

  Future<void> pegarHistorico() async {
    historico = await gravar.meuHistoricoRegistros();
  }

  @override
  void initState() {
    super.initState();
    pegarHistorico();
  }

  @override
  void dispose() {
    super.dispose();
    alturaEC.dispose();
    pesoEC.dispose();
  }

  void calcularIMC(double altura, double peso) {
    //! calculando o imc
    double imcCalculado = Imc.calulcarIMC(altura, peso);
    //! data do registro (evoluir para um registro diario)
    String data = DateFormat('dd-MM-yyyy').format(DateTime.now()).toString();
    Map descricaoDoImc = Imc.classicacao(imcCalculado);
    //! historido do imc do dia atual
    Historico imcDeHoje = Historico(
      imcCalculado,
      altura,
      peso,
      data,
      descricaoDoImc['descricao'],
      descricaoDoImc['cor'],
    );

    //* gravar no banco (repository simulando)
    gravar.registarImc(imcDeHoje);
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
                  child: ListView.builder(
                itemCount: historico.length,
                itemBuilder: (context, index) {
                  Historico dia = historico[index];
                  return MeusRegistrosTile(
                    imc: double.parse(Imc.precisaoDecimal(dia.imc)),
                    cor: dia.cor,
                    data: dia.date,
                    altura: dia.altura,
                    peso: dia.peso,
                  );
                },
              )),
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
                        if (pesoEC.text.isNotEmpty &&
                            alturaEC.text.isNotEmpty) {
                          calcularIMC(
                            double.parse(alturaEC.text.replaceAll(',', '.')),
                            double.parse(pesoEC.text.replaceAll(',', '.')),
                          );
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
        child: Image.asset(AppImage.balanca),
      ),
    );
  }
}
