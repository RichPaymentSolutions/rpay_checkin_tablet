// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryModel _$CategoryModelFromJson(Map<String, dynamic> json) =>
    CategoryModel(
      catName: json['catName'] as String?,
    )
      ..orderIndex = json['orderIndex'] as int?
      ..catColor = json['catColor'] == null
          ? null
          : CatColorModel.fromJson(json['catColor'] as Map<String, dynamic>)
      ..data = json['data'] as String?
      ..updatedAt = json['updatedAt'] as String?
      ..createdAt = json['createdAt'] as String?
      ..sK = json['sK'] as String?
      ..pK = json['pK'] as String?
      ..catId = json['catId'] as String?
      ..products = (json['products'] as List<dynamic>?)
          ?.map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$CategoryModelToJson(CategoryModel instance) =>
    <String, dynamic>{
      'orderIndex': instance.orderIndex,
      'catColor': instance.catColor?.toJson(),
      'data': instance.data,
      'updatedAt': instance.updatedAt,
      'catName': instance.catName,
      'createdAt': instance.createdAt,
      'sK': instance.sK,
      'pK': instance.pK,
      'catId': instance.catId,
      'products': instance.products?.map((e) => e.toJson()).toList(),
    };

CatColorModel _$CatColorModelFromJson(Map<String, dynamic> json) =>
    CatColorModel(
      secondary: json['secondary'] as String?,
      primary: json['primary'] as String?,
    );

Map<String, dynamic> _$CatColorModelToJson(CatColorModel instance) =>
    <String, dynamic>{
      'secondary': instance.secondary,
      'primary': instance.primary,
    };
