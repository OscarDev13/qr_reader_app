import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader_2/providers/ui_provider.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {

    final uiProvider = Provider.of<UiProvider>(context);

    final currentIndex = uiProvider.selectedMenuOpt;

    return BottomNavigationBar(
      onTap: (int i) => uiProvider.selectedMenuOpt = i, // Permite especificar un metodo en el que recibiriamos el indice seleccionado
      currentIndex: currentIndex, // Elemento seleccionado, primero: 0, segundo: 1
      elevation: 0,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.map_sharp),
          label: 'Mapa'
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.directions),
          label:'Direcciones'
        )
      ]
    );
  }
}