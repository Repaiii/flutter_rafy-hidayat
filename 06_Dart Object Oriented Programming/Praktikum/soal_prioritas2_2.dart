class Course {
  String judul;
  String deskripsi;

  Course(this.judul, this.deskripsi);
}

class Student {
  String nama;
  String kelas;
  List<Course> daftarCourse = [];

  Student(this.nama, this.kelas);

  // Method untuk menambahkan course ke daftar student
  void tambahCourse(Course course) {
    daftarCourse.add(course);
  }

  // Method untuk menghapus course dari daftar student
  void hapusCourse(Course course) {
    daftarCourse.remove(course);
  }

  // Method untuk melihat semua course yang dimiliki student
  void lihatDaftarCourse() {
    if (daftarCourse.isEmpty) {
      print("Daftar course kosong.");
    } else {
      print("Daftar Course untuk $nama:");
      for (var course in daftarCourse) {
        print("Judul: ${course.judul}, Deskripsi: ${course.deskripsi}");
      }
    }
  }
}

void main() {
  // Membuat beberapa course
  Course course1 = Course("Matematika", "Pelajaran Matematika");
  Course course2 = Course("Bahasa Inggris", "Pelajaran Bahasa Inggris");
  Course course3 = Course("IPA", "Pelajaran IPA");

  // Membuat objek student
  Student student = Student("Rafy", "Flutter");

  // Menambahkan course ke daftar student
  student.tambahCourse(course1);
  student.tambahCourse(course2);
  student.tambahCourse(course3);

  // Melihat daftar course yang dimiliki student
  student.lihatDaftarCourse();

  // Menghapus salah satu course
  student.hapusCourse(course2);

  // Melihat daftar course setelah penghapusan
  student.lihatDaftarCourse();
}
