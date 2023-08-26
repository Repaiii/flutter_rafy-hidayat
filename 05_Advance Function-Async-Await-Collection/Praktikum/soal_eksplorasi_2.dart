void main() {
  List<String> data = ['js', 'js', 'js', 'golang', 'python', 'js', 'js', 'golang', 'rust'];

  Map<String, int> frekuensi = hitungFrekuensi(data);

  print("Sampel Input: $data");
  print("Sampel Output: ${formatOutput(frekuensi)}");
}

Map<String, int> hitungFrekuensi(List<String> data) {
  Map<String, int> frekuensi = {};

  for (String nilai in data) {
    if (frekuensi.containsKey(nilai)) {
      frekuensi[nilai] = frekuensi[nilai]! + 1;
    } else {
      frekuensi[nilai] = 1;
    }
  }

  return frekuensi;
}

String formatOutput(Map<String, int> frekuensi) {
  String hasil = "";

  frekuensi.forEach((key, value) {
    hasil += "$key: $value, ";
  });

  // Menghilangkan koma dan spasi ekstra di akhir
  hasil = hasil.substring(0, hasil.length - 2);

  return hasil;
}
