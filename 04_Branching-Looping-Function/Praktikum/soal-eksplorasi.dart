void main() {

  //soal 1
  print('Soal 1');
  int bilangan = 23;

  if (isPrime(bilangan)) {
    print("$bilangan adalah bilangan prima.");
  } else {
    print("$bilangan bukan bilangan prima.");
  }

  // soal 2
  print('\nSoal 2');
  int angka = 8;

  // Mencetak header kolom
  print("Tabel Perkalian:");
  print(" x  |  1  2  3  4  5  6  7  8  9 10");
  print("----+-------------------------------");

  // Mencetak tabel perkalian
  for (int i = 1; i <= angka; i++) {
    String baris = "$i  |";
    for (int j = 1; j <= angka; j++) {
      int hasil = i * j;
      baris += " $hasil".padLeft(3);
    }
    print(baris);
  }
}

bool isPrime(int n) {
  if (n <= 1) {
    return false; 
  }
  for (int i = 2; i <= n / 2; i++) {
    if (n % i == 0) {
      return false; 
    }
  }
  return true;
}
