class Matematika {
  int x;
  int y;

  Matematika(this.x, this.y);

  int hasil() {
    return x + y; // Ganti dengan operasi matematika yang sesuai
  }
}

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

void main() {
  KelipatanPersekutuanTerkecil kelipatan = KelipatanPersekutuanTerkecil(12, 18);
  FaktorPersekutuanTerbesar faktor = FaktorPersekutuanTerbesar(24, 36);

  print("Kelipatan Persekutuan Terkecil: ${kelipatan.hasil()}");
  print("Faktor Persekutuan Terbesar: ${faktor.hasil()}");
}
