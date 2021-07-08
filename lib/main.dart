import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:veiculos/Pages/homePage.dart';
import 'package:veiculos/controllers/AutomakersController.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AutomakersController(),
          lazy: false,
        )
      ],
      child: MaterialApp(
        title: 'Veiculos',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage(),
      ),
    );
  }
}

