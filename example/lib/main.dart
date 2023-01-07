import 'package:flutter/material.dart';
import 'package:android_physical_buttons/android_physical_buttons.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _State();
}

class _State extends State<App> {
  @override
  void initState() {
    super.initState();

    AndroidPhysicalButtons.listen((key) {
      print(key);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(appBar: AppBar(title: const Text('Android Physical Buttons'))));
  }
}
