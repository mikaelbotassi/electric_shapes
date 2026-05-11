import 'package:electric_shapes/src/shapes/electric_shape/electric_shape.dart';
import 'package:electric_shapes/src/shapes/electric_shape/latlong_desc_widget.dart';
import 'package:flutter/material.dart';

/// Símbolo de poste de fibra de vidro existente.
///
/// Mostra um círculo externo com núcleo interno dividido verticalmente e metade
/// direita preenchida.
class PosteFibraVidroExistenteSymbol extends ElectricShape {
  /// Cria um símbolo de poste de fibra de vidro existente.
  const PosteFibraVidroExistenteSymbol({
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
      painter: _PosteFibraDeVidroExistentePainter(
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
    return PosteFibraVidroExistenteSymbol(
      color: color ?? this.color,
      strokeWidth: strokeWidth ?? this.strokeWidth,
      size: size ?? this.size,
      latLong: latLong ?? this.latLong,
      text: text ?? this.text,
      fontSize: fontSize ?? this.fontSize,
    );
  }
}

class _PosteFibraDeVidroExistentePainter extends CustomPainter {
  _PosteFibraDeVidroExistentePainter({
    required this.color,
    this.strokeWidth,
  });

  final Color color;
  final double? strokeWidth;

  @override
  void paint(Canvas canvas, Size size) {
    final s = size.shortestSide;
    final stroke = strokeWidth ?? s * 0.045;

    final borderPaint = Paint()
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

    final center = Offset(size.width * 0.5, size.height * 0.5);

    final outerRadius = s * 0.39;
    final innerRadius = s * 0.16;

    // Círculo externo
    canvas.drawCircle(center, outerRadius, borderPaint);

    // Preenche apenas a metade direita do círculo interno
    canvas.save();
    canvas.clipRect(
      Rect.fromLTRB(center.dx, 0, size.width, size.height),
    );
    canvas.drawCircle(center, innerRadius, fillPaint);
    canvas.restore();

    // Contorno do círculo interno
    canvas.drawCircle(center, innerRadius, borderPaint);

    // Linha divisória vertical no círculo interno
    canvas.drawLine(
      Offset(center.dx, center.dy - innerRadius),
      Offset(center.dx, center.dy + innerRadius),
      borderPaint,
    );
  }

  @override
  bool shouldRepaint(
      covariant _PosteFibraDeVidroExistentePainter oldDelegate,
      ) {
    return oldDelegate.color != color ||
        oldDelegate.strokeWidth != strokeWidth;
  }
}
