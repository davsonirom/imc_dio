import 'package:imc_dio/model/historico.dart';

class ImcRepository {
  final List<Historico> _historico = [];

  Future<List<Historico>> meuHistoricoRegistros() async {
    await Future.delayed(const Duration(microseconds: 200));
    return _historico;
  }

  void registarImc(Historico historico) async {
    await Future.delayed(const Duration(microseconds: 200));
    _historico.add(historico);
  }
}
