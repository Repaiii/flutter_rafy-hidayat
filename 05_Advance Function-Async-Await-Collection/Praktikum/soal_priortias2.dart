void main() {
  // soal 1
  // Membuat list
  List<List<String>> data = [
    ['Nama', 'Rafy'],
    ['Usia', '20'],
    ['Asal', 'Samarinda'],
  ];

  // Membuat map dari list data
  Map<String, String> dataMap = Map.fromIterable(
    data,
    key: (item) => item[0],
    value: (item) => item[1], 
  );

  print(dataMap);

  // soal 2
  List<int> nilai = [7, 5, 3, 5, 2, 1];

  int rataRata = hitungRataRata(nilai);
  
  print("Rata-rata (dibulatkan ke atas): $rataRata");
}

int hitungRataRata(List<int> data) {
  int total = 0;
  
  for (int nilai in data) {
    total += nilai;
  }
  
  double rataRata = total / data.length;
  
  // Membulatkan ke atas
  int rataRataBulat = rataRata.ceil();
  
  return rataRataBulat;
}
