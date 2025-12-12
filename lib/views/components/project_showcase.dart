import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_portfolio/utils/app_colors.dart';
import 'package:my_portfolio/utils/text_styles.dart';
import 'package:my_portfolio/views/components/glass_container.dart';

class ProjectShowcase extends StatefulWidget {
  final String title;
  final String description;
  final String imageUrl;
  final bool isReversed;

  const ProjectShowcase({
    super.key,
    required this.title,
    required this.description,
    required this.imageUrl,
    this.isReversed = false,
  });

  @override
  State<ProjectShowcase> createState() => _ProjectShowcaseState();
}

class _ProjectShowcaseState extends State<ProjectShowcase> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 900;

        final imageSection = MouseRegion(
          onEnter: (_) => setState(() => _isHovered = true),
          onExit: (_) => setState(() => _isHovered = false),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeOutBack,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001) // Perspective
              ..rotateY(
                _isHovered ? 0 : (widget.isReversed ? -0.15 : 0.15),
              ) // Tilt source
              ..rotateX(_isHovered ? 0 : 0.05)
              ..scale(_isHovered ? 1.05 : 0.95),
            height: 400,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withOpacity(_isHovered ? 0.3 : 0.1),
                  blurRadius: _isHovered ? 50 : 30,
                  offset: const Offset(0, 20),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Stack(
                children: [
                  // Image
                  Positioned.fill(
                    child: Image.network(widget.imageUrl, fit: BoxFit.cover),
                  ),
                  // Glass Overlay on Hover
                  AnimatedOpacity(
                    duration: const Duration(milliseconds: 300),
                    opacity: _isHovered ? 0.0 : 0.2,
                    child: Container(color: Colors.black),
                  ),
                ],
              ),
            ),
          ),
        );

        final textSection = GlassContainer(
          // Using our new GlassContainer
          padding: const EdgeInsets.all(32),
          borderRadius: 24,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.title,
                style: AppTextStyles.subHeader.copyWith(
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(height: 16),
              Text(widget.description, style: AppTextStyles.body),
              const SizedBox(height: 32),
              Wrap(
                spacing: 16,
                runSpacing: 16,
                children: [
                  _ProjectButton(
                    label: "View Code",
                    icon: FontAwesomeIcons.github,
                    onPressed: () {},
                  ),
                  _ProjectButton(
                    label: "Download App",
                    icon: Icons.download_rounded,
                    isOutlined: true,
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
        );

        if (isMobile) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              imageSection,
              const SizedBox(height: -40), // Overlap for cool effect
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: textSection,
              ),
            ],
          );
        } else {
          final children = [
            Expanded(flex: 5, child: imageSection),
            const SizedBox(width: 40),
            Expanded(flex: 4, child: textSection),
          ];

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 80),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: widget.isReversed
                  ? children.reversed.toList()
                  : children,
            ),
          );
        }
      },
    );
  }
}

class _ProjectButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool isOutlined;
  final VoidCallback onPressed;

  const _ProjectButton({
    required this.label,
    required this.icon,
    this.isOutlined = false,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          decoration: BoxDecoration(
            color: isOutlined ? Colors.transparent : AppColors.primary,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: AppColors.primary, width: 1),
            boxShadow: isOutlined
                ? []
                : [
                    BoxShadow(
                      color: AppColors.primary.withOpacity(0.4),
                      blurRadius: 20,
                      offset: const Offset(0, 5),
                    ),
                  ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                size: 18,
                color: isOutlined ? AppColors.primary : Colors.white,
              ),
              const SizedBox(width: 8),
              Text(
                label,
                style: AppTextStyles.button.copyWith(
                  color: isOutlined ? AppColors.primary : Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
