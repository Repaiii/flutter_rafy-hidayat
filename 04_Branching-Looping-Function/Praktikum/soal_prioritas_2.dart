import 'dart:io';
import 'dart:math';

void main() {
  // soal priortias 2
  // piramida
  print('Segitiga\n');
  int tingkat = 8;

  for (int i = 1; i <= tingkat; i++) {
    // Mencetak spasi sebelum bintang
    for (int j = tingkat - i; j >= 1; j--) {
      stdout.write(" ");
    }

    // Mencetak bintang
    for (int k = 1; k <= 2 * i - 1; k++) {
      stdout.write("*");
    }

    // Pindah ke baris berikutnya
    stdout.write("\n");
  }

  // soal jam pasir
  print('\njam pasir\n');

  // Bagian bawah jam pasir
  for (int i = tingkat; i >= 1; i--) {
    // Membuat spasi sebelum bintang
    for (int j = tingkat; j > i; j--) {
      stdout.write(" ");
    }

    // Menampilkan bintang
    for (int k = 0; k < 2 * i - 1; k++) {
      stdout.write("*");
    }

    // Pindah ke baris berikutnya
    stdout.write("\n");
  }

  // Bagian atas jam pasir
  for (int i = 2; i <= tingkat; i++) {
    // Membuat spasi sebelum bintang
    for (int j = tingkat; j >= i; j--) {
      stdout.write(" ");
    }

    // Menampilkan bintang
    for (int k = 0; k < 2 * i - 1; k++) {
      stdout.write("*");
    }

    // Pindah ke baris berikutnya
    stdout.write("\n");
  }

  // soal faktorial
  print('\nfaktorial');

  // Menampilkan faktorial untuk nilai-nilai yang diberikan
  print("Faktorial dari 10 adalah ${hitungFaktorial(10)}");
  print("Faktorial dari 40 adalah ${hitungFaktorial(40)}");
  print("Faktorial dari 50 adalah ${hitungFaktorial(50)}");

  // soal luas lingkaran
  print('\nFungsi Lingkaran');
  double jariJari = 5.0; 
  double luas = hitungLuasLingkaran(jariJari);
  print("Luas lingkaran dengan jari-jari $jariJari adalah $luas");
}

// fungsi faktorial
BigInt hitungFaktorial(int n) {
  if (n == 0) {
    return BigInt.one;
  }

  BigInt hasil = BigInt.one;
  for (int i = 1; i <= n; i++) {
    hasil *= BigInt.from(i);
  }

  return hasil;  
}

//fungsi lingkaran
double hitungLuasLingkaran(double jariJari) {
  double luas = pi * jariJari * jariJari;
  return luas;
}