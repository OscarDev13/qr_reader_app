// To parse this JSON data, do
//
//     final scanModel = scanModelFromMap(jsonString);

import 'dart:convert';

import 'package:google_maps_flutter/google_maps_flutter.dart' show LatLng;
// import 'package:meta/meta.dart';

ScanModel scanModelFromMap(String str) => ScanModel.fromMap(json.decode(str));

String scanModelToMap(ScanModel data) => json.encode(data.toJson());

class ScanModel {
    int? id;
    String? tipo;
    String valor;

    ScanModel({
        this.id,
        this.tipo,
        required this.valor,
    })
    {
      if(valor.contains('http')){
        tipo = 'http';
      }else {
        tipo = 'geo';
      }
    }
      // ScanModel({
  //   this.id,
  //   this.tipo,
  //   required this.valor,
  // }) : tipo = valor.contains('http') ? 'http' : 'geo'; 
    // ScanModel({required this.id, required String tipo, required this.valor}) {
    //   // this.tipo = tipo ?? (valor.contains('http') ? 'http' : 'geo');
    // }

    LatLng getLatLng() {
      final latLng = valor.substring(4).split(',');
      final lat = double.parse( latLng[0] );
      final lng = double.parse( latLng[1] );
      return LatLng(lat, lng);
    }

    factory ScanModel.fromMap(Map<String, dynamic> json) => ScanModel( //fromJson
        id: json["id"],
        tipo: json["tipo"],
        valor: json["valor"],
    );

    // Map<String, dynamic> toJson() => {
    //     "id": id,
    //     "tipo": tipo,
    //     "valor": valor,
    // };
    Map<String,dynamic> toJson() {
      var map = <String, dynamic>   {};

      map['id'] = id;
      map['tipo']=tipo;
      map['valor']=valor;
      return map;
    }
}
