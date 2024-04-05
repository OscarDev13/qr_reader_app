import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
import 'package:qr_reader_2/widgets/scan_tiles.dart';

// import '../providers/scan_list_provider.dart';

class MapasPage extends StatelessWidget {
   
  const MapasPage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    return const ScanTiles(tipo:'geo');
    // final scanListProvider = Provider.of<ScanListProvider>(context); // Aqui si se necesita redibujar
    // final scans = scanListProvider.scans;

    // return ListView.builder(
    //   itemCount: scans.length,
    //   itemBuilder: (_,i)=> Dismissible(
    //     key: UniqueKey(), // key es el elemento que tiene que borrar, Uniquekey() genera un key unico 
    //     background: Container(
    //       color: Colors.red,
    //     ),
    //     onDismissed: ( DismissDirection direction) {
    //       Provider.of<ScanListProvider>(context, listen: false).borrarScanPorId(scans[i].id!);
    //     } ,  
    //     child: ListTile(
    //       leading: Icon(Icons.map, color: Theme.of(context).primaryColor,),
    //       title: Text(scans[i].valor),
    //       subtitle: Text(scans[i].id.toString()),
    //       trailing: const Icon(Icons.keyboard_arrow_right, color: Colors.grey,),
    //       onTap: ()=> print(scans[i].id),
    //     ),
    //   )
    // );
  }
}