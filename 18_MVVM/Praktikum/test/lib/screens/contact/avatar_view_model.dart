import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:test/services/avatar_api.dart';

class AvatarViewModel extends ChangeNotifier {
  Uint8List? _avatarImage;
  bool _isLoading = false;

  Uint8List? get avatarImage => _avatarImage;
  bool get isLoading => _isLoading;

  Future<void> fetchAvatarImage() async {
    try {
      _isLoading = true;
      notifyListeners();

      final api = AvatarApi();
      final imageBytes = await api.fetchAvatarImage();

      _avatarImage = imageBytes;
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      print('Error fetching avatar image: $e');
      _isLoading = false;
      notifyListeners();
    }
  }
}
