import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AvatarGeneratorScreen extends StatefulWidget {
  @override
  _AvatarGeneratorScreenState createState() => _AvatarGeneratorScreenState();
}

class _AvatarGeneratorScreenState extends State<AvatarGeneratorScreen> {
  String avatarUrl = '';
  final TextEditingController textController = TextEditingController();

  void generateAvatar() {
    // Ganti URL dengan DiceBear API atau API lain yang Anda inginkan.
    const baseUrl = 'https://avatars.dicebear.com/api/';
    final options = 'male/${textController.text}.svg'; // Ganti dengan opsi yang sesuai.

    setState(() {
      avatarUrl = baseUrl + options;
    });
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Avatar Generator'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (avatarUrl.isNotEmpty)
              SvgPicture.network(
                avatarUrl,
                width: 200,
                height: 200,
                placeholderBuilder: (BuildContext context) =>
                    const CircularProgressIndicator(),
              )
            else
              Container(
                width: 200,
                height: 200,
                color: Colors.grey,
                child: const Center(
                  child: Text(
                    'No Avatar',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                controller: textController,
                decoration: const InputDecoration(
                  labelText: 'Enter Text',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: generateAvatar,
              child: const Text('Generate Avatar'),
            ),
          ],
        ),
      ),
    );
  }
}
