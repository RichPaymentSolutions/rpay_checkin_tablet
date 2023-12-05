import 'package:json_annotation/json_annotation.dart';
import 'package:rp_checkin/models/category/category_model.dart';
part 'product_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ProductModel {
  int? orderIndex;
  CatColorModel? catColor;
  double? supplyFee;
  bool? status;
  String? visibility;
  String? createdAt;
  int? time;
  int? bufferTime;
  String? imageURL;
  String? data;
  String? updatedAt;
  String? catName;
  String? SK;
  CatColorModel? productColor;
  double? price;
  String? PK;
  String? productName;
  String? productId;
  List<CategoryModel>? categories;
  ProductModel();
  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProductModelToJson(this);

  Map<String, dynamic> toJsonData() {
    return {
      "catId": categories?.first.catId,
      "catName": catName,
      "serviceId": productId,
      "serviceName": productName,
      "count": 1,
      "servicePrice": price,
      "serviceSupplyFee": supplyFee,
      "serviceQuantity": 1
    };
  }
}
