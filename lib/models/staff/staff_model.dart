import 'package:json_annotation/json_annotation.dart';
import 'package:rp_checkin/models/product/product_model.dart';
part 'staff_model.g.dart';

@JsonSerializable(explicitToJson: true)
class StaffModel {
  StaffColorModel? staffColor;
  int? cleanFee;
  int? orderIndex;
  String? cleanFeeType;
  String? createdAt;
  bool? isDeleted;
  bool? tipChargeCheck;
  String? cashAndRatePercentageForTip;
  String? name;
  String? cashAndCheckPercentage;
  int? tipCharge;
  String? role;
  String? data;
  String? updatedAt;
  bool? tipChargeCash;
  String? sK;
  int? commission;
  String? passcode;
  String? pK;
  String? phone;
  int? hardSalary;
  String? staffId;
  List<ProductModel>? services;

  bool checkServiceContain(ProductModel service) {
    return (services ?? [])
        .where((e) => e.productId == service.productId)
        .isNotEmpty;
  }

  removeService(ProductModel service) {
    (services ?? []).removeWhere((e) => e.productId == service.productId);
  }

  addService(ProductModel service) {
    services ??= [];
    services!.add(service);
  }

  StaffModel(
      {this.staffColor,
      this.cleanFee,
      this.orderIndex,
      this.cleanFeeType,
      this.createdAt,
      this.isDeleted,
      this.tipChargeCheck,
      this.cashAndRatePercentageForTip,
      this.name,
      this.cashAndCheckPercentage,
      this.tipCharge,
      this.role,
      this.data,
      this.updatedAt,
      this.tipChargeCash,
      this.sK,
      this.commission,
      this.passcode,
      this.pK,
      this.phone,
      this.hardSalary,
      this.staffId});
  factory StaffModel.fromJson(Map<String, dynamic> json) =>
      _$StaffModelFromJson(json);
  Map<String, dynamic> toJson() => _$StaffModelToJson(this);
}

@JsonSerializable()
class StaffColorModel {
  String? secondary;
  String? primary;

  StaffColorModel({
    this.secondary,
    this.primary,
  });
  factory StaffColorModel.fromJson(Map<String, dynamic> json) =>
      _$StaffColorModelFromJson(json);
  Map<String, dynamic> toJson() => _$StaffColorModelToJson(this);
}
