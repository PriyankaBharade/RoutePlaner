// To parse this JSON data, do
//
//     final country = countryFromJson(jsonString);

import 'dart:convert';

Country countryFromJson(String str) => Country.fromJson(json.decode(str));

String countryToJson(Country data) => json.encode(data.toJson());

class Country {
    Country({
        required this.status,
        required this.responseCode,
        required this.message,
        required this.countries,
    });

    bool status;
    int responseCode;
    String message;
    List<CountryElement> countries;

    factory Country.fromJson(Map<String, dynamic> json) => Country(
        status: json["status"],
        responseCode: json["responseCode"],
        message: json["message"],
        countries: List<CountryElement>.from(json["countries"].map((x) => CountryElement.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "responseCode": responseCode,
        "message": message,
        "countries": List<dynamic>.from(countries.map((x) => x.toJson())),
    };
}

class CountryElement {
    CountryElement({
        required this.id,
        required this.countryName,
        required this.countrycode,
        required this.dialingcode,
    });

    String id;
    String countryName;
    String countrycode;
    String dialingcode;

    factory CountryElement.fromJson(Map<String, dynamic> json) => CountryElement(
        id: json["id"],
        countryName: json["country_name"],
        countrycode: json["countrycode"],
        dialingcode: json["dialingcode"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "country_name": countryName,
        "countrycode": countrycode,
        "dialingcode": dialingcode,
    };
}
