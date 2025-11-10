import 'package:flutter/material.dart';
import 'screen/home_screen.dart';

void main() {
  runApp(FlavourlyApp());
}

class FlavourlyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flavourly',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
        useMaterial3: true,
      ),
      home: HomeScreen(),
    );
  }
}
