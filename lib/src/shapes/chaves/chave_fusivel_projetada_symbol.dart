import 'package:electric_shapes/electric_shapes.dart';
import 'package:electric_shapes/src/shapes/electric_shape/latlong_desc_widget.dart';
import 'package:flutter/material.dart';

/// Símbolo de chave fusível projetada.
///
/// Adiciona um anel circular ao desenho da chave para indicar elemento
/// projetado.
class ChaveFusivelProjetadaSymbol extends ElectricShape {
  /// Cria um símbolo de chave fusível projetada.
  const ChaveFusivelProjetadaSymbol({
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
      size: Size(size * (559 / 280), size),
      painter: _ChaveFusivelProjetadaPainter(
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
    return ChaveFusivelProjetadaSymbol(
      color: color ?? this.color,
      strokeWidth: strokeWidth ?? this.strokeWidth,
      size: size ?? this.size,
      latLong: latLong ?? this.latLong,
      text: text ?? this.text,
      fontSize: fontSize ?? this.fontSize,
    );
  }
}

class _ChaveFusivelProjetadaPainter extends CustomPainter {
  _ChaveFusivelProjetadaPainter({
    required this.color,
    this.strokeWidth,
  });

  final Color color;
  final double? strokeWidth;

  @override
  void paint(Canvas canvas, Size size) {
    final stroke = strokeWidth == null || strokeWidth! <= 1
        ? size.height * (8 / 280)
        : strokeWidth!;

    final strokePaint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = stroke
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..isAntiAlias = true;

    final fillPaint = Paint()
      ..color = color
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    Offset p(double x, double y) => Offset(size.width * x, size.height * y);

    final center = p(256 / 559, 140 / 280);
    final ringRadius = size.height * (136 / 280);
    final leftPivot = p(168.5 / 559, 136.5 / 280);
    final rightPivot = p(327.5 / 559, 137.5 / 280);
    final lowerJoint = p(325 / 559, 253 / 280);

    canvas
      ..drawCircle(center, ringRadius, strokePaint)
      ..drawLine(p(0, 136 / 280), p(169 / 559, 136 / 280), strokePaint)
      ..drawLine(p(327 / 559, 138 / 280), p(1, 138 / 280), strokePaint)
      ..drawCircle(leftPivot, size.height * (9.5 / 280), fillPaint)
      ..drawCircle(rightPivot, size.height * (9.5 / 280), fillPaint)
      ..drawCircle(lowerJoint, size.height * (7 / 280), fillPaint);

    final diagonalPath = Path()
      ..moveTo(size.width * (172.89062 / 559), size.height * (131.66797 / 280))
      ..lineTo(size.width * (168 / 559), size.height * (138 / 280))
      ..lineTo(size.width * (326 / 559), size.height * (260 / 280))
      ..lineTo(size.width * (330.89062 / 559), size.height * (253.66797 / 280))
      ..close();

    final fuseCurve = Path()
      ..moveTo(size.width * (171.17949 / 559), size.height * (140.13047 / 280))
      ..cubicTo(
        size.width * (180.37605 / 559),
        size.height * (135.87443 / 280),
        size.width * (195.09828 / 559),
        size.height * (133.27620 / 280),
        size.width * (208.34941 / 559),
        size.height * (139.33750 / 280),
      )
      ..cubicTo(
        size.width * (221.60054 / 559),
        size.height * (145.39881 / 280),
        size.width * (234.28517 / 559),
        size.height * (160.07072 / 280),
        size.width * (239.55058 / 559),
        size.height * (192.63828 / 280),
      )
      ..cubicTo(
        size.width * (245.09851 / 559),
        size.height * (226.95328 / 280),
        size.width * (260.64690 / 559),
        size.height * (245.68729 / 280),
        size.width * (278.01933 / 559),
        size.height * (254.32092 / 280),
      )
      ..cubicTo(
        size.width * (295.39176 / 559),
        size.height * (262.95356 / 280),
        size.width * (313.97631 / 559),
        size.height * (261.68157 / 280),
        size.width * (326.20488 / 559),
        size.height * (257.81406 / 280),
      );

    canvas
      ..drawPath(diagonalPath, fillPaint)
      ..drawPath(fuseCurve, strokePaint);
  }

  @override
  bool shouldRepaint(covariant _ChaveFusivelProjetadaPainter oldDelegate) {
    return oldDelegate.color != color ||
        oldDelegate.strokeWidth != strokeWidth;
  }
}
