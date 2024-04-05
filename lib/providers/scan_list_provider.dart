


import 'package:flutter/material.dart';

import 'package:qr_reader_2/providers/db_provider.dart';

class ScanListProvider extends ChangeNotifier {

  List<ScanModel> scans = [];
  String tipoSeleccionado = 'http';

  // Cuando se haga un registro de escaneo
  Future<ScanModel> nuevoScan(String valor ) async {
    final nuevoScan =  ScanModel(valor: valor);
    final id = await DBProvider.db.nuevoScan(nuevoScan);
    // Asignar el ID de la base de datos al modelo
    nuevoScan.id = id;
    if(tipoSeleccionado == nuevoScan.tipo){
      scans.add(nuevoScan);
      notifyListeners(); //Notifique a los widgets cuando hay un cambio que necesite redibujarse
    }
    return nuevoScan;
  }

  cargarScans() async {
    final scans = await DBProvider.db.showAllScans();
    this.scans = [...scans]; // Nuevo listado
    notifyListeners();
  }

  cargarScansPorTipo(String tipo) async {
    final scans = await DBProvider.db.getScansByType(tipo);
    this.scans = [...scans];
    tipoSeleccionado = tipo;
    notifyListeners();
  }

  borrarTodos()async{
    await DBProvider.db.deleteScans();
    scans = [];
    notifyListeners();
  }

  borrarScanPorId(int id)async {
    await DBProvider.db.deleteScan(id);
    cargarScansPorTipo(tipoSeleccionado);
    // notifyListeners();
  }

}