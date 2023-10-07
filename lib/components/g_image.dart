import 'dart:io';

import 'package:flutter/material.dart';

class GImage extends Image {
  GImage.asset({
    Key? key,
    required String name,
    double? width,
    double? height,
    Color? color,
    BoxFit boxFit = BoxFit.cover,
  }) : super(
          key: key,
          image: ResizeImage.resizeIfNeeded(
            null,
            null,
            AssetImage(name),
          ),
          width: width,
          height: height,
          color: color,
          fit: boxFit,
        );

  GImage.file({
    Key? key,
    required File file,
    double? width,
    double? height,
    Color? color,
    BoxFit boxFit = BoxFit.cover,
  }) : super(
          key: key,
          image: ResizeImage.resizeIfNeeded(
            null,
            null,
            FileImage(file),
          ),
          width: width,
          height: height,
          color: color,
          fit: boxFit,
        );
}
