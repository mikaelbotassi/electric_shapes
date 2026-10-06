import 'package:flutter/material.dart';

class ExampleCard extends StatelessWidget {
  const ExampleCard({
    super.key,
    this.label,
    this.subtitle,
    required this.child,
  });

  final String? label;
  final String? subtitle;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFE7E0D5)),
        boxShadow: const [
          BoxShadow(
            color: Color(0x12000000),
            blurRadius: 14,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final maxInnerWidth = constraints.maxWidth;
          final hasBoundedHeight = constraints.hasBoundedHeight;

          if (hasBoundedHeight) {
            return Column(
              children: [
                Expanded(
                  child: ClipRect(
                    child: Center(
                      child: FittedBox(
                        fit: BoxFit.contain,
                        child: child,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                if (label != null)
                  Text(
                    label!,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                if (subtitle != null) ...[
                  const SizedBox(height: 2),
                  Text(
                    subtitle!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colors.grey[600],
                          fontFamily: 'monospace',
                          fontSize: 11,
                        ),
                  ),
                ],
              ],
            );
          }

          return Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 96,
                width: maxInnerWidth,
                child: ClipRect(
                  child: Center(
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: child,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              if (label != null)
                Text(
                  label!,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              if (subtitle != null) ...[
                const SizedBox(height: 2),
                Text(
                  subtitle!,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Colors.grey[600],
                        fontFamily: 'monospace',
                        fontSize: 11,
                      ),
                ),
              ],
            ],
          );
        },
      ),
    );
  }
}
