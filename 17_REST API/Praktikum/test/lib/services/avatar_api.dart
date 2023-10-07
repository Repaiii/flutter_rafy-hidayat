import 'package:dio/dio.dart';

class AvatarApi {
  final Dio _dio = Dio();

  Future<String> fetchAvatarUrl() async {
    try {
      final Response response = await _dio.get('https://avatars.dicebear.com/api/male/example.svg');

      if (response.statusCode == 200) {
        return response.data.toString();
      } else {
        throw Exception('Failed to load image');
      }
    } catch (e) {
      throw Exception('Failed to load image: $e');
    }
  }
}
