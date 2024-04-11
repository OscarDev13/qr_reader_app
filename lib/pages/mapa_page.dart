import 'dart:async';

import 'package:flutter/material.dart';
import 'package:qr_reader_2/models/scan_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapaPage extends StatefulWidget {
   
  const MapaPage({Key? key}) : super(key: key);

  @override
  State<MapaPage> createState() => _MapaPageState();
}

class _MapaPageState extends State<MapaPage> {

  final Completer<GoogleMapController> _controller = Completer<GoogleMapController>(); // Podemos hacer cualquier cosa con el controller
  MapType mapType = MapType.normal;

  @override
  Widget build(BuildContext context) {
    
    final ScanModel scan = ModalRoute.of(context)!.settings.arguments as ScanModel;

    final CameraPosition puntoInicial = CameraPosition(
    // target: LatLng(37.42796133580664, -122.085749655962),
    target: scan.getLatLng(),
    zoom: 17.5,
    tilt: 50
  );

  // Marcadores:
  Set<Marker> markers =  Set<Marker>();
  // Set<Marker> markers;
  markers.add(Marker(
    markerId: MarkerId('geo-location'), 
    position:scan.getLatLng() 
  ));
    // ignore: unused_local_variable
    // final ScanModel scan = ModalRoute.of(context).settings.arguments;


    return Scaffold(
      appBar: AppBar(
        actionsIconTheme: const IconThemeData(color: Colors.white),
        title: const Text('Coordenadas', style: TextStyle( color: Colors.white),),
        actions: [
          IconButton(
            icon: Icon(Icons.location_on_outlined),
            onPressed: () async {
              final GoogleMapController controller = await _controller.future;
              controller.animateCamera(
                CameraUpdate.newCameraPosition(
                  CameraPosition( //Controlar la posicion de la camaraaaaaa
                    target: scan.getLatLng(),
                    zoom: 17,
                    tilt: 50
                  )
                )
              );
            }, 
          )
        ],
      ),
      body: GoogleMap(
        myLocationButtonEnabled: false,
        markers: markers,
        mapType: mapType,
        initialCameraPosition: puntoInicial,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.layers_outlined, color: Colors.white,),
        onPressed: (){
          if(mapType == MapType.normal){
            mapType = MapType.satellite;
          }else{
            mapType = MapType.normal;
          }
          setState(() {});
        }
      ),      
    );
  }
}