// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel()
  ..orderIndex = json['orderIndex'] as int?
  ..catColor = json['catColor'] == null
      ? null
      : CatColorModel.fromJson(json['catColor'] as Map<String, dynamic>)
  ..supplyFee = (json['supplyFee'] as num?)?.toDouble()
  ..status = json['status'] as bool?
  ..visibility = json['visibility'] as String?
  ..createdAt = json['createdAt'] as String?
  ..time = json['time'] as int?
  ..bufferTime = json['bufferTime'] as int?
  ..imageURL = json['imageURL'] as String?
  ..data = json['data'] as String?
  ..updatedAt = json['updatedAt'] as String?
  ..catName = json['catName'] as String?
  ..SK = json['SK'] as String?
  ..productColor = json['productColor'] == null
      ? null
      : CatColorModel.fromJson(json['productColor'] as Map<String, dynamic>)
  ..price = (json['price'] as num?)?.toDouble()
  ..PK = json['PK'] as String?
  ..productName = json['productName'] as String?
  ..productId = json['productId'] as String?
  ..categories = (json['categories'] as List<dynamic>?)
      ?.map((e) => CategoryModel.fromJson(e as Map<String, dynamic>))
      .toList();

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'orderIndex': instance.orderIndex,
      'catColor': instance.catColor?.toJson(),
      'supplyFee': instance.supplyFee,
      'status': instance.status,
      'visibility': instance.visibility,
      'createdAt': instance.createdAt,
      'time': instance.time,
      'bufferTime': instance.bufferTime,
      'imageURL': instance.imageURL,
      'data': instance.data,
      'updatedAt': instance.updatedAt,
      'catName': instance.catName,
      'SK': instance.SK,
      'productColor': instance.productColor?.toJson(),
      'price': instance.price,
      'PK': instance.PK,
      'productName': instance.productName,
      'productId': instance.productId,
      'categories': instance.categories?.map((e) => e.toJson()).toList(),
    };
