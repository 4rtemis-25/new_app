import 'package:flutter/material.dart';
import 'package:new_app/src/pages/tabs_page.dart';
import 'package:new_app/src/theme/tema.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: miTema,
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: TabsPage()
    );
  }
}