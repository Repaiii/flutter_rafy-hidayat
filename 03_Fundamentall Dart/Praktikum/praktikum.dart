import 'dart:math';

void main() {

  // soal prioritas 1
  // soal persegi & persegi panjang
  double sisi = 5.0;
  double panjang = 10.0;
  double lebar = 2.0;

  // menghitung luas persegi
  double luasPersegi = sisi * sisi;
  double kelilingPersegi = 4 * sisi;
  print('Luas Persegi : $luasPersegi');
  print('Keliling Persegi : $kelilingPersegi');

  // menghitung luas persegi panjang
  double luasPersegiPanjang = panjang * lebar;
  double kelilingPersegiPanjang = (2*panjang) + (2*lebar);
  print('Luas Persegi Panjang : $luasPersegiPanjang');
  print('Keliling Persegi Panjnag : $kelilingPersegiPanjang');

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

  faktor();
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

// soal eksplorasi 2
// soal faktor bilangan
void faktor() {
  int bilangan = 30; 

  print("Faktor-faktor dari bilangan $bilangan adalah:");
  for (int i = 1; i <= bilangan; i++) {
    if (bilangan % i == 0) {
      print(i);
    }
  }
}
