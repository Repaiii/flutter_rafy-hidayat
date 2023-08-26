void main() {
  List<String> data1 = ['amuse', 'tommy kaira', 'spoon', 'HKS', 'litchfield', 'amuse', 'HKS'];
  List<String> data2 = ['JS Racing', 'amuse', 'spoon', 'spoon', 'JS Racing', 'amuse'];

  List<String> hasil1 = hapusDuplikat(data1);
  List<String> hasil2 = hapusDuplikat(data2);

  print("Sampel Input: $hasil1");
  print("Sampel Output: $hasil2");
}

List<String> hapusDuplikat(List<String> data) {
  List<String> hasil = [];
  
  for (String nilai in data) {
    if (!hasil.contains(nilai)) {
      hasil.add(nilai);
    }
  }
  
  return hasil;
}
