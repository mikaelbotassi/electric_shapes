import 'package:electric_shapes/src/shapes/electric_shape/electric_shape.dart';
import 'package:electric_shapes/src/shapes/electric_shape/latlong_desc_widget.dart';
import 'package:flutter/material.dart';

/// Símbolo de poste de concreto circular existente.
///
/// É representado por dois círculos concêntricos apenas com contorno.
class PosteConcretoCircularExistenteSymbol extends ElectricShape {
  /// Cria um símbolo de poste de concreto circular existente.
  const PosteConcretoCircularExistenteSymbol({
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
      painter: _PosteConcretoCircularExistentePainter(
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
    return PosteConcretoCircularExistenteSymbol(
      color: color ?? this.color,
      strokeWidth: strokeWidth ?? this.strokeWidth,
      size: size ?? this.size,
      latLong: latLong ?? this.latLong,
      text: text ?? this.text,
      fontSize: fontSize ?? this.fontSize,
    );
  }
}

class _PosteConcretoCircularExistentePainter extends CustomPainter {
  _PosteConcretoCircularExistentePainter({
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

    final center = Offset(size.width * 0.5, size.height * 0.5);

    final outerRadius = s * 0.39;
    final innerRadius = s * 0.16;

    canvas.drawCircle(center, outerRadius, paint);
    canvas.drawCircle(center, innerRadius, paint);
  }

  @override
  bool shouldRepaint(
      covariant _PosteConcretoCircularExistentePainter oldDelegate,
      ) {
    return oldDelegate.color != color ||
        oldDelegate.strokeWidth != strokeWidth;
  }
}
