import 'package:json_annotation/json_annotation.dart';
part 'customer_model.g.dart';

@JsonSerializable()
class CustomerModel {
  String? customerId;
  String? phone;
  String? email;
  String? firstName;
  String? lastName;
  String? birthday;
  double? points;
  String? name;

  CustomerModel();
  factory CustomerModel.fromJson(Map<String, dynamic> json) =>
      _$CustomerModelFromJson(json);
}
