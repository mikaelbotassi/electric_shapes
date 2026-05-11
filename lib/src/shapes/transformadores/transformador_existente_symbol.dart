import 'package:electric_shapes/src/shapes/electric_shape/electric_shape.dart';
import 'package:electric_shapes/src/shapes/electric_shape/latlong_desc_widget.dart';
import 'package:flutter/material.dart';

/// Símbolo de transformador existente.
///
/// É desenhado como um triângulo com contorno.
class TransformadorExistenteSymbol extends ElectricShape {
  /// Cria um símbolo de transformador existente.
  const TransformadorExistenteSymbol({
    super.key,
    super.size = 48,
    super.color = const Color(0xFF2F3437),
    super.strokeWidth = 1,
    super.latLong,
    super.text,
    super.fontSize = 16
  });

  @override
  Widget buildShape(BuildContext context) {
    return CustomPaint(
      size: Size.square(size),
      painter: _TrianglePainter(
        color: color,
        strokeWidth: strokeWidth,
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
    LatLong? latLong
  }) {
    return TransformadorExistenteSymbol(
      color: color ?? this.color,
      strokeWidth: strokeWidth ?? this.strokeWidth,
      size: size ?? this.size,
      latLong: latLong ?? this.latLong,
      text: text ?? this.text,
      fontSize: fontSize ?? this.fontSize,
    );
  }
}

class _TrianglePainter extends CustomPainter {
  _TrianglePainter({
    required this.color,
    this.strokeWidth,
  });

  final Color color;
  final double? strokeWidth;

  @override
  void paint(Canvas canvas, Size size) {
    final s = size.shortestSide;

    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth ?? s * 0.045
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..isAntiAlias = true;

    final trianglePath = Path()
      ..moveTo(size.width * 0.50, size.height * 0.08) // topo
      ..lineTo(size.width * 0.10, size.height * 0.90) // base esquerda
      ..lineTo(size.width * 0.90, size.height * 0.88) // base direita
      ..close();

    canvas.drawPath(trianglePath, paint);
  }

  @override
  bool shouldRepaint(covariant _TrianglePainter oldDelegate) {
    return oldDelegate.color != color ||
        oldDelegate.strokeWidth != strokeWidth;
  }
}
