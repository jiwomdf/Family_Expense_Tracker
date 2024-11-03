// To parse this JSON data, do
//
//     final holidayResponse = holidayResponseFromJson(jsonString);

class HolidayResponse {
  String? date;
  String? localName;
  String? name;
  String? countryCode;
  bool? fixed;
  bool? global;
  String? counties;
  String? launchYear;
  List<String>? types;

  HolidayResponse({
    this.date,
    this.localName,
    this.name,
    this.countryCode,
    this.fixed,
    this.global,
    this.counties,
    this.launchYear,
    this.types,
  });

  static List<HolidayResponse> toListMap(Iterable json) {
    return json.map((e) => HolidayResponse.fromJson(e)).toList();
  }

  factory HolidayResponse.fromJson(Map<String, dynamic> json) =>
      HolidayResponse(
        date: json["date"],
        localName: json["localName"],
        name: json["name"],
        countryCode: json["countryCode"],
        fixed: json["fixed"],
        global: json["global"],
        counties: json["counties"],
        launchYear: json["launchYear"],
        types: json["types"] == null
            ? []
            : List<String>.from(json["types"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "date": date,
        "localName": localName,
        "name": name,
        "countryCode": countryCode,
        "fixed": fixed,
        "global": global,
        "counties": counties,
        "launchYear": launchYear,
        "types": types == null ? [] : List<dynamic>.from(types!.map((x) => x)),
      };
}
