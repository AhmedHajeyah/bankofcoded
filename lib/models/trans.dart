import 'package:json_annotation/json_annotation.dart';
part 'trans.g.dart';

@JsonSerializable()
class Transctions {
  int? id;
  int payerId;
  int receiverId;
  int amount;
  String type;

  factory Transctions.fromJson(Map<String, dynamic> json) =>
      _$TransctionsFromJson(json);
  Map<String, dynamic> toJson() => _$TransctionsToJson(this);

  Transctions(
      {this.id,
      required this.payerId,
      required this.receiverId,
      required this.amount,
      required this.type});
}
