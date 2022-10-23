import 'package:flutter/material.dart';
import 'package:rajaongkir/views/pages/pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Raja Ongkir',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SendMail(),
    );
  }
}
