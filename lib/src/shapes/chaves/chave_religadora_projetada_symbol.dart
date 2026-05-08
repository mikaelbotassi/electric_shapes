import 'package:electric_shapes/src/shapes/electric_shape.dart';
import 'package:electric_shapes/src/shapes/svg_asset_shape.dart';
import 'package:flutter/material.dart';

class ChaveReligadoraProjetadaSymbol extends ElectricShape {
  const ChaveReligadoraProjetadaSymbol({
    super.key,
    super.size = 180,
    super.color = const Color(0xFF2F3437),
    super.strokeWidth = 1,
  });

  static const _assetPath = 'assets/svg/chaves/chave_religadora_projetada.svg';
  static const _aspectRatio = 2.4;

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
    return ChaveReligadoraProjetadaSymbol(
      color: color ?? this.color,
      strokeWidth: strokeWidth ?? this.strokeWidth,
      size: size ?? this.size,
    );
  }
}
