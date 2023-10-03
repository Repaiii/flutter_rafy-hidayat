import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:image_picker/image_picker.dart';
import 'contact_bloc.dart';

class ContactsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contacts App'),
      ),
      body: BlocBuilder<ContactBloc, ContactState>(
        builder: (context, state) {
          final contactBloc = context.read<ContactBloc>();

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                  child: Icon(
                    Icons.phone,
                    size: 48,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 16),
                const Center(
                  child: Text(
                    'Create New Contacts',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Form(
                  key: contactBloc.state.formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Name',
                          border: OutlineInputBorder(),
                          fillColor: Color(0xFFEADDFF),
                          filled: true,
                        ),
                        onChanged: (value) {
                          contactBloc.add(UpdateNameEvent(value));
                        },
                        validator: (value) {
                          return state.nameValidation;
                        },
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Phone Number',
                          border: OutlineInputBorder(),
                          fillColor: Color(0xFFEADDFF),
                          filled: true,
                        ),
                        onChanged: (value) {
                          contactBloc.add(UpdatePhoneNumberEvent(value));
                        },
                        validator: (value) {
                          return state.phoneNumberValidation;
                        },
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          const Text('Select Date: '),
                          TextButton(
                            onPressed: () {
                              _selectDate(context, contactBloc);
                            },
                            child: Text(
                              "${state.selectedDate.toLocal()}".split(' ')[0],
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          const Text('Select Color: '),
                          TextButton(
                            onPressed: () {
                              _selectColor(context, contactBloc);
                            },
                            child: Container(
                              width: 20,
                              height: 20,
                              color: state.selectedColor,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          const Text('Select File: '),
                          TextButton(
                            onPressed: () {
                              _selectFile(context, contactBloc);
                            },
                            child: const Icon(
                              Icons.attach_file,
                              color: Color(0xFF6750A4),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Align(
                        alignment: Alignment.centerRight,
                        child: ElevatedButton(
                          onPressed: () {
                            if (contactBloc.state.formKey.currentState!.validate()) {
                              contactBloc.add(SubmitContactEvent());
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            primary: const Color(0xFF6750A4),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                          ),
                          child: const Text('Submit'),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                const Center(
                  child: Text(
                    'List Contacts',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: state.contacts.length,
                  itemBuilder: (context, index) {
                    final contact = state.contacts[index];
                    return Card(
                      margin: const EdgeInsets.only(bottom: 16),
                      child: ListTile(
                        title: Text(contact.name),
                        subtitle: Text(
                            '${contact.phoneNumber}, ${contact.selectedDate} ${contact.selectedFile ?? ""}'),
                        leading: CircleAvatar(
                          backgroundColor: contact.selectedColor,
                          child: Text(
                            contact.name[0].toUpperCase(),
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.edit),
                              onPressed: () {
                                contactBloc.add(EditContactEvent(index));
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () {
                                contactBloc.add(DeleteContactEvent(index));
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  // Fungsi untuk memilih tanggal
  Future<void> _selectDate(BuildContext context, ContactBloc bloc) async {
    final DateTime picked = (await showDatePicker(
      context: context,
      initialDate: bloc.state.selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    )) ??
        DateTime.now();
    if (picked != bloc.state.selectedDate) {
      bloc.add(UpdateSelectedDateEvent(picked));
    }
  }

  // Fungsi untuk memilih warna
  Future<void> _selectColor(BuildContext context, ContactBloc bloc) async {
    Color pickedColor = bloc.state.selectedColor;
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Pick a color'),
          content: SingleChildScrollView(
            child: ColorPicker(
              pickerColor: bloc.state.selectedColor,
              onColorChanged: (Color color) {
                pickedColor = color;
              },
              pickerAreaHeightPercent: 0.8,
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
                bloc.add(UpdateSelectedColorEvent(pickedColor));
              },
            ),
          ],
        );
      },
    );
  }

  // Fungsi untuk memilih file
  Future<void> _selectFile(BuildContext context, ContactBloc bloc) async {
    final imagePicker = ImagePicker();
    final selectedImage = await imagePicker.pickImage(source: ImageSource.gallery);
    if (selectedImage != null) {
      if (bloc.state.selectedIndex == -1) {
        bloc.add(UpdateSelectedFileEvent(XFile(selectedImage.path)));
      } else {
        bloc.add(UpdateSelectedFileEvent(XFile(selectedImage.path)));
      }
    }
  }
}
