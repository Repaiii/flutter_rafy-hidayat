class Book {
  int id;
  String judul;
  String penerbit;
  double harga;
  String kategori;

  Book(this.id, this.judul, this.penerbit, this.harga, this.kategori);
}

class Bookstore {
  List<Book> daftarBuku = [];
  int _nextId = 1;

  // Method untuk menambahkan buku ke daftar
  void tambahBuku(String judul, String penerbit, double harga, String kategori) {
    daftarBuku.add(Book(_nextId++, judul, penerbit, harga, kategori));
  }

  // Method untuk mendapatkan semua data buku
  List<Book> semuaBuku() {
    return daftarBuku;
  }

  // Method untuk menghapus buku berdasarkan ID
  void hapusBuku(int id) {
    daftarBuku.removeWhere((book) => book.id == id);
  }
}

void main() {
  // Membuat objek toko buku
  Bookstore tokoBuku = Bookstore();

  // Menambahkan beberapa buku
  tokoBuku.tambahBuku("Buku A", "Penerbit A", 35000, "Fiksi");
  tokoBuku.tambahBuku("Buku B", "Penerbit B", 30000, "Non-fiksi");
  tokoBuku.tambahBuku("Buku C", "Penerbit C", 50000, "Drama");

  // Mencetak semua data buku
  List<Book> semuaBuku = tokoBuku.semuaBuku();
  print("Daftar Buku:");
  for (var book in semuaBuku) {
    print("ID: ${book.id}, Judul: ${book.judul}, Penerbit: ${book.penerbit}, Harga: ${book.harga}, Kategori: ${book.kategori}");
  }

  // Menghapus buku berdasarkan ID
  tokoBuku.hapusBuku(2);

  // Mendapatkan semua data buku setelah penghapusan
  semuaBuku = tokoBuku.semuaBuku();
  print("\nDaftar Buku Setelah Penghapusan:");
  for (var book in semuaBuku) {
    print("ID: ${book.id}, Judul: ${book.judul}, Penerbit: ${book.penerbit}, Harga: Rp.${book.harga}, Kategori: ${book.kategori}");
  }
}
