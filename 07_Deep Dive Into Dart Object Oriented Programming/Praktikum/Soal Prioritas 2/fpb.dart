import 'Matematika.dart';

class FaktorPersekutuanTerbesar extends Matematika {
  FaktorPersekutuanTerbesar(int x, int y) : super(x, y);

  @override
  int hasil() {
    // Implementasikan operasi faktor persekutuan terbesar di sini
    while (y != 0) {
      int temp = y;
      y = x % y;
      x = temp;
    }
    return x;
  }
}