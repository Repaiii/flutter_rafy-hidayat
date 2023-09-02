import 'Balok.dart';
import 'Kubus.dart';

void main() {
  // Membuat objek Balok
  Balok balok = Balok(5.0, 3.0, 2.0);

  // Menghitung volume Balok
  double volumeBalok = balok.volume();
  print("Volume Balok: $volumeBalok");

  // Membuat objek Kubus
  Kubus kubus = Kubus(4.0);

  // Menghitung volume Kubus
  double volumeKubus = kubus.volume();
  print("Volume Kubus: $volumeKubus");
}