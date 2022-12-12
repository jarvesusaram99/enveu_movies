import 'package:enveu_movies/screens/home.dart';
import 'package:enveu_movies/utils/binding.dart';
import 'package:enveu_movies/utils/languages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: Languages(),
      locale: const Locale('en', 'US'),
      initialBinding: StoreBinding(),
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const Home(),
      },
      initialRoute: '/',
      title: 'Movies App',
      theme: ThemeData.dark(
          // useMaterial3: true,
          ),
      // home: const HomeScreen(),
    );
  }
}
