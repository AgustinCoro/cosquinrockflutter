import 'dart:convert';

List<Grupo> grupoFromJson(String str) => List<Grupo>.from(json.decode(str).map((x) => Grupo.fromJson(x)));

String grupoToJson(List<Grupo> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Grupos{
  List<Grupo> items = List.empty(growable: true);

  Grupos();

  Grupos.fromJsonList(List<dynamic> jsonList){
    if (jsonList == null) return;
    for (var item in jsonList){
      final grupo =  Grupo.fromJson(item);
      items.add(grupo);
    }
  }
}


class Grupo {
    Grupo({
        required this.estadio,
        required this.banda,
        required this.fecha,
    });

    String estadio;
    String banda;
    String fecha;

    factory Grupo.fromJson(Map<String, dynamic> json) => Grupo(
        estadio: json["estadio"],
        banda: json["banda"],
        fecha: json["fecha"],
    );

    Map<String, dynamic> toJson() => {
        "estadio": estadio,
        "banda": banda,
        "fecha": fecha,
    };
}