import 'package:electric_shapes/electric_shapes.dart';
import 'package:flutter/material.dart';

/// Símbolo de chave faca projetada.
///
/// Usa um anel circular externo para distinguir o elemento projetado no
/// diagrama elétrico.
class ChaveFacaProjetadaSymbol extends ElectricShape {
  /// Cria um símbolo de chave faca projetada.
  const ChaveFacaProjetadaSymbol({
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
      size: Size(size * 2.5, size),
      painter: _ChaveFacaProjetadaPainter(
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
    return ChaveFacaProjetadaSymbol(
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

class _ChaveFacaProjetadaPainter extends CustomPainter {
  _ChaveFacaProjetadaPainter({
    required this.color,
    this.strokeWidth,
  });

  final Color color;
  final double? strokeWidth;

  @override
  void paint(Canvas canvas, Size size) {
    final s = size.height;
    final stroke = strokeWidth ?? s * 0.045;

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

    final center = Offset(size.width * 0.37, size.height * 0.50);
    final radius = s * 0.36;

    final leftCircleX = center.dx - radius;

    // Círculo externo
    canvas.drawCircle(center, radius, strokePaint);

    // Linha horizontal da esquerda até o pivô
    final leftPivot = Offset(leftCircleX, center.dy);
    canvas..drawLine(
      Offset(size.width * 0.04, center.dy),
      leftPivot,
      strokePaint,
    )

    // Ponto de articulação esquerdo
    ..drawCircle(leftPivot, stroke * 0.95, fillPaint);

    // Ponto de contato à direita, dentro do círculo
    final rightContact = Offset(center.dx + radius * 0.42, center.dy - radius * 0.02);
    canvas..drawCircle(rightContact, stroke * 0.95, fillPaint)

    // Linha horizontal saindo do contato à direita
    ..drawLine(
      rightContact,
      Offset(size.width * 0.97, center.dy),
      strokePaint,
    );

    // Haste diagonal ("faca")
    final bladeEnd = Offset(
      center.dx + radius * 0.12,
      center.dy + radius * 0.54,
    );

    canvas..drawLine(
      leftPivot,
      bladeEnd,
      strokePaint,
    )

    // Pequeno segmento na ponta da faca
    ..drawLine(
      bladeEnd,
      Offset(
        bladeEnd.dx - radius * 0.18,
        bladeEnd.dy + radius * 0.10,
      ),
      strokePaint,
    );
  }

  @override
  bool shouldRepaint(covariant _ChaveFacaProjetadaPainter oldDelegate) {
    return oldDelegate.color != color ||
        oldDelegate.strokeWidth != strokeWidth;
  }
}
