import 'package:flutter/cupertino.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar( 
        middle: Text('CupertinoApp',
        style: TextStyle(
            color: CupertinoColors.white,
          ),),
        backgroundColor: CupertinoColors.darkBackgroundGray,
      ),
      backgroundColor: CupertinoColors.black,
      child: Center(
        child: Text(
          'This is CupertinoApp',
          style: TextStyle(
            color: CupertinoColors.white,
          ),
        ),
      ),
    );
  }
}
