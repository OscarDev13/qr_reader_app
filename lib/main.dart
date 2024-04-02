import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader_2/db_provider.dart';
import 'package:qr_reader_2/pages/home_page.dart';
import 'package:qr_reader_2/pages/mapa_page.dart';
import 'package:qr_reader_2/providers/ui_provider.dart';

import 'db_provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // DBProvider.db.initDB();


    return MultiProvider(
      // Vamos a tener varios proovedores de informacion
      providers: [
        ChangeNotifierProvider( create: (_) => UiProvider() ),
      ],

      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'QR Reader',
        initialRoute: 'home',
        routes: {
          'home': ( _ ) => const HomePage(),
          'mapa': ( _ ) => const MapaPage()
        },
        theme: ThemeData(
          primaryColor: Colors.deepPurple,
          // AppBar theme color
          appBarTheme: const AppBarTheme(
            color: Colors.deepPurple
          ),
          // FloatingActionButton color
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
            backgroundColor: Colors.deepPurple
          ),
          // Icon theme
          iconTheme: const IconThemeData(
            // color: Colors.deepPurple
          ),
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            selectedItemColor: Colors.deepPurple 
          )
        ),
      ),
    );
  }
}