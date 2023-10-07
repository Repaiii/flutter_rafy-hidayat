import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:test/screens/avatar_view_model.dart';

class ImageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final avatarViewModel = Provider.of<AvatarViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('DiceBear API Profile'),
      ),
      body: Center(
        child: avatarViewModel.avatar != null
            ? SvgPicture.string(
                avatarViewModel.avatar!.imageUrl,
                width: 400, // Sesuaikan dengan lebar yang diinginkan
                height: 400, // Sesuaikan dengan tinggi yang diinginkan
                placeholderBuilder: (BuildContext context) => const CircularProgressIndicator(),
              )
            : const CircularProgressIndicator(), // Tampilkan indikator jika sedang mengambil gambar
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          avatarViewModel.fetchAvatar(); // Panggil fungsi fetchAvatar saat tombol ditekan.
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
