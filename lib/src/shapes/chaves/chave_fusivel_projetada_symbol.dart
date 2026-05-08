import 'package:electric_shapes/src/shapes/electric_shape.dart';
import 'package:electric_shapes/src/shapes/svg_asset_shape.dart';
import 'package:flutter/material.dart';

class ChaveFusivelProjetadaSymbol extends ElectricShape {
  const ChaveFusivelProjetadaSymbol({
    super.key,
    super.size = 180,
    super.color = const Color(0xFF2F3437),
    super.strokeWidth = 1,
  });

  static const _assetPath = 'assets/svg/chaves/chave_fusivel_projetada.svg';
  static const _aspectRatio = 2.6;

  @override
  Widget build(BuildContext context) {
    return SvgAssetShape(
      assetPath: _assetPath,
      aspectRatio: _aspectRatio,
      size: size,
      color: color,
      strokeWidth: strokeWidth,
    );
  }

  @override
  ElectricShape copyWith({double? size, Color? color, double? strokeWidth}) {
    return ChaveFusivelProjetadaSymbol(
      color: color ?? this.color,
      strokeWidth: strokeWidth ?? this.strokeWidth,
      size: size ?? this.size,
    );
  }
}
