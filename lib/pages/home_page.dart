import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader_2/db_provider.dart';
import 'package:qr_reader_2/models/scan_model.dart';
import 'package:qr_reader_2/pages/direcciones_page.dart';
// import 'package:qr_reader_2/pages/mapa_page.dart';
import 'package:qr_reader_2/pages/mapas_page.dart';
import 'package:qr_reader_2/providers/ui_provider.dart';
// import 'package:qr_reader_2/widgets/scan_button.dart';

import '../widgets/widgets.dart';
// import 'package:qr_reader_2/widgets/widgets.dart';

class HomePage extends StatelessWidget {
   
  const HomePage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Historial'),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.delete_forever))
        ],
      ),
      body: _HomePageBody(),
      floatingActionButton: const ScanButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const CustomNavigationBar(),
    );
  }
}

class _HomePageBody extends StatelessWidget {
  //  _HomePageBody({super.key});

  @override
  Widget build(BuildContext context) {

    //Obtener el selected menu opt
    final uiProvider = Provider.of<UiProvider>(context);

    // Cambiar para mostrar la pagina respectiva
    final currentIndex = uiProvider.selectedMenuOpt;


    //todo: temporal leer la base de datos
    // DBProvider.db.initDB();
    final tempScan = ScanModel( valor: 'http://google.com');
    // DBProvider.db.nuevoScan(tempScan);
    // DBProvider.db.getScanById(1).then((scan) => print(scan.valor)); 
    DBProvider.db.showAllScans().then(print);
    // DBProvider.db.showScans();

    switch (currentIndex) {
      case 0:
        return const MapasPage();
      case 1:
        return const DireccionesPage();
      default:
        return const MapasPage();
    }
  }
}