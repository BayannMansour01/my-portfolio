import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:my_portfolio/utils/app_colors.dart';

class GlassContainer extends StatelessWidget {
  final Widget child;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double borderRadius;
  final double blur;
  final Color? borderColor;
  final Gradient? gradientBorder; // New Support
  final Color? color;
  final Link? onTap;
  
  const GlassContainer({
    super.key,
    required this.child,
    this.width,
    this.height,
    this.padding,
    this.margin,
    this.borderRadius = 24.0,
    this.blur = 15.0,
    this.borderColor,
    this.gradientBorder,
    this.color, 
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    // If gradientBorder is provided, we wrap the glass content in a container with the gradient as decoration
    // and padding equal to border width.
    
    // Default Style
    final defaultBorderColor = AppColors.glassBorder;

    Widget glassContent = ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
        child: Container(
          width: width,
          height: height,
          padding: padding,
          decoration: BoxDecoration(
            color: color ?? Colors.white.withOpacity(0.08), // Increased default opacity as requested
            borderRadius: BorderRadius.circular(borderRadius),
            border: gradientBorder == null 
                ? Border.all(
                    color: borderColor ?? defaultBorderColor,
                    width: 1.5,
                  )
                : null, // No border here if using gradient wrapper
          ),
          child: child,
        ),
      ),
    );

    if (gradientBorder != null) {
      return Container(
        width: width,
        height: height,
        margin: margin,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          gradient: gradientBorder,
        ),
        child: Padding(
          padding: const EdgeInsets.all(1.5), // Border Width
          child: glassContent,
        ),
      );
    }

    return Container(
      width: width,
      height: height,
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: glassContent,
    );
  }
}

typedef Link = void Function();
