import 'package:flutter/material.dart';

class UiProvider extends ChangeNotifier{

  // Se va a ocupar para decirle a la aplicacion cual es el indice seleccionado
  int _selectedMenuOpt = 0; // Hasta que se consuma el valor actual de la propiedad es cuando se va a ver el cambio

  int get selectedMenuOpt {
    return _selectedMenuOpt;
  }

  set selectedMenuOpt(int index ) {
    _selectedMenuOpt = index;
    // Notificar a cualquier widget que este escuchando
    notifyListeners();
  }


}