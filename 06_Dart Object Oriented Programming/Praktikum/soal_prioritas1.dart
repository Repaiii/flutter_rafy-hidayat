class Hewan {
  double berat;

  Hewan(this.berat);
}

class Mobil {
  double kapasitas;
  double muatan = 0;

  Mobil(this.kapasitas);

  void tambahMuatan(double beratHewan) {
    if (muatan + beratHewan <= kapasitas) {
      muatan += beratHewan;
      print("Muatan berhasil ditambahkan: $beratHewan kg");
    } else {
      print("Muatan melebihi kapasitas maksimum!");
    }
  }

  double totalMuatan() {
    return muatan;
  }
}

void main() {
  Mobil mobil = Mobil(500.0); // Membuat objek mobil dengan kapasitas 500 kg

  Hewan sapi = Hewan(300.0); // Membuat objek hewan (sapi) dengan berat 300 kg
  Hewan kambing = Hewan(200.0); // Membuat objek hewan (kambing) dengan berat 100 kg

  mobil.tambahMuatan(sapi.berat); // Menambahkan sapi ke dalam mobil
  mobil.tambahMuatan(kambing.berat); // Menambahkan kambing ke dalam mobil

  print("Total muatan mobil: ${mobil.totalMuatan()} kg"); // Menampilkan total muatan mobil
}
