# electric_shapes

Biblioteca Flutter com simbologia para redes elétricas, oferecendo duas formas de uso:

- `IconData` via fonte customizada, ideal para uso com `Icon`, `ElectricIcon`, botões, listas e app bars.
- widgets `Symbol` desenhados em `CustomPainter`, ideais quando você precisa de mais fidelidade visual e controle fino de tamanho, cor e espessura.

O pacote foi pensado para representar elementos comuns de projetos e diagramas elétricos, como transformadores, postes, aterramentos, para-raios, chaves e redes de média e baixa tensão.

## Features

- Fonte de ícones customizada com API simples em `ElectricIcons`
- Widget `ElectricIcon` para consumir `IconData` rapidamente
- Conjunto de `Symbol`s em Flutter puro, sem depender de imagem raster
- Controle de `size`, `color` e `strokeWidth`
- Separação entre elementos `Existente` e `Projetado`
- API unificada exportada por `package:electric_shapes/electric_shapes.dart`

## Instalação

Adicione o pacote ao seu `pubspec.yaml`:

```yaml
dependencies:
  electric_shapes:
    path: ../electric_shapes
```

Se o pacote estiver publicado, troque pelo número da versão correspondente.

Depois importe:

```dart
import 'package:electric_shapes/electric_shapes.dart';
```

## Como usar

### 1. Usando como ícone de fonte

Se você quer a experiência tradicional de `IconData`, use `ElectricIcons` com `Icon` ou `ElectricIcon`.

```dart
Icon(
  ElectricIcons.transformadorExistente,
  size: 28,
  color: const Color(0xFF2F3437),
)
```

Ou com o helper do pacote:

```dart
const ElectricIcon(
  ElectricIcons.chaveFusivelProjetada,
  size: 28,
  color: Color(0xFF2F3437),
)
```

### 2. Usando símbolos desenhados

Quando você precisa de uma representação mais próxima da simbologia original, use os widgets `Symbol`.

```dart
const ChaveFusivelExistenteSymbol(
  size: 180,
  color: Color(0xFF2F3437),
  strokeWidth: 1.2,
)
```

Outro exemplo:

```dart
const RedeMediaTensaoSymbol(
  size: 180,
  color: Color(0xFF2F3437),
  strokeWidth: 1,
)
```

## Abordagens disponíveis

### `ElectricIcons`

Use quando você quer:

- integração direta com `Icon`
- melhor encaixe em componentes padrão do Flutter
- consumo rápido em listas, menus e botões
- catálogo de glifos baseado em fonte

### `*Symbol`

Use quando você quer:

- aparência mais fiel ao desenho técnico
- proporções controladas por widget
- customização de traço
- renderização vetorial em Flutter via `CustomPainter`

## API pública

O pacote exporta:

- `ElectricIcon`
- `ElectricIcons`
- `ElectricShape`
- todos os widgets `Symbol` disponíveis em `shapes.dart`

## Ícones disponíveis em `ElectricIcons`

### Transformadores

- `ElectricIcons.transformadorExistente`
- `ElectricIcons.transformadorProjetado`

### Postes

- `ElectricIcons.posteConcretoDTExistente`
- `ElectricIcons.posteConcretoDTProjetado`
- `ElectricIcons.posteConcretoCircularExistente`
- `ElectricIcons.posteConcretoCircularProjetado`
- `ElectricIcons.posteFibraVidroExistente`
- `ElectricIcons.posteFibraVidroProjetado`
- `ElectricIcons.posteMadeiraExistente`

### Aterramentos

- `ElectricIcons.aterramentoExistente`
- `ElectricIcons.aterramentoProjetado`

### Para-raios

- `ElectricIcons.paraRaioExistente`
- `ElectricIcons.paraRaioProjetado`

### Chaves

- `ElectricIcons.chaveFacaExistente`
- `ElectricIcons.chaveFacaProjetada`
- `ElectricIcons.chaveFusivelExistente`
- `ElectricIcons.chaveFusivelProjetada`
- `ElectricIcons.chaveReligadoraExistente`
- `ElectricIcons.chaveReligadoraProjetada`

### Redes

- `ElectricIcons.redeMediaTensaoExistente`
- `ElectricIcons.redeMediaTensaoProjetada`
- `ElectricIcons.redeBaixaTensaoExistente`
- `ElectricIcons.redeBaixaTensaoProjetada`

## Widgets `Symbol` disponíveis

### Transformadores

- `TransformadorExistenteSymbol`
- `TransformadorProjetadoSymbol`

### Postes

- `PosteConcretoCircularExistenteSymbol`
- `PosteConcretoCircularProjetadoSymbol`
- `PosteConcretoDtExistenteSymbol`
- `PosteConcretoDtProjetadoSymbol`
- `PosteFibraVidroExistenteSymbol`
- `PosteFibraVidroProjetadoSymbol`
- `PosteMadeiraExistenteSymbol`

### Aterramentos

- `AterramentoExistenteSymbol`
- `AterramentoProjetadoSymbol`

### Para-raios

- `ParaRaiosExistenteSymbol`
- `ParaRaiosProjetadoSymbol`

### Chaves

- `ChaveFacaExistenteSymbol`
- `ChaveFacaProjetadaSymbol`
- `ChaveFusivelExistenteSymbol`
- `ChaveFusivelProjetadaSymbol`
- `ChaveReligadoraExistenteSymbol`
- `ChaveReligadoraProjetadaSymbol`

### Redes

- `RedeMediaTensaoSymbol`
- `RedeBaixaTensaoSymbol`

## Exemplo de composição

```dart
class ElectricLegend extends StatelessWidget {
  const ElectricLegend({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Row(
          children: [
            ElectricIcon(ElectricIcons.transformadorExistente, size: 20),
            SizedBox(width: 8),
            Text('Transformador existente'),
          ],
        ),
        SizedBox(height: 12),
        ChaveFusivelProjetadaSymbol(size: 120),
      ],
    );
  }
}
```

## Personalização

A maioria dos símbolos expõe:

- `size`: controla a escala principal do símbolo
- `color`: define a cor do desenho
- `strokeWidth`: ajusta a espessura do traço

Exemplo:

```dart
const ParaRaiosProjetadoSymbol(
  size: 96,
  color: Colors.red,
  strokeWidth: 1.5,
)
```

## Quando usar cada opção

Use `ElectricIcons` quando a prioridade for integração com a UI padrão do Flutter.

Use `Symbol`s quando a prioridade for fidelidade visual da simbologia elétrica.

Em muitos casos, faz sentido usar os dois:

- `IconData` para barras, menus e listas
- `Symbol` para telas técnicas, diagramas, catálogos e legendas

## Estrutura do pacote

```text
lib/
  electric_shapes.dart
  src/
    electric_icon.dart
    electric_icons.dart
    shapes/
      shapes.dart
      ...
```

## Estado atual

O pacote já oferece uma base sólida para simbologia elétrica em Flutter, mas ainda pode evoluir com:

- catálogo visual de todos os símbolos
- screenshots no README
- exemplo completo em `/example`
- geração automatizada de parte do catálogo de ícones

## Contribuição

Se você for evoluir o pacote, vale manter estes critérios:

- nomes consistentes entre `IconData` e `Symbol`
- fidelidade visual entre fonte e desenho técnico
- widgets com `const` sempre que possível
- API simples de consumir em aplicações Flutter

## Licença

Defina aqui a licença do projeto antes da publicação.
