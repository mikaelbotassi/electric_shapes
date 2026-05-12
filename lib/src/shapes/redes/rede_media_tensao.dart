import 'package:electric_shapes/src/models.dart';
import 'package:electric_shapes/src/shapes/electric_shape/electric_shape.dart';
import 'package:electric_shapes/src/shapes/redes/horizontal_line_painter.dart';
import 'package:flutter/material.dart';

/// Símbolo de rede de média tensão.
///
/// Renderiza uma linha horizontal tracejada.
class RedeMediaTensaoSymbol extends ElectricShape {
  /// Cria um símbolo de rede de média tensão.
  const RedeMediaTensaoSymbol({
    super.key,
    super.size = 180,
    super.color = const Color(0xFF2F3437),
    super.strokeWidth = 1,
    super.latLong,
    super.text,
    super.fontSize = 16
  });

  @override
  Widget buildShape(BuildContext context) {
    return CustomPaint(
      size: Size(size * 2.8, size * 0.28),
      painter: HorizontalLinePainter(
        color: color,
        strokeWidth: strokeWidth,
        isDashed: true,
      ),
    );
  }

  @override
  /// Retorna uma cópia do símbolo com as propriedades informadas.
  ElectricShape copyWith({
    double? size,
    Color? color,
    double? strokeWidth,
    String? text,
    double? fontSize,
    Object? latLong = const Object()
  }) {
    return RedeMediaTensaoSymbol(
      color: color ?? this.color,
      strokeWidth: strokeWidth ?? this.strokeWidth,
      size: size ?? this.size,
      latLong: identical(latLong, const Object())
          ? this.latLong
          : latLong as LatLong?,
      text: text ?? this.text,
      fontSize: fontSize ?? this.fontSize,
    );
  }
}
