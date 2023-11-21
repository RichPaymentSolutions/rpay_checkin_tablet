import 'package:json_annotation/json_annotation.dart';
import 'package:rp_checkin/models/product/product_model.dart';
part 'category_model.g.dart';

@JsonSerializable(explicitToJson: true)
class CategoryModel {
  int? orderIndex;
  CatColorModel? catColor;
  String? data;
  String? updatedAt;
  String? catName;
  String? createdAt;
  String? sK;
  String? pK;
  String? catId;
  List<ProductModel>? products;
  CategoryModel();
  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);
}

@JsonSerializable()
class CatColorModel {
  String? secondary;
  String? primary;

  CatColorModel({this.secondary, this.primary});
  factory CatColorModel.fromJson(Map<String, dynamic> json) =>
      _$CatColorModelFromJson(json);
  Map<String, dynamic> toJson() => _$CatColorModelToJson(this);
}
