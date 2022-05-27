import 'package:json_annotation/json_annotation.dart';

part 'my_order_list.g.dart';

@JsonSerializable()
class MyOrderList {
  final int? id;
  final int idRoute;
  @JsonKey(name: 'currency_Som')
  final double? currencySom;
  final String? location;
  final String? date;
  final double? status;
  @JsonKey(name: 'control_status')
  final double? controlStatus;
  @JsonKey(name: 'status_places')
  final double? statusPlaces;
  final String? note;
  @JsonKey(name: 'country_recipient')
  final int countryRecipient;
  @JsonKey(name: 'currency_recipient')
  final int? currencyRecipient;

  MyOrderList({
    this.id,
    required this.idRoute,
    this.currencySom,
    this.location,
    this.date,
    this.status,
    this.controlStatus,
    this.statusPlaces,
    this.note,
    required this.countryRecipient,
    this.currencyRecipient
});

  factory MyOrderList.fromJson(Map<String, dynamic> json) =>
      _$MyOrderListFromJson(json);

  Map<String, dynamic> toJson() => _$MyOrderListToJson(this);

}
