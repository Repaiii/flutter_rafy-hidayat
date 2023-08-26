import 'dart:async';

void main() async {
  // soal 3
  int n = 5; 

  int hasil = await hitungFaktorial(n);

  print("Faktorial dari $n adalah $hasil");
}

Future<int> hitungFaktorial(int n) async {
  if (n == 0) {
    return 1; 
  }

  int hasil = 1;

  for (int i = 1; i <= n; i++) {
    await Future.delayed(Duration(seconds: 1));
    hasil *= i;
  }

  return hasil;
}
