// api_service.dart
import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:test/models/contact_model.dart';
import 'package:test/models/json_model.dart';


class ApiService {
  final Dio _dio = Dio();
  final String postUrl = 'https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/contacts';
  final url = Uri.parse('https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/contacts/2');
  final String putUrl = 'https://jsonplaceholder.typicode.com/posts/1';

  Future<void> createContact(Contact contact) async {
    try {
      final response = await _dio.post(
        postUrl,
        data: contact.toJson(),
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );

      if (response.statusCode == 201) {
        print('Contact created successfully.');
        print('Response Data: ${response.data}');
      } else {
        print('Failed to create contact. Status code: ${response.statusCode}');
        print('Response Data: ${response.data}');
      }
    } catch (e) {
      print('Error creating contact: $e');
    }
  }

  Future<void> performPutRequest() async {
    try {
      final putData = {
        'id': 1,
        'title': 'foo',
        'body': 'bar',
        'userId': 1,
      };

      final Response response = await _dio.put(
        putUrl,
        data: putData,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );

      if (response.statusCode == 200) {
        print('Berhasil mengirim permintaan PUT');
        print('Data yang diperbarui: ${response.data}');
      } else {
        print('Gagal mengirim permintaan PUT. Kode status: ${response.statusCode}');
        print('Response Data: ${response.data}');
      }
    } catch (e) {
      print('Terjadi kesalahan saat mengirim permintaan PUT: $e');
    }
  }

  Future<void> convertJson() async {
    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final Map<String, dynamic> json = jsonDecode(response.body);
        final contact = Contacts.fromJson(json); // Sesuaikan dengan model yang benar

        // Sekarang, Anda memiliki objek Contact yang dapat Anda gunakan.
        print('ID: ${contact.id}');
        print('Name: ${contact.name}');
        print('Phone: ${contact.phone}');
      } else {
        print('Gagal mengambil data. Kode status: ${response.statusCode}');
      }
    } catch (e) {
      print('Terjadi kesalahan: $e');
    }
  }
}
