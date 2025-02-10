// To parse this JSON data, do
//
//     final grupoPersonalizado = grupoPersonalizadoFromJson(jsonString);

import 'dart:convert';

List<GrupoPersonalizado> grupoPersonalizadoFromJson(String str) => List<GrupoPersonalizado>.from(json.decode(str).map((x) => GrupoPersonalizado.fromJson(x)));

String grupoPersonalizadoToJson(List<GrupoPersonalizado> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GruposPersonalizados{
  List<GrupoPersonalizado> items = List.empty(growable: true);

  GruposPersonalizados();

  GruposPersonalizados.fromJsonList(List<dynamic> jsonList){
    if (jsonList == null) return;
    for (var item in jsonList){
      final grupoPersonalizado =  GrupoPersonalizado.fromJson(item);
      items.add(grupoPersonalizado);
    }
  }
}

class GrupoPersonalizado {
    GrupoPersonalizado({
        required this.id,
        required this.estadio,
        required this.banda,
        required this.fecha,
    });

    int id;
    String estadio;
    String banda;
    String fecha;

    factory GrupoPersonalizado.fromJson(Map<String, dynamic> json) => GrupoPersonalizado(
        id: json["id"],
        estadio: json["estadio"],
        banda: json["banda"],
        fecha: json["fecha"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "estadio": estadio,
        "banda": banda,
        "fecha": fecha,
    };
}