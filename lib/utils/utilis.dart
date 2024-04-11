import 'package:flutter/material.dart';
import 'package:qr_reader_2/models/scan_model.dart';
import 'package:url_launcher/url_launcher.dart';

// final String url = 'https://flutter.dev';

// Future<void> launchUrl() async {
//   if (!await launchUrl(_url)) {
//     throw Exception('Could not launch $_url');
//   }
// }

launchURL(BuildContext context, ScanModel scanModel ) async {

  final url = scanModel.valor;

  if (scanModel.tipo == 'http'){
    if(await canLaunchUrl(Uri.parse(url))){
      await launchUrl(Uri.parse(url));
    }else{
      throw 'Could not launc $url';
    }
  }else{
    Navigator.pushNamed(context, 'mapa', arguments: scanModel);
  }

}

// Future<void> launchURL( BuildContext context, ScanModel scan  ) async {
 
//   final url = scan.valor;
 
//   if ( scan.tipo == 'http' ) {
//     //. link web.
//     if (await canLaunchUrl(Uri.parse(url))) {
//       await launchUrl(Uri.parse(url), mode: LaunchMode.inAppWebView);
//     } else {
//       throw 'Could not launch $url'; 
//     }
 
//   } else {
//     Navigator.pushNamed(context, 'mapa', arguments: scan );
//   }
 
// }