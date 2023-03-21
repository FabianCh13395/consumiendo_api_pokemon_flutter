import 'dart:convert';

GetDataModel getDataModelFromJson(String str) =>
    GetDataModel.fromJson(json.decode(str));

String getDataModelToJson(GetDataModel data) => json.encode(data.toJson());

class GetDataModel {
  GetDataModel({
    required this.results,
  });

  List<Result> results;

  factory GetDataModel.fromJson(Map<String, dynamic> json) => GetDataModel(
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class Result {
  Result({
    required this.pokId,
    required this.pokNum,
    required this.pokName,
    required this.pokImg,
    required this.pokTipo,
    required this.pokAltura,
    required this.pokPeso,
    required this.pokGif,
  });

  int pokId;
  String pokNum;
  String pokName;
  String pokImg;
  String pokTipo;
  String pokAltura;
  String pokPeso;
  String pokGif;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        pokId: json["pok_id"],
        pokNum: json["pok_num"],
        pokName: json["pok_name"],
        pokImg: json["pok_img"],
        pokTipo: json["pok_tipo"],
        pokAltura: json["pok_altura"],
        pokPeso: json["pok_peso"],
        pokGif: json["pok_gif"],
      );

  Map<String, dynamic> toJson() => {
        "pok_id": pokId,
        "pok_num": pokNum,
        "pok_name": pokName,
        "pok_img": pokImg,
        "pok_tipo": pokTipo,
        "pok_altura": pokAltura,
        "pok_peso": pokPeso,
        "pok_gif": pokGif,
      };
}
