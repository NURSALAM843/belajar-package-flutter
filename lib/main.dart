import 'package:dasar_flutter_section_4/pages/API/DropDownApi.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

// import 'package:intr';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DropdownApi(),
    );
  }
}
