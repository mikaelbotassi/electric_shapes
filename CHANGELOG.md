## 1.0.1

Docs: Add comprehensive DartDoc documentation for symbols and widgets

- Add descriptive documentation in Portuguese for all electrical symbol classes, including transformers, poles, switches, grounding, and network types.
- Document the base `ElectricShape` class and its common properties (`size`, `color`, `strokeWidth`).
- Include detailed comments for the `ElectricIcons` font-based icon constants, describing each electrical glyph.
- Add documentation for the `ElectricIcon` utility widget and its API.
- Document internal helper classes like `HorizontalLinePainter`.
- Provide context for the `shapes.dart` barrel file and the library's overall structure.

## 1.0.0

Initial release of `electric_shapes`.

- Added custom electric network icons through `ElectricIcons`
- Added `ElectricIcon` helper widget for `IconData` usage
- Added symbol widgets for technical electric shapes using `CustomPainter`
- Added symbols for transformers, poles, grounding, lightning arresters, switches, and medium/low voltage networks
- Added support for existing and projected variants where applicable
- Added package exports through `electric_shapes.dart`
