import 'fpb.dart';
import 'kpk.dart';

void main() {
  KelipatanPersekutuanTerkecil kelipatan = KelipatanPersekutuanTerkecil(8, 20);
  FaktorPersekutuanTerbesar faktor = FaktorPersekutuanTerbesar(10, 36);

  print("Kelipatan Persekutuan Terkecil: ${kelipatan.hasil()}");
  print("Faktor Persekutuan Terbesar: ${faktor.hasil()}");
}