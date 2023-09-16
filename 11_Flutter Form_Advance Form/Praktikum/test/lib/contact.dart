import 'package:flutter/material.dart';

class Contact {
  String name;
  String phone;

  Contact({required this.name, required this.phone});
}

class Contacts extends StatefulWidget {
  @override
  _ContactsPageState createState() => _ContactsPageState();
}

class _ContactsPageState extends State<Contacts> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  List<Contact> contacts = [];
  bool isEditing = false;
  int editingIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contacts'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Ikon telepon (gambar bebas)
            Icon(
              Icons.phone,
              size: 40.0, // Perkecil ukuran ikon
              color: Color(0xFFE7E0EC), // Warna ikon yang sama dengan widget lain
            ),

            // Judul "Create New Contacts"
            Text(
              'Create New Contacts',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            // Deskripsi
            Text(
              'Please fill in the details below',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey, // Ubah warna teks deskripsi
              ),
            ),

            // Form input nama
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0), // Tambahkan jarak antara textfield
              child: TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: 'Nama',
                  fillColor: Color(0xFFE7E0EC), // Warna latar belakang
                  filled: true,
                  border: OutlineInputBorder(),
                ),
              ),
            ),

            // Form input nomor telepon
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0), // Tambahkan jarak antara textfield
              child: TextFormField(
                controller: phoneController,
                decoration: InputDecoration(
                  labelText: 'Nomor Telepon',
                  fillColor: Color(0xFFE7E0EC), // Warna latar belakang
                  filled: true,
                  border: OutlineInputBorder(),
                ),
              ),
            ),

            // Tombol Submit
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.all(16.0), // Beri jarak dari textfield
                child: ElevatedButton(
                  onPressed: () {
                    if (isEditing) {
                      // Jika dalam mode editing, lakukan pembaruan data
                      contacts[editingIndex].name = nameController.text;
                      contacts[editingIndex].phone = phoneController.text;
                      setState(() {
                        isEditing = false;
                        editingIndex = -1;
                      });
                    } else {
                      // Jika bukan mode editing, tambahkan data baru
                      contacts.add(Contact(
                        name: nameController.text,
                        phone: phoneController.text,
                      ));
                    }
                    // Bersihkan input fields
                    nameController.clear();
                    phoneController.clear();
                    // Memperbarui tampilan daftar kontak
                    setState(() {});
                  },
                  child: Text(isEditing ? 'Update' : 'Submit'),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF333333), // Ubah warna tombol Submit
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0), // Tambahkan border radius
                    ),
                  ),
                ),
              ),
            ),

            // Widget untuk menampilkan daftar kontak
            SizedBox(height: 32.0), // Beri jarak dari list kontak
            ContactList(
              contacts: contacts,
              onDelete: (index) {
                // Fungsi untuk menghapus data kontak
                contacts.removeAt(index);
                setState(() {});
              },
              onEdit: (index) {
                // Fungsi untuk memulai editing data kontak
                nameController.text = contacts[index].name;
                phoneController.text = contacts[index].phone;
                setState(() {
                  isEditing = true;
                  editingIndex = index;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ContactList extends StatelessWidget {
  final List<Contact> contacts;
  final Function(int) onDelete;
  final Function(int) onEdit;

  ContactList({
    required this.contacts,
    required this.onDelete,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Judul "List Contacts"
        Text(
          'List Contacts',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),

        // Daftar kontak dalam ListView
        ListView.builder(
          shrinkWrap: true,
          itemCount: contacts.length,
          itemBuilder: (context, index) {
            final contact = contacts[index];
            // Ambil huruf pertama dari nama kontak
            final initial = contact.name.isNotEmpty ? contact.name[0] : '?';
            return ListTile(
              leading: CircleAvatar(
                backgroundColor: Color(0xFFE7E0EC),
                child: Text(
                  initial.toUpperCase(),
                  style: TextStyle(color: Colors.black),
                ),
              ),
              title: Text(contact.name),
              subtitle: Text(contact.phone),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {
                      // Memulai editing data kontak
                      onEdit(index);
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      // Menghapus data kontak
                      onDelete(index);
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
