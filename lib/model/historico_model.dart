class HistoricoModel {
  final int _id;
  final double _imc;
  final double _altura;
  final double _peso;
  final String _data;

  HistoricoModel(
    this._id,
    this._altura,
    this._peso,
    this._data,
    this._imc,
  );

  int get id => _id;
  double get altura => _altura;
  double get peso => _peso;
  String get data => _data;
  double get imc => _imc;

  set id(int id) => _id;
  set altura(double altura) => _altura;
  set peso(double peso) => _peso;
  set data(String data) => _data;
  set imc(double imc) => _imc;
}
