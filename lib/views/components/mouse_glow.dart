import 'package:flutter/material.dart';
import 'package:my_portfolio/utils/app_colors.dart';

class MouseGlow extends StatefulWidget {
  final Widget child;
  const MouseGlow({super.key, required this.child});

  @override
  State<MouseGlow> createState() => _MouseGlowState();
}

class _MouseGlowState extends State<MouseGlow> {
  Offset _mousePos = Offset.zero;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: (event) {
        setState(() {
          _mousePos = event.position;
        });
      },
      child: Stack(
        children: [
          // The Glow Layer
          Positioned(
            left: _mousePos.dx - 150,
            top: _mousePos.dy - 150,
            child: IgnorePointer(
              child: Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      AppColors.primary.withOpacity(0.15),
                      Colors.transparent,
                    ],
                    stops: const [0.0, 0.7],
                  ),
                ),
              ),
            ),
          ),
          // The Actual Content
          widget.child,
        ],
      ),
    );
  }
}
