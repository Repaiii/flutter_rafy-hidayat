import 'BangunRuang.dart';

class Kubus extends BangunRuang {
  Kubus(double sisi) : super(sisi, sisi, sisi);

  @override
  double volume() {
    return panjang * panjang * panjang;
  }
}