class Calculator {
  // Method untuk penjumlahan dua bilangan
  double tambah(double angka1, double angka2) {
    return angka1 + angka2;
  }

  // Method untuk pengurangan dua bilangan
  double kurang(double angka1, double angka2) {
    return angka1 - angka2;
  }

  // Method untuk perkalian dua bilangan
  double kali(double angka1, double angka2) {
    return angka1 * angka2;
  }

  // Method untuk pembagian dua bilangan
  double bagi(double angka1, double angka2) {
    if (angka2 == 0) {
      // Menghindari pembagian oleh nol
      throw ArgumentError("Angka kedua tidak boleh nol.");
    }
    return angka1 / angka2;
  }
}

void main() {
  Calculator calculator = Calculator();

  double angka1 = 20.0;
  double angka2 = 5.0;

  print("Penjumlahan: ${calculator.tambah(angka1, angka2)}");
  print("Pengurangan: ${calculator.kurang(angka1, angka2)}");
  print("Perkalian: ${calculator.kali(angka1, angka2)}");
  try {
    print("Pembagian: ${calculator.bagi(angka1, angka2)}");
  } catch (e) {
    print("Error: $e");
  }
}