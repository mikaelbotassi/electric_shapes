import 'package:electric_shapes/src/models.dart';
import 'package:electric_shapes/src/shapes/electric_shape/electric_shape.dart';
import 'package:flutter/material.dart';

/// Símbolo de poste de concreto duplo T existente.
///
/// O desenho usa um retângulo com duas curvas internas laterais.
class PosteConcretoDtExistenteSymbol extends ElectricShape {
  /// Cria um símbolo de poste de concreto duplo T existente.
  const PosteConcretoDtExistenteSymbol({
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
      painter: _RetanguloCurvasLateraisPainter(
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
    Object? latLong = const Object()
  }) {
    return PosteConcretoDtExistenteSymbol(
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

class _RetanguloCurvasLateraisPainter extends CustomPainter {
  _RetanguloCurvasLateraisPainter({
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

    final left = size.width * 0.12;
    final top = size.height * 0.10;
    final right = size.width * 0.88;
    final bottom = size.height * 0.90;
    final midY = (top + bottom) / 2;

    // Quadrado externo
    final outerRect = Rect.fromLTRB(left, top, right, bottom);
    canvas.drawRect(outerRect, paint);

    // Curva interna esquerda
    final leftCurve = Path()
      ..moveTo(left, top)
      ..quadraticBezierTo(
        size.width * 0.42,
        midY,
        left,
        bottom,
      );

    // Curva interna direita
    final rightCurve = Path()
      ..moveTo(right, top)
      ..quadraticBezierTo(
        size.width * 0.58,
        midY,
        right,
        bottom,
      );

    canvas.drawPath(leftCurve, paint);
    canvas.drawPath(rightCurve, paint);
  }

  @override
  bool shouldRepaint(
      covariant _RetanguloCurvasLateraisPainter oldDelegate,
      ) {
    return oldDelegate.color != color ||
        oldDelegate.strokeWidth != strokeWidth;
  }
}
