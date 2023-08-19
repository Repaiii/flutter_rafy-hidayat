// soal eksplorasi 2
// soal faktor bilangan

void main() {
  int bilangan = 30; 

  print("Faktor-faktor dari bilangan $bilangan adalah:");
  for (int i = 1; i <= bilangan; i++) {
    if (bilangan % i == 0) {
      print(i);
    }
  }
}
