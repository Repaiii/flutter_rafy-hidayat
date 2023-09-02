import 'Matematika.dart';

class KelipatanPersekutuanTerkecil extends Matematika {
  KelipatanPersekutuanTerkecil(int x, int y) : super(x, y);

  @override
  int hasil() {
    // Implementasikan operasi kelipatan persekutuan terkecil di sini
    int max = x > y ? x : y;
    while (true) {
      if (max % x == 0 && max % y == 0) {
        return max;
      }
      max++;
    }
  }
}