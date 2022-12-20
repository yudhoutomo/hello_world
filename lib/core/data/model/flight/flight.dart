import 'package:json_annotation/json_annotation.dart';
part '../../../../gen/core/data/model/flight/flight.g.dart';

@JsonSerializable()
class Flight {
  @JsonKey(name: 'airport_name')
  String airportName = "";

  @JsonKey(name: 'business_id')
  String businessId = "";

  @JsonKey(name: 'airport_code')
  String airportCode = "";

  @JsonKey(name: 'business_name_trans_id')
  String businessNameTransId = "";

  @JsonKey(name: 'location_name')
  String locationName = "";

  @JsonKey(name: 'country_id')
  String countryId = "";

  @JsonKey(name: 'country_name')
  String countryName = "";

  String label = "";

  Flight({
    required this.airportName,
    required this.businessId,
    required this.airportCode,
    required this.businessNameTransId,
    required this.locationName,
    required this.countryId,
    required this.countryName,
    required this.label,
  });

  factory Flight.fromJson(Map<String, dynamic> json) => _$FlightFromJson(json);

  Map<String, dynamic> toJson() => _$FlightToJson(this);
}
