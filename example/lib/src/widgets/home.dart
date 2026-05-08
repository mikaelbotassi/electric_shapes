import 'package:electric_shapes/electric_shapes.dart';
import 'package:example/src/domain/models.dart';
import 'package:example/src/widgets/control_panel.dart';
import 'package:example/src/widgets/icons_tab.dart';
import 'package:example/src/widgets/symbols_tab.dart';
import 'package:flutter/material.dart';

const _electricIcons = <IconSpec>[
  IconSpec('Transformador Existente',ElectricIcons.transformadorExistente),
  IconSpec('Transformador Projetado',ElectricIcons.transformadorProjetado),
  IconSpec('Poste dd Concreto DT Existente',ElectricIcons.posteConcretoDTExistente),
  IconSpec('Poste Concreto DT Projetado',ElectricIcons.posteConcretoDTProjetado),
  IconSpec('Poste Circular Existente',ElectricIcons.posteConcretoCircularExistente),
  IconSpec('Poste Circular Projetado',ElectricIcons.posteConcretoCircularProjetado),
  IconSpec('Poste Fibra de Vidro Existente',ElectricIcons.posteFibraVidroExistente),
  IconSpec('Poste Fibra de Vidro Projetado',ElectricIcons.posteFibraVidroProjetado),
  IconSpec('Poste de Madeira Existente',ElectricIcons.posteMadeiraExistente),
  IconSpec('Aterramento Existente',ElectricIcons.aterramentoExistente),
  IconSpec('Aterramento Projetado',ElectricIcons.aterramentoProjetado),
  IconSpec('Para Raio Existente',ElectricIcons.paraRaioExistente),
  IconSpec('Para Raio Projetado',ElectricIcons.paraRaioProjetado),
  IconSpec('Chave Faca Existente',ElectricIcons.chaveFacaExistente),
  IconSpec('Chave Faca Projetado',ElectricIcons.chaveFacaProjetada),
  IconSpec('Chave Fusível Existente',ElectricIcons.chaveFusivelExistente),
  IconSpec('Chave Fusível Projetada',ElectricIcons.chaveFusivelProjetada),
  IconSpec('Chave Religadora Existente',ElectricIcons.chaveReligadoraExistente),
  IconSpec('Chave Religadora Projetada',ElectricIcons.chaveReligadoraProjetada),
  IconSpec('Rede Média Tensão Existente',ElectricIcons.redeMediaTensaoExistente),
  IconSpec('Rede Média Tensão Projetada',ElectricIcons.redeMediaTensaoProjetada),
  IconSpec('Rede Baixa Tensão Existente',ElectricIcons.redeBaixaTensaoExistente),
  IconSpec('Rede Baixa Tensão Projetada',ElectricIcons.redeBaixaTensaoProjetada),
];

class ExampleHomePage extends StatefulWidget {
  const ExampleHomePage({super.key});

  @override
  State<ExampleHomePage> createState() => _ExampleHomePageState();
}

class _ExampleHomePageState extends State<ExampleHomePage> {
  double _size = 72;
  double _strokeWidth = 2;
  Color _color = const Color(0xFF22333B);

