// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_order_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyOrderList _$MyOrderListFromJson(Map<String, dynamic> json) {
  return MyOrderList(
    id: json['id'] as int?,
    idRoute: json['idRoute'] as int,
    currencySom: (json['currency_Som'] as num?)?.toDouble(),
    location: json['location'] as String?,
    date: json['date'] as String?,
    status: (json['status'] as num?)?.toDouble(),
    controlStatus: (json['control_status'] as num?)?.toDouble(),
    statusPlaces: (json['status_places'] as num?)?.toDouble(),
    note: json['note'] as String?,
    countryRecipient: json['country_recipient'] as int,
    currencyRecipient: json['currency_recipient'] as int?,
  );
}

Map<String, dynamic> _$MyOrderListToJson(MyOrderList instance) =>
    <String, dynamic>{
      'id': instance.id,
      'idRoute': instance.idRoute,
      'currency_Som': instance.currencySom,
      'location': instance.location,
      'date': instance.date,
      'status': instance.status,
      'control_status': instance.controlStatus,
      'status_places': instance.statusPlaces,
      'note': instance.note,
      'country_recipient': instance.countryRecipient,
      'currency_recipient': instance.currencyRecipient,
    };
