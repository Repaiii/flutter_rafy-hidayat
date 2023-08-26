Future<List<int>> kalikanList(List<int> data, int pengali) async {
  List<int> hasil = [];

  for (int nilai in data) {
    await Future.delayed(Duration(seconds: 1));
    hasil.add(nilai * pengali);
  }

  return hasil;
}

void main() async {
  List<int> data = [1, 2, 3, 4, 5];
  int pengali = 2;

  List<int> hasil = await kalikanList(data, pengali);

  print("Hasil perkalian: $hasil");
}
