## 1.0.7

Fix: Wrap shape widget with Expanded in ElectricShape layout

- Wrap the `buildShape(context)` call with an `Expanded` widget to ensure the shape correctly occupies available space within its layout container.

## 1.0.6

Refactor: Improve `copyWith` flexibility and clean up symbol internals

- Update `copyWith` methods across all symbol classes to support explicitly setting `latLong` to `null` using a sentinel object pattern.
- Refine `ElectricShape` and `LatlongDescWidget` layouts using `MainAxisSize.min` and `Flexible` text to prevent layout overflows and truncate coordinate labels safely.
- Adjust font scaling for coordinate labels within the `ElectricShape` base class.
- Add a `LatLong.empty()` factory constructor to the `LatLong` model.
- Update the minimum Dart SDK requirement to `3.10.0` in `pubspec.yaml`.
- Remove hardcoded default values for `latLong` and `text` from `AterramentoExistenteSymbol`.
- Update the example app to inject sample `LatLong` coordinates into `AterramentoExistenteSymbol` via `copyWith`.
- Remove redundant internal imports from switch symbol widgets and rely on the package's public export barrel instead.

## 1.0.5

Refactor: Extract `LatLong` class to a dedicated models file

- Move the `LatLong` coordinate model from `latlong_desc_widget.dart` to a new `src/models.dart` file for better architectural separation.
- Export `src/models.dart` from the main `electric_shapes.dart` library file to make it available to package users.
- Update imports across all symbol widgets—including transformers, poles, switches, grounding, and networks—to reference the new model location.
- Standardize imports in various symbol files, ensuring consistent access to `ElectricShape` and `LatLong`.

## 1.0.4

Refactor: Expand `ElectricShape.copyWith` with metadata properties

- Update the `ElectricShape` base class signature for `copyWith` to include `text`, `fontSize`, and `latLong` parameters.
- Implement the updated `copyWith` method across all concrete symbol subclasses, including transformers, poles, switches, grounding, surge arresters, and network types.
- Ensure new metadata properties are correctly persisted when creating copies of symbol instances.
- Add necessary imports for `latlong_desc_widget.dart` across the symbol library to support geographical coordinate types.

## 1.0.3

Docs: Add documentation for electric shape and coordinate widgets

- Add documentation comments to `ElectricShape` properties, including `strokeWidth`, `text`, and `latLong`.
- Document the `buildShape` method to clarify its role in rendering the primary shape versus auxiliary elements.
- Add documentation for the `LatLong` class, its decimal degree fields, and `LatlongDescWidget` parameters.
- Reformat indentation for the `color` argument inside `Color.alphaBlend` in `electric_shape.dart`.

## 1.0.2

Refactor: Clean up `shapes.dart` export file

- Remove redundant documentation comments from `lib/src/shapes/shapes.dart`.
- Clean up whitespace and formatting in export statements.

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
