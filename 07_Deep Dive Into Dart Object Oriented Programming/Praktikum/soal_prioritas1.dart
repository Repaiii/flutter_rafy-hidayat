class BangunRuang {
  double panjang;
  double lebar;
  double tinggi;

  BangunRuang(this.panjang, this.lebar, this.tinggi);

  double volume() {
    return panjang * lebar * tinggi;
  }
}

class Balok extends BangunRuang {
  Balok(double panjang, double lebar, double tinggi) : super(panjang, lebar, tinggi);

  @override
  double volume() {
    return panjang * lebar * tinggi;
  }
}

class Kubus extends BangunRuang {
  Kubus(double sisi) : super(sisi, sisi, sisi);

  @override
  double volume() {
    return panjang * panjang * panjang;
  }
}

void main() {
  // Membuat objek Balok
  Balok balok = Balok(6.0, 4.0, 2.0);

  // Menghitung volume Balok
  double volumeBalok = balok.volume();
  print("Volume Balok: $volumeBalok");

  // Membuat objek Kubus
  Kubus kubus = Kubus(5.0);

  // Menghitung volume Kubus
  double volumeKubus = kubus.volume();
  print("Volume Kubus: $volumeKubus");
}
