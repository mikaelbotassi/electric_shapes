import 'package:electric_shapes/src/shapes/electric_shape/electric_shape.dart';
import 'package:electric_shapes/src/shapes/electric_shape/latlong_desc_widget.dart';
import 'package:flutter/material.dart';

/// Símbolo de poste de concreto duplo T projetado.
///
/// A versão projetada possui corpo preenchido com recortes laterais internos.
class PosteConcretoDtProjetadoSymbol extends ElectricShape {
  /// Cria um símbolo de poste de concreto duplo T projetado.
  const PosteConcretoDtProjetadoSymbol({
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
      painter: _RetanguloCurvasLateraisPreenchidoPainter(
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
    return PosteConcretoDtProjetadoSymbol(
      color: color ?? this.color,
      strokeWidth: strokeWidth ?? this.strokeWidth,
      size: size ?? this.size,
      latLong: latLong ?? this.latLong,
      text: text ?? this.text,
      fontSize: fontSize ?? this.fontSize,
    );
  }
}

class _RetanguloCurvasLateraisPreenchidoPainter extends CustomPainter {
  _RetanguloCurvasLateraisPreenchidoPainter({
    required this.color,
    this.strokeWidth,
  });

  final Color color;
  final double? strokeWidth;

  @override
  void paint(Canvas canvas, Size size) {
    final s = size.shortestSide;
    final stroke = strokeWidth ?? s * 0.045;

    final left = size.width * 0.10;
    final top = size.height * 0.10;
    final right = size.width * 0.90;
    final bottom = size.height * 0.90;
    final midY = (top + bottom) / 2;

    final rect = Rect.fromLTRB(left, top, right, bottom);

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

    final clearPaint = Paint()
      ..blendMode = BlendMode.clear
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    // SaveLayer é importante para o recorte com BlendMode.clear funcionar bem
    canvas.saveLayer(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Paint(),
    );

    // Fundo preenchido
    canvas.drawRect(rect, fillPaint);

    // Recorte lateral esquerdo
    final leftCutPath = Path()
      ..moveTo(left + stroke * 0.6, top + stroke * 0.6)
      ..quadraticBezierTo(
        size.width * 0.40,
        midY,
        left + stroke * 0.6,
        bottom - stroke * 0.6,
      )
      ..lineTo(left + stroke * 0.6, top + stroke * 0.6)
      ..close();

    // Recorte lateral direito
    final rightCutPath = Path()
      ..moveTo(right - stroke * 0.6, top + stroke * 0.6)
      ..quadraticBezierTo(
        size.width * 0.60,
        midY,
        right - stroke * 0.6,
        bottom - stroke * 0.6,
      )
      ..lineTo(right - stroke * 0.6, top + stroke * 0.6)
      ..close();

    canvas.drawPath(leftCutPath, clearPaint);
    canvas.drawPath(rightCutPath, clearPaint);

    // Contorno externo por cima
    canvas.drawRect(rect, borderPaint);

    canvas.restore();
  }

  @override
  bool shouldRepaint(
      covariant _RetanguloCurvasLateraisPreenchidoPainter oldDelegate,
      ) {
    return oldDelegate.color != color ||
        oldDelegate.strokeWidth != strokeWidth;
  }
}
