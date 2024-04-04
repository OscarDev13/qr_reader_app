
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader_2/providers/scan_list_provider.dart';

class ScanButton extends StatelessWidget {
  const ScanButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 0,
      child: const Icon(Icons.filter_center_focus),
      onPressed: () async {

        // String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        //                                             '#D38BEF', 
        //                                             'Cancelar', 
        //                                             false, 
        //                                             ScanMode.QR);
        final barcodeScanRes = 'https://oscar-perez.com';
        //  print('aquiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii $barcodeScanRes termina');
        final scanListProvider = Provider.of<ScanListProvider>(context, listen: false); // Busca en el arbol de widgets la instancia de scanListProvider
        scanListProvider.nuevoScan(barcodeScanRes);
        scanListProvider.nuevoScan('geo:15.33,15.45');
      }
    );
  }
}