import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poke_api/view/Page1.dart';

void main() {
  runApp(pokeApp());
}

class pokeApp extends StatelessWidget {
  const pokeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "PokeApp",
      initialRoute: 'page1',
      getPages: [
        GetPage(name: '/page1', page: () => Page1()),
      ],
    );
  }
}