  @override
  Widget build(BuildContext context) {
    final sections = _buildSections();

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Electric Shapes'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Symbols'),
              Tab(text: 'Icons'),
            ],
          ),
        ),
        body: Column(
          children: [
            ControlPanel(
              size: _size,
              strokeWidth: _strokeWidth,
              color: _color,
              onSizeChanged: (value) => setState(() => _size = value),
              onStrokeWidthChanged: (value) =>
                  setState(() => _strokeWidth = value),
              onColorChanged: (value) => setState(() => _color = value),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  SymbolsTab(
                    sections: sections,
                    size: _size,
                    color: _color,
                    strokeWidth: _strokeWidth,
                  ),
                  IconsTab(
                    icons: _electricIcons,
                    size: _size,
                    color: _color,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<ShapeSection> _buildSections() {
    return [
      ShapeSection(
        title: 'Transformadores',
        items: [
          ShapeSpec(
            label: 'Existente',
            builder: _buildShape(TransformadorExistenteSymbol.new),
          ),
          ShapeSpec(
            label: 'Projetado',
            builder: _buildShape(TransformadorProjetadoSymbol.new),
          ),
        ],
      ),
      ShapeSection(
        title: 'Postes',
        items: [
          ShapeSpec(
            label: 'Concreto DT existente',
            builder: _buildShape(PosteConcretoDtExistenteSymbol.new),
          ),
          ShapeSpec(
            label: 'Concreto DT projetado',
            builder: _buildShape(PosteConcretoDtProjetadoSymbol.new),
          ),
          ShapeSpec(
            label: 'Concreto circular existente',
            builder: _buildShape(PosteConcretoCircularExistenteSymbol.new),
          ),
          ShapeSpec(
            label: 'Concreto circular projetado',
            builder: _buildShape(PosteConcretoCircularProjetadoSymbol.new),
          ),
          ShapeSpec(
            label: 'Fibra de vidro existente',
            builder: _buildShape(PosteFibraVidroExistenteSymbol.new),
          ),
          ShapeSpec(
            label: 'Fibra de vidro projetado',
            builder: _buildShape(PosteFibraVidroProjetadoSymbol.new),
          ),
          ShapeSpec(
            label: 'Madeira existente',
            builder: _buildShape(PosteMadeiraExistenteSymbol.new),
          ),
        ],
      ),
      ShapeSection(
        title: 'Aterramentos',
        items: [
          ShapeSpec(
            label: 'Existente',
            builder: _buildShape(AterramentoExistenteSymbol.new),
          ),
          ShapeSpec(
            label: 'Projetado',
            builder: _buildShape(AterramentoProjetadoSymbol.new),
          ),
        ],
      ),
      ShapeSection(
        title: 'Para-raios',
        items: [
          ShapeSpec(
            label: 'Existente',
            builder: _buildShape(ParaRaiosExistenteSymbol.new),
          ),
          ShapeSpec(
            label: 'Projetado',
            builder: _buildShape(ParaRaiosProjetadoSymbol.new),
          ),
        ],
      ),
      ShapeSection(
        title: 'Chaves',
        items: [
          ShapeSpec(
            label: 'Faca existente',
            builder: _buildShape(ChaveFacaExistenteSymbol.new),
          ),
          ShapeSpec(
            label: 'Faca projetada',
            builder: _buildShape(ChaveFacaProjetadaSymbol.new),
          ),
          ShapeSpec(
            label: 'Fusível existente',
            builder: _buildShape(ChaveFusivelExistenteSymbol.new),
          ),
          ShapeSpec(
            label: 'Fusível projetada',
            builder: _buildShape(ChaveFusivelProjetadaSymbol.new),
          ),
          ShapeSpec(
            label: 'Religadora existente',
            builder: _buildShape(ChaveReligadoraExistenteSymbol.new),
          ),
          ShapeSpec(
            label: 'Religadora projetada',
            builder: _buildShape(ChaveReligadoraProjetadaSymbol.new),
          ),
        ],
      ),
      ShapeSection(
        title: 'Redes',
        items: [
          ShapeSpec(
            label: 'Baixa tensão',
            builder: _buildShape(RedeBaixaTensaoSymbol.new),
          ),
          ShapeSpec(
            label: 'Média tensão',
            builder: _buildShape(RedeMediaTensaoSymbol.new),
          ),
        ],
      ),
    ];
  }

  ShapeBuilder _buildShape(
      ElectricShape Function({
      Key? key,
      double size,
      Color color,
      double strokeWidth,
      })
      factory,
      ) {
    return ({
      required double size,
      required Color color,
      required double strokeWidth,
    }) {
      return factory(
        size: size,
        color: color,
        strokeWidth: strokeWidth,
      );
    };
  }
}