import 'dart:math';

void main() {

  // soal prioritas 1
  // soal persegi & persegi panjang
  double sisi = 5.0;
  double panjang = 10.0;
  double lebar = 2.0;

  // menghitung luas persegi
  double luasPersegi = sisi * sisi;
  print('Luas Persegi : $luasPersegi');

  // menghitung luas persegi panjang
  double luasPersegiPanjang = panjang * lebar;
  print('Luas Persegi Panjang : $luasPersegiPanjang');

  // soal lingkaran
  double jariJari = 7.0;

  // menghitung luas lingkaran
  double luas = pi * jariJari * jariJari;
  print("Luas lingkaran: $luas");

  // menghitung keliling lingkaran
  double keliling = 2 * pi * jariJari;
  print("Keliling lingkaran: $keliling");

  // soal prioritas 2
  // soal tabung
  //menghitung volume tabung
  double tinggi = 5.0;

  // Menghitung volume tabung
  double volume = pi * jariJari * jariJari * tinggi;
  print("Volume tabung: $volume");

  //soal variabel string
  String kataPertama = "Nama";
  String kataKedua = "Saya";
  String kataKetiga = "Rafy";

  String kalimatGabungan = kataPertama + " " + kataKedua + " " + kataKetiga;
  print(kalimatGabungan);

  //soal eksplorasi 1
  //soal palindrom
   String kata = "kasur rusak"; // Ganti dengan kata yang ingin Anda cek

  if (isPalindrome(kata)) {
    print("$kata merupakan sebuah palindrom.");
  } else {
    print("$kata bukan sebuah palindrom.");
  }
}

bool isPalindrome(String kata) {
  int panjang = kata.length;

  for (int i = 0; i < panjang / 2; i++) {
    if (kata[i] != kata[panjang - 1 - i]) {
      return false;
    }
  }

  return true;
}

  