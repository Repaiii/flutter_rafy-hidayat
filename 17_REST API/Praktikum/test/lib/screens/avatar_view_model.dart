import 'package:flutter/material.dart';
import 'package:test/models/avatar_model.dart';
import 'package:test/services/avatar_api.dart';

class AvatarViewModel extends ChangeNotifier {
  AvatarModel? _avatar;
  final AvatarApi _avatarApi = AvatarApi();

  AvatarModel? get avatar => _avatar;

  Future<void> fetchAvatar() async {
    try {
      final imageUrl = await _avatarApi.fetchAvatarUrl();
      _avatar = AvatarModel(imageUrl: imageUrl);
      notifyListeners();
    } catch (e) {
      throw Exception('Failed to load image: $e');
    }
  }
}
