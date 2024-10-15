import 'package:flutter/material.dart';
import 'package:flutter_new_badger/flutter_new_badger.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    await FlutterNewBadger.setBadge(6);
    print('Badge set');
    await FlutterNewBadger.removeBadge();
    print('Badge removed');
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Text('New badger plugin'),
        ),
      ),
    );
  }
}
