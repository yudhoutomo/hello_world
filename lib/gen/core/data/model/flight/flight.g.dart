// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../../../core/data/model/flight/flight.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Flight _$FlightFromJson(Map<String, dynamic> json) => Flight(
      airportName: json['airport_name'] as String,
      businessId: json['business_id'] as String,
      airportCode: json['airport_code'] as String,
      businessNameTransId: json['business_name_trans_id'] as String,
      locationName: json['location_name'] as String,
      countryId: json['country_id'] as String,
      countryName: json['country_name'] as String,
      label: json['label'] as String,
    );

Map<String, dynamic> _$FlightToJson(Flight instance) => <String, dynamic>{
      'airport_name': instance.airportName,
      'business_id': instance.businessId,
      'airport_code': instance.airportCode,
      'business_name_trans_id': instance.businessNameTransId,
      'location_name': instance.locationName,
      'country_id': instance.countryId,
      'country_name': instance.countryName,
      'label': instance.label,
    };
