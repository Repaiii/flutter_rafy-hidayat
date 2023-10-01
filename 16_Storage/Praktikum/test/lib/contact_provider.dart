import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'contact.dart';

class ContactsProvider extends ChangeNotifier {
  final List<Contact> _contacts = [];
  String _name = '';
  String _phoneNumber = '';
  DateTime _selectedDate = DateTime.now();
  Color _selectedColor = Colors.blue;
  XFile? _selectedFile;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  int _selectedIndex = -1;
  bool _isEditMode = false; // Menambahkan properti _isEditMode

  List<Contact> get contacts => _contacts;
  String get name => _name;
  String get phoneNumber => _phoneNumber;
  DateTime get selectedDate => _selectedDate;
  Color get selectedColor => _selectedColor;
  XFile? get selectedFile => _selectedFile;
  int get selectedIndex => _selectedIndex;
  bool get isEditMode => _isEditMode; // Getter untuk isEditMode

  set selectedIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  void updateName(String name) {
    _name = name;
    notifyListeners();
  }

  void updatePhoneNumber(String phoneNumber) {
    _phoneNumber = phoneNumber;
    notifyListeners();
  }

  void updateSelectedDate(DateTime date) {
    _selectedDate = date;
    notifyListeners();
  }

  void updateSelectedColor(Color color) {
    _selectedColor = color;
    notifyListeners();
  }

  void updateSelectedFile(XFile? file) {
    _selectedFile = file;
    notifyListeners();
  }

  void addContact() {
    if (_validateForm()) {
      final newContact = Contact(
        name: _name,
        phoneNumber: _phoneNumber,
        selectedDate: _selectedDate,
        selectedColor: _selectedColor,
        selectedFile: _selectedFile?.path,
      );

      if (_isEditMode) {
        _contacts[_selectedIndex] = newContact;
        _isEditMode = false; // Keluar dari mode edit setelah update
      } else {
        _contacts.add(newContact);
      }

      _clearForm();
      _selectedIndex = 0;
      notifyListeners();
    }
  }

  void editContact(int index) {
    if (_validateForm()) {
      final updatedContact = Contact(
        name: _name,
        phoneNumber: _phoneNumber,
        selectedDate: _selectedDate,
        selectedColor: _selectedColor,
        selectedFile: _selectedFile?.path,
      );

      if (index >= 0 && index < _contacts.length) {
        _contacts[index] = updatedContact;
      }

      _clearForm();
      _isEditMode = true; // Masuk ke mode edit saat tombol Edit ditekan
      notifyListeners();
    }
  }

  void deleteContact(int index) {
    _contacts.removeAt(index);
    notifyListeners();
  }

  bool _validateForm() {
    if (formKey.currentState!.validate()) {
      if (_name.isEmpty) {
        return false;
      } else if (_name.length < 8) {
        return false;
      } else if (_name.contains(RegExp(r'[0-9\W]'))) {
        return false;
      }

      if (_phoneNumber.isEmpty) {
        return false;
      } else if (_phoneNumber.length < 10) {
        return false;
      } else if (_phoneNumber.contains(RegExp(r'[a-zA-Z\W]'))) {
        return false;
      }

      return true;
    }
    return false;
  }

  void _clearForm() {
    _name = '';
    _phoneNumber = '';
    _selectedDate = DateTime.now();
    _selectedColor = Colors.blue;
    _selectedFile = null;
  }
}
