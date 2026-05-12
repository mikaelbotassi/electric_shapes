import 'dart:math' as math;

import 'package:electric_shapes/src/models.dart';
import 'package:electric_shapes/src/shapes/electric_shape/electric_shape.dart';
import 'package:flutter/material.dart';

/// Símbolo de poste de fibra de vidro projetado.
///
/// A metade direita do círculo externo é preenchida, com meia circunferência
/// interna à esquerda.
class PosteFibraVidroProjetadoSymbol extends ElectricShape {
  /// Cria um símbolo de poste de fibra de vidro projetado.
  const PosteFibraVidroProjetadoSymbol({
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
      size: Size.square(size),
      painter: _PosteFibraDeVidroProjetadoPainter(
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
    return PosteFibraVidroProjetadoSymbol(
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

class _PosteFibraDeVidroProjetadoPainter extends CustomPainter {
  _PosteFibraDeVidroProjetadoPainter({
    required this.color,
    this.strokeWidth,
  });

  final Color color;
  final double? strokeWidth;

  @override
  void paint(Canvas canvas, Size size) {
    final s = size.shortestSide;
    final stroke = strokeWidth ?? s * 0.045;

    final fillPaint = Paint()
      ..color = color
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    final borderPaint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = stroke
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..isAntiAlias = true;

    final center = Offset(size.width * 0.5, size.height * 0.5);

    final outerRadius = s * 0.39;
    final innerRadius = s * 0.16;

    final innerRect = Rect.fromCircle(center: center, radius: innerRadius);

    // Preenche somente a metade direita do círculo externo
    canvas..save()
    ..clipRect(Rect.fromLTRB(center.dx, 0, size.width, size.height))
    ..drawCircle(center, outerRadius, fillPaint)
    ..restore()

    // Contorno do círculo externo
    ..drawCircle(center, outerRadius, borderPaint)

    // Linha divisória vertical principal
    ..drawLine(
      Offset(center.dx, center.dy - outerRadius),
      Offset(center.dx, center.dy + outerRadius),
      borderPaint,
    );

    // Meia circunferência interna à esquerda
    final innerLeftSemiPath = Path()
      ..moveTo(center.dx, center.dy - innerRadius)
      ..arcTo(
        innerRect,
        -math.pi / 2,
        -math.pi,
        false,
      )
      ..lineTo(center.dx, center.dy + innerRadius)
      ..lineTo(center.dx, center.dy - innerRadius);

    canvas.drawPath(innerLeftSemiPath, borderPaint);
  }

  @override
  bool shouldRepaint(
      covariant _PosteFibraDeVidroProjetadoPainter oldDelegate,
      ) {
    return oldDelegate.color != color ||
        oldDelegate.strokeWidth != strokeWidth;
  }
}
