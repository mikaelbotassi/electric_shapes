import 'package:flutter/material.dart';

class LatLong{

  final double latitude;
  final double longitude;

  const LatLong(this.latitude, this.longitude);

}

class LatlongDescWidget extends StatelessWidget {

  const LatlongDescWidget({
    super.key,
    required this.size,
    required this.latLong,
    required this.color
  });

  final double size;
  final LatLong latLong;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final lightColor = Color.alphaBlend(
        Colors.white.withValues(alpha: 0.7),
        color
    );
    final darkColor = Color.alphaBlend(
        Colors.black.withValues(alpha: 0.5),
        color
    );
    final textTheme = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: lightColor,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: darkColor)
      ),
      child: Row(
        spacing: 8,
        children: [
          Icon(
            Icons.location_pin,
            size: size,
            color: darkColor,
          ),
          Text(
            '${latLong.latitude}, ${latLong.longitude}',
            style: textTheme.bodyMedium?.copyWith(
              fontSize: size,
              fontWeight: FontWeight.bold,
              color: darkColor
            ),
          )
        ],
      ),
    );
  }
}
