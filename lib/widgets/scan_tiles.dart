// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader_2/providers/scan_list_provider.dart';
import 'package:qr_reader_2/utils/utilis.dart';
// import 'package:url_launcher/url_launcher.dart';

class ScanTiles extends StatelessWidget {
  const ScanTiles({
    Key? key,
    required this.tipo,
  }) : super(key: key);

  final String tipo;

  @override
  Widget build(BuildContext context) {
    
    final scanListProvider = Provider.of<ScanListProvider>(context); // Aqui si se necesita redibujar
    final scans = scanListProvider.scans;

    return ListView.builder(
      itemCount: scans.length,
      itemBuilder: (_,i)=> Dismissible(
        key: UniqueKey(), // key es el elemento que tiene que borrar, Uniquekey() genera un key unico 
        background: Container(
          color: Colors.red,
        ),
        onDismissed: ( DismissDirection direction) {
          Provider.of<ScanListProvider>(context, listen: false).borrarScanPorId(scans[i].id!);
        } ,  
        child: ListTile(
          leading: Icon(
            tipo == 'http'
            ? Icons.link
            : Icons.location_on, 
          color: Theme.of(context).primaryColor,),
          title: Text(scans[i].valor),
          subtitle: Text(scans[i].id.toString()),
          trailing: const Icon(Icons.keyboard_arrow_right, color: Colors.grey,),
          onTap: ()=> launchURL(context,scans[i]),
        ),
      )
    );
  }
}
