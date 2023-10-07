import 'dart:isolate';
import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

class AvatarApi {
  final Dio dio = Dio();

  Future<Uint8List> fetchAvatarImage() async {
    final receivePort = ReceivePort();
    await Isolate.spawn(_fetchImageIsolate, receivePort.sendPort);
    final result = await receivePort.first;
    if (result is Uint8List) {
      return result;
    } else {
      throw Exception(result);
    }
  }

  static void _fetchImageIsolate(SendPort sendPort) async {
    try {
      const imageUrl = 'https://avatars.dicebear.com/api/male/example.svg';
      final response = await http.get(Uri.parse(imageUrl));
      if (response.statusCode == 200) {
        sendPort.send(Uint8List.fromList(response.bodyBytes));
      } else {
        sendPort.send('Failed to load image');
      }
    } catch (e) {
      sendPort.send('Failed to load image: $e');
    }
  }
}
