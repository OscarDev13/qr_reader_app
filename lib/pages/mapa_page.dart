import 'package:flutter/material.dart';
import 'package:qr_reader_2/models/scan_model.dart';

class MapaPage extends StatelessWidget {
   
  const MapaPage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    // ignore: unused_local_variable
    // final ScanModel scan = ModalRoute.of(context).settings.arguments;
    final ScanModel scan = ModalRoute.of(context)!.settings.arguments as ScanModel;


    return Scaffold(
      appBar: AppBar(
        actionsIconTheme: IconThemeData(color: Colors.white),
        title: const Text('Coordenadas', style: TextStyle( color: Colors.white),),
      ),
      body: Center(
         child: Text(scan.valor),
      ),
    );
  }
}