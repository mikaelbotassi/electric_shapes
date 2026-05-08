import 'package:electric_shapes/electric_shapes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_svg/flutter_svg.dart';

typedef ShapeFactory = ElectricShape Function({
  double size,
  Color color,
  double strokeWidth,
});

class _ShapeCase {
  const _ShapeCase({
    required this.name,
    required this.create,
    required this.widthFactor,
    required this.heightFactor,
    this.usesCustomPaint = true,
    this.verifyPainter,
  });

  final String name;
  final ShapeFactory create;
  final double widthFactor;
  final double heightFactor;
  final bool usesCustomPaint;
  final void Function(CustomPainter painter)? verifyPainter;
}

void main() {
  const color = Colors.red;
  const updatedColor = Colors.blue;
  const size = 24.0;
  const strokeWidth = 3.0;

  final shapeCases = <_ShapeCase>[
    _ShapeCase(
      name: 'PosteConcretoCircularExistenteSymbol',
      create: ({
        double size = 48,
        Color color = const Color(0xFF2F3437),
        double strokeWidth = 1,
      }) => PosteConcretoCircularExistenteSymbol(
        size: size,
        color: color,
        strokeWidth: strokeWidth,
      ),
      widthFactor: 1,
      heightFactor: 1,
    ),
    _ShapeCase(
      name: 'PosteConcretoCircularProjetadoSymbol',
      create: ({
        double size = 48,
        Color color = const Color(0xFF2F3437),
        double strokeWidth = 1,
      }) => PosteConcretoCircularProjetadoSymbol(
        size: size,
        color: color,
        strokeWidth: strokeWidth,
      ),
      widthFactor: 1,
      heightFactor: 1,
    ),
    _ShapeCase(
      name: 'PosteConcretoDtExistenteSymbol',
      create: ({
        double size = 48,
        Color color = const Color(0xFF2F3437),
        double strokeWidth = 1,
      }) => PosteConcretoDtExistenteSymbol(
        size: size,
        color: color,
        strokeWidth: strokeWidth,
      ),
      widthFactor: 1,
      heightFactor: 1,
    ),
    _ShapeCase(
      name: 'PosteConcretoDtProjetadoSymbol',
      create: ({
        double size = 48,
        Color color = const Color(0xFF2F3437),
        double strokeWidth = 1,
      }) => PosteConcretoDtProjetadoSymbol(
        size: size,
        color: color,
        strokeWidth: strokeWidth,
      ),
      widthFactor: 1,
      heightFactor: 1,
    ),
    _ShapeCase(
      name: 'PosteFibraVidroExistenteSymbol',
      create: ({
        double size = 180,
        Color color = const Color(0xFF2F3437),
        double strokeWidth = 1,
      }) => PosteFibraVidroExistenteSymbol(
        size: size,
        color: color,
        strokeWidth: strokeWidth,
      ),
      widthFactor: 1,
      heightFactor: 1,
    ),
    _ShapeCase(
      name: 'PosteFibraVidroProjetadoSymbol',
      create: ({
        double size = 180,
        Color color = const Color(0xFF2F3437),
        double strokeWidth = 1,
      }) => PosteFibraVidroProjetadoSymbol(
        size: size,
        color: color,
        strokeWidth: strokeWidth,
      ),
      widthFactor: 1,
      heightFactor: 1,
    ),
    _ShapeCase(
      name: 'PosteMadeiraExistenteSymbol',
      create: ({
        double size = 180,
        Color color = const Color(0xFF2F3437),
        double strokeWidth = 1,
      }) => PosteMadeiraExistenteSymbol(
        size: size,
        color: color,
        strokeWidth: strokeWidth,
      ),
      widthFactor: 1,
      heightFactor: 1,
    ),
    _ShapeCase(
      name: 'TransformadorExistenteSymbol',
      create: ({
        double size = 48,
        Color color = const Color(0xFF2F3437),
        double strokeWidth = 1,
      }) => TransformadorExistenteSymbol(
        size: size,
        color: color,
        strokeWidth: strokeWidth,
      ),
      widthFactor: 1,
      heightFactor: 1,
    ),
    _ShapeCase(
      name: 'TransformadorProjetadoSymbol',
      create: ({
        double size = 48,
        Color color = const Color(0xFF2F3437),
        double strokeWidth = 1,
      }) => TransformadorProjetadoSymbol(
        size: size,
        color: color,
        strokeWidth: strokeWidth,
      ),
      widthFactor: 1,
      heightFactor: 1,
    ),
    _ShapeCase(
      name: 'AterramentoExistenteSymbol',
      create: ({
        double size = 180,
        Color color = const Color(0xFF2F3437),
        double strokeWidth = 1,
      }) => AterramentoExistenteSymbol(
        size: size,
        color: color,
        strokeWidth: strokeWidth,
      ),
      widthFactor: 2.1,
      heightFactor: 1,
    ),
    _ShapeCase(
      name: 'AterramentoProjetadoSymbol',
      create: ({
        double size = 180,
        Color color = const Color(0xFF2F3437),
        double strokeWidth = 1,
      }) => AterramentoProjetadoSymbol(
        size: size,
        color: color,
        strokeWidth: strokeWidth,
      ),
      widthFactor: 2.1,
      heightFactor: 1,
    ),
    _ShapeCase(
      name: 'ParaRaiosExistenteSymbol',
      create: ({
        double size = 180,
        Color color = const Color(0xFF2F3437),
        double strokeWidth = 1,
      }) => ParaRaiosExistenteSymbol(
        size: size,
        color: color,
        strokeWidth: strokeWidth,
      ),
      widthFactor: 2.3,
      heightFactor: 1,
    ),
    _ShapeCase(
      name: 'ParaRaiosProjetadoSymbol',
      create: ({
        double size = 180,
        Color color = const Color(0xFF2F3437),
        double strokeWidth = 1,
      }) => ParaRaiosProjetadoSymbol(
        size: size,
        color: color,
        strokeWidth: strokeWidth,
      ),
      widthFactor: 2.3,
      heightFactor: 1,
    ),
    _ShapeCase(
      name: 'ChaveFacaExistenteSymbol',
      create: ({
        double size = 180,
        Color color = const Color(0xFF2F3437),
        double strokeWidth = 1,
      }) => ChaveFacaExistenteSymbol(
        size: size,
        color: color,
        strokeWidth: strokeWidth,
      ),
      widthFactor: 2.5,
      heightFactor: 1,
      usesCustomPaint: false,
    ),
    _ShapeCase(
      name: 'ChaveFacaProjetadaSymbol',
      create: ({
        double size = 180,
        Color color = const Color(0xFF2F3437),
        double strokeWidth = 1,
      }) => ChaveFacaProjetadaSymbol(
        size: size,
        color: color,
        strokeWidth: strokeWidth,
      ),
      widthFactor: 2.5,
      heightFactor: 1,
      usesCustomPaint: false,
    ),
    _ShapeCase(
      name: 'ChaveFusivelExistenteSymbol',
      create: ({
        double size = 180,
        Color color = const Color(0xFF2F3437),
        double strokeWidth = 1,
      }) => ChaveFusivelExistenteSymbol(
        size: size,
        color: color,
        strokeWidth: strokeWidth,
      ),
      widthFactor: 2.6,
      heightFactor: 1,
      usesCustomPaint: false,
    ),
    _ShapeCase(
      name: 'ChaveFusivelProjetadaSymbol',
      create: ({
        double size = 180,
        Color color = const Color(0xFF2F3437),
        double strokeWidth = 1,
      }) => ChaveFusivelProjetadaSymbol(
        size: size,
        color: color,
        strokeWidth: strokeWidth,
      ),
      widthFactor: 2.6,
      heightFactor: 1,
      usesCustomPaint: false,
    ),
    _ShapeCase(
      name: 'ChaveReligadoraExistenteSymbol',
      create: ({
        double size = 180,
        Color color = const Color(0xFF2F3437),
        double strokeWidth = 1,
      }) => ChaveReligadoraExistenteSymbol(
        size: size,
        color: color,
        strokeWidth: strokeWidth,
      ),
      widthFactor: 2.2,
      heightFactor: 1,
      usesCustomPaint: false,
    ),
    _ShapeCase(
      name: 'ChaveReligadoraProjetadaSymbol',
      create: ({
        double size = 180,
        Color color = const Color(0xFF2F3437),
        double strokeWidth = 1,
      }) => ChaveReligadoraProjetadaSymbol(
        size: size,
        color: color,
        strokeWidth: strokeWidth,
      ),
      widthFactor: 2.4,
      heightFactor: 1,
      usesCustomPaint: false,
    ),
    _ShapeCase(
      name: 'RedeBaixaTensaoSymbol',
      create: ({
        double size = 180,
        Color color = const Color(0xFF2F3437),
        double strokeWidth = 1,
      }) => RedeBaixaTensaoSymbol(
        size: size,
        color: color,
        strokeWidth: strokeWidth,
      ),
      widthFactor: 2.8,
      heightFactor: 0.28,
      verifyPainter: (painter) {
        final horizontalLinePainter = painter as HorizontalLinePainter;
        expect(horizontalLinePainter.isDashed, isFalse);
        expect(horizontalLinePainter.color, color);
        expect(horizontalLinePainter.strokeWidth, strokeWidth);
      },
    ),
    _ShapeCase(
      name: 'RedeMediaTensaoSymbol',
      create: ({
        double size = 180,
        Color color = const Color(0xFF2F3437),
        double strokeWidth = 1,
      }) => RedeMediaTensaoSymbol(
        size: size,
        color: color,
        strokeWidth: strokeWidth,
      ),
      widthFactor: 2.8,
      heightFactor: 0.28,
      verifyPainter: (painter) {
        final horizontalLinePainter = painter as HorizontalLinePainter;
        expect(horizontalLinePainter.isDashed, isTrue);
        expect(horizontalLinePainter.color, color);
        expect(horizontalLinePainter.strokeWidth, strokeWidth);
      },
    ),
  ];

  group('Electric shapes', () {
    for (final shapeCase in shapeCases) {
      testWidgets(
        '${shapeCase.name} builds with expected size',
        (tester) async {
          final widget = shapeCase.create(
            size: size,
            color: color,
            strokeWidth: strokeWidth,
          );

          await tester.pumpWidget(
            Directionality(
              textDirection: TextDirection.ltr,
              child: Center(child: widget),
            ),
          );
          await tester.pumpAndSettle();

          expect(find.byWidget(widget), findsOneWidget);
          final expectedSize = Size(
            size * shapeCase.widthFactor,
            size * shapeCase.heightFactor,
          );

          if (shapeCase.usesCustomPaint) {
            final customPaint = tester.widget<CustomPaint>(find.byType(CustomPaint));

            expect(customPaint.size, expectedSize);

            final painter = customPaint.painter;
            expect(painter, isNotNull);
            expect((painter as dynamic).color, color);
            expect((painter as dynamic).strokeWidth, strokeWidth);
            shapeCase.verifyPainter?.call(painter!);
          } else {
            final svgPicture = tester.widget<SvgPicture>(find.byType(SvgPicture));
            expect(tester.getSize(find.byType(SvgPicture)), expectedSize);
            expect(svgPicture.colorFilter, ColorFilter.mode(color, BlendMode.srcIn));
          }

          final copied = widget.copyWith(
            size: size + 5,
            color: updatedColor,
            strokeWidth: strokeWidth + 1,
          );

          expect(copied, isA<ElectricShape>());
          expect(copied.runtimeType, widget.runtimeType);
          expect(copied.size, size + 5);
          expect(copied.color, updatedColor);
          expect(copied.strokeWidth, strokeWidth + 1);
        },
      );
    }
  });

  group('HorizontalLinePainter', () {
    test('shouldRepaint returns true when any property changes', () {
      final original = HorizontalLinePainter(
        color: color,
        strokeWidth: strokeWidth,
        isDashed: false,
      );

      expect(
        original.shouldRepaint(
          HorizontalLinePainter(
            color: updatedColor,
            strokeWidth: strokeWidth,
            isDashed: false,
          ),
        ),
        isTrue,
      );

      expect(
        original.shouldRepaint(
          HorizontalLinePainter(
            color: color,
            strokeWidth: strokeWidth + 1,
            isDashed: false,
          ),
        ),
        isTrue,
      );

      expect(
        original.shouldRepaint(
          HorizontalLinePainter(
            color: color,
            strokeWidth: strokeWidth,
            isDashed: true,
          ),
        ),
        isTrue,
      );
    });

    test('shouldRepaint returns false when properties are identical', () {
      final original = HorizontalLinePainter(
        color: color,
        strokeWidth: strokeWidth,
        isDashed: true,
      );

      expect(
        original.shouldRepaint(
          HorizontalLinePainter(
            color: color,
            strokeWidth: strokeWidth,
            isDashed: true,
          ),
        ),
        isFalse,
      );
    });
  });

  group('ElectricIcon', () {
    testWidgets('delegates properties to Icon', (tester) async {
      const widget = ElectricIcon(
        ElectricIcons.transformadorExistente,
        size: size,
        color: color,
        semanticLabel: 'transformador',
      );

      await tester.pumpWidget(
        const Directionality(
          textDirection: TextDirection.ltr,
          child: widget,
        ),
      );

      final icon = tester.widget<Icon>(find.byType(Icon));
      expect(icon.icon, ElectricIcons.transformadorExistente);
      expect(icon.size, size);
      expect(icon.color, color);
      expect(icon.semanticLabel, 'transformador');
    });
  });

  group('ElectricIcons', () {
    test('all icons use the shared font metadata', () {
      final icons = ElectricIcons.values;

      final codePoints = icons.map((icon) => icon.codePoint).toList();

      expect(codePoints.toSet(), hasLength(icons.length));

      for (final icon in icons) {
        expect(icon.fontFamily, 'ElectricIcons');
        expect(icon.fontPackage, 'electric_shapes');
      }
    });
  });
}
