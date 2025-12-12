import 'package:flutter/material.dart';
import 'package:my_portfolio/utils/app_colors.dart';

class ParallaxBackground extends StatelessWidget {
  final ScrollController scrollController;

  const ParallaxBackground({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: scrollController,
      builder: (context, child) {
        final scrollOffset = scrollController.hasClients
            ? scrollController.offset
            : 0.0;

        return Stack(
          children: [
            // Layer 1: Slow moving orb (Background)
            Positioned(
              top: -100 - (scrollOffset * 0.1),
              right: -50,
              child: _buildOrb(300, AppColors.secondary.withOpacity(0.3)),
            ),

            // Layer 2: Medium moving orb
            Positioned(
              top: 500 - (scrollOffset * 0.2),
              left: -100,
              child: _buildOrb(
                400,
                AppColors.primary.withOpacity(0.08),
              ), // Neon Pink Tint
            ),

            // Layer 3: Faster moving orb
            Positioned(
              top: 1200 - (scrollOffset * 0.3),
              right: 100,
              child: _buildOrb(200, Colors.purple.withOpacity(0.1)),
            ),

            // Layer 4: Distant particles (simulated)
            Positioned(
              top: 200 - (scrollOffset * 0.05),
              left: MediaQuery.of(context).size.width * 0.2,
              child: _buildOrb(50, Colors.white.withOpacity(0.02)),
            ),
          ],
        );
      },
    );
  }

  Widget _buildOrb(double size, Color color) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(
          colors: [color, color.withOpacity(0)],
          stops: const [0.0, 1.0],
        ),
      ),
    );
  }
}
