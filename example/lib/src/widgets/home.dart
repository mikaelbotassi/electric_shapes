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
            builder: _buildShape('Existente',TransformadorExistenteSymbol.new),
          ),
          ShapeSpec(
            builder: _buildShape('Projetado',TransformadorProjetadoSymbol.new),
          ),
        ],
      ),
      ShapeSection(
        title: 'Postes',
        items: [
          ShapeSpec(
            builder: _buildShape('Concreto DT existente',PosteConcretoDtExistenteSymbol.new),
          ),
          ShapeSpec(
            builder: _buildShape('Concreto DT projetado',PosteConcretoDtProjetadoSymbol.new),
          ),
          ShapeSpec(
            builder: _buildShape('Concreto circular existente',PosteConcretoCircularExistenteSymbol.new),
          ),
          ShapeSpec(
            builder: _buildShape('Concreto circular projetado',PosteConcretoCircularProjetadoSymbol.new),
          ),
          ShapeSpec(
            builder: _buildShape('Fibra de vidro existente',PosteFibraVidroExistenteSymbol.new),
          ),
          ShapeSpec(
            builder: _buildShape('Fibra de vidro projetado',PosteFibraVidroProjetadoSymbol.new),
          ),
          ShapeSpec(
            builder: _buildShape('Madeira existente',PosteMadeiraExistenteSymbol.new),
          ),
        ],
      ),
      ShapeSection(
        title: 'Aterramentos',
        items: [
          ShapeSpec(
            builder: _buildShape('Existente',AterramentoExistenteSymbol.new),
          ),
          ShapeSpec(
            builder: _buildShape('Projetado',AterramentoProjetadoSymbol.new),
          ),
        ],
      ),
      ShapeSection(
        title: 'Para-raios',
        items: [
          ShapeSpec(
            builder: _buildShape('Existente',ParaRaiosExistenteSymbol.new),
          ),
          ShapeSpec(
            builder: _buildShape('Projetado',ParaRaiosProjetadoSymbol.new),
          ),
        ],
      ),
      ShapeSection(
        title: 'Chaves',
        items: [
          ShapeSpec(
            builder: _buildShape('Faca existente',ChaveFacaExistenteSymbol.new),
          ),
          ShapeSpec(
            builder: _buildShape('Faca projetada',ChaveFacaProjetadaSymbol.new),
          ),
          ShapeSpec(
            builder: _buildShape('Fusível existente',ChaveFusivelExistenteSymbol.new),
          ),
          ShapeSpec(
            builder: _buildShape('Fusível projetada',ChaveFusivelProjetadaSymbol.new),
          ),
          ShapeSpec(
            builder: _buildShape('Religadora existente',ChaveReligadoraExistenteSymbol.new),
          ),
          ShapeSpec(
            builder: _buildShape('Religadora projetada',ChaveReligadoraProjetadaSymbol.new),
          ),
        ],
      ),
      ShapeSection(
        title: 'Redes',
        items: [
          ShapeSpec(
            builder: _buildShape('Baixa tensão',RedeBaixaTensaoSymbol.new),
          ),
          ShapeSpec(
            builder: _buildShape('Média tensão',RedeMediaTensaoSymbol.new),
          ),
        ],
      ),
    ];
  }

  ShapeBuilder _buildShape(String label, ElectricShape Function({
    Key? key, double size, Color color, double strokeWidth}) factory) {
      return ({
        required double size,
        required Color color,
        required double strokeWidth,
      }) {
        var item = factory(
          size: size,
          color: color,
          strokeWidth: strokeWidth,
        );
        item = item.copyWith(
          latLong: LatLong(-19.5379307, -40.6347475),
          text: label
        );
        return item;
      };
  }
}