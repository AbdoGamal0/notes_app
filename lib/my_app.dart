import 'package:flutter/material.dart';
import 'package:notes_app/features/AddNoteCubit/presentation/pages/home_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
        useMaterial3: true,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black87,
      ),
      home: HomeView(),
    );
  }
}
