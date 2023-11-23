import 'package:flutter/material.dart';
import 'package:new_app/src/pages/tabs_page.dart';
import 'package:new_app/src/services/news_service.dart';
import 'package:new_app/src/theme/tema.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ( _ ) => NewsService())
      ],
      child: MaterialApp(
        theme: miTema,
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        home: TabsPage()
      ),
    );
  }
}