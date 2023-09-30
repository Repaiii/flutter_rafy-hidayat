import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'contact.dart';

// Events
abstract class ContactEvent {}

class UpdateNameEvent extends ContactEvent {
  final String name;
  UpdateNameEvent(this.name);
}

class UpdatePhoneNumberEvent extends ContactEvent {
  final String phoneNumber;
  UpdatePhoneNumberEvent(this.phoneNumber);
}

class UpdateSelectedDateEvent extends ContactEvent {
  final DateTime selectedDate;
  UpdateSelectedDateEvent(this.selectedDate);
}

class UpdateSelectedColorEvent extends ContactEvent {
  final Color selectedColor;
  UpdateSelectedColorEvent(this.selectedColor);
}

class UpdateSelectedFileEvent extends ContactEvent {
  final XFile selectedFile;
  UpdateSelectedFileEvent(this.selectedFile);
}

class SubmitContactEvent extends ContactEvent {}

class EditContactEvent extends ContactEvent {
  final int index;
  EditContactEvent(this.index);
}

class DeleteContactEvent extends ContactEvent {
  final int index;
  DeleteContactEvent(this.index);
}

// State
class ContactState {
  final List<Contact> contacts;
  final int selectedIndex;
  final String name;
  final String phoneNumber;
  final String? nameValidation; // Validasi nama
  final String? phoneNumberValidation; // Validasi nomor telepon
  final DateTime selectedDate;
  final Color selectedColor;
  final XFile selectedFile;
  final GlobalKey<FormState> formKey;

  // Validator untuk nama
  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Name is required';
    } else if (value.length < 8) {
      return 'Name must be at least 8 characters';
    } else if (value.contains(RegExp(r'[0-9\W]'))) {
      return 'Name cannot contain numbers or symbols';
    }
    return null;
  }

  // Validator untuk nomor telepon
  String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone Number is required';
    } else if (value.length < 10) {
      return 'Phone Number must be at least 10 characters';
    } else if (value.contains(RegExp(r'[a-zA-Z\W]'))) {
      return 'Phone Number cannot contain letters or symbols';
    }
    return null;
  }

  ContactState({
    required this.contacts,
    required this.selectedIndex,
    required this.name,
    required this.phoneNumber,
    required this.nameValidation,
    required this.phoneNumberValidation,
    required this.selectedDate,
    required this.selectedColor,
    required this.selectedFile,
    required this.formKey,
  });

  factory ContactState.initial() {
    return ContactState(
      contacts: [],
      selectedIndex: -1,
      name: '',
      phoneNumber: '',
      nameValidation: null,
      phoneNumberValidation: null,
      selectedDate: DateTime.now(),
      selectedColor: Colors.blue,
      selectedFile: XFile(''),
      formKey: GlobalKey<FormState>(),
    );
  }

  ContactState copyWith({
    List<Contact>? contacts,
    int? selectedIndex,
    String? name,
    String? phoneNumber,
    String? nameValidation,
    String? phoneNumberValidation,
    DateTime? selectedDate,
    Color? selectedColor,
    XFile? selectedFile,
  }) {
    return ContactState(
      contacts: contacts ?? this.contacts,
      selectedIndex: selectedIndex ?? this.selectedIndex,
      name: name ?? this.name,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      nameValidation: nameValidation ?? this.nameValidation,
      phoneNumberValidation: phoneNumberValidation ?? this.phoneNumberValidation,
      selectedDate: selectedDate ?? this.selectedDate,
      selectedColor: selectedColor ?? this.selectedColor,
      selectedFile: selectedFile ?? this.selectedFile,
      formKey: this.formKey,
    );
  }
}

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  ContactBloc() : super(ContactState.initial());

  @override
  Stream<ContactState> mapEventToState(ContactEvent event) async* {
    if (event is UpdateNameEvent) {
      // Validasi nama saat perubahan nama
      final nameValidation = state.validateName(event.name);
      yield state.copyWith(name: event.name, nameValidation: nameValidation);
    } else if (event is UpdatePhoneNumberEvent) {
      // Validasi nomor telepon saat perubahan nomor telepon
      final phoneNumberValidation = state.validatePhoneNumber(event.phoneNumber);
      yield state.copyWith(
          phoneNumber: event.phoneNumber, phoneNumberValidation: phoneNumberValidation);
    } else if (event is UpdateSelectedDateEvent) {
      yield state.copyWith(selectedDate: event.selectedDate);
    } else if (event is UpdateSelectedColorEvent) {
      yield state.copyWith(selectedColor: event.selectedColor);
    } else if (event is UpdateSelectedFileEvent) {
      yield state.copyWith(selectedFile: event.selectedFile);
    } else if (event is SubmitContactEvent) {
      if (state.selectedIndex == -1) {
        // Add new contact
        final newContact = Contact(
          name: state.name,
          phoneNumber: state.phoneNumber,
          selectedDate: state.selectedDate,
          selectedColor: state.selectedColor,
          selectedFile: state.selectedFile.path,
        );
        final List<Contact> updatedContacts = List.from(state.contacts)..add(newContact);
        yield state.copyWith(contacts: updatedContacts);
      } else {
        // Edit existing contact
        final editedContact = Contact(
          name: state.name,
          phoneNumber: state.phoneNumber,
          selectedDate: state.selectedDate,
          selectedColor: state.selectedColor,
          selectedFile: state.selectedFile.path,
        );
        final List<Contact> updatedContacts = List.from(state.contacts);
        updatedContacts[state.selectedIndex] = editedContact;
        yield state.copyWith(contacts: updatedContacts, selectedIndex: -1);
      }
    } else if (event is EditContactEvent) {
      final selectedFile = state.contacts[event.index].selectedFile;
      final updatedSelectedFile = selectedFile != null ? XFile(selectedFile) : null;

      yield state.copyWith(
         selectedIndex: event.index,
         name: state.contacts[event.index].name,
         phoneNumber: state.contacts[event.index].phoneNumber,
         selectedDate: state.contacts[event.index].selectedDate,
         selectedColor: state.contacts[event.index].selectedColor,
         selectedFile: updatedSelectedFile,
      );
    } else if (event is DeleteContactEvent) {
      final List<Contact> updatedContacts = List.from(state.contacts)..removeAt(event.index);
      yield state.copyWith(contacts: updatedContacts, selectedIndex: -1);
    }
  }
}
