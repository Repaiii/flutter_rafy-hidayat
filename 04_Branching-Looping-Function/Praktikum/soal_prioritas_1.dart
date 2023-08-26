void main() {
  // soal branching
  print('branching');
  int nilai = 55; 
  
  String hasil = cekNilai(nilai);
  
  if (hasil.isNotEmpty) {
    print("Hasil: $hasil");
  } else {
    print("Teks kosong");
  }

  // soal looping
  loop();
}

String cekNilai(int nilai) {
  if (nilai > 70) {
    return "Nilai A";
  } else if (nilai > 40) {
    return "Nilai B";
  } else if (nilai > 0) {
    return "Nilai C";
  } else {
    return "";
  }
}

// fungsi loop angka 1 - 10
void loop () {
  print('\nLooping 1 sampai 10');
  for (int i = 1; i <= 10; i++) {
    print(i);
  }
}