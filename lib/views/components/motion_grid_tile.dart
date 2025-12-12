import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class MotionGridTile extends StatefulWidget {
  final Widget child;
  final VoidCallback? onTap;
  final double hoverScale;
  final Color? shadowColor;

  const MotionGridTile({
    super.key,
    required this.child,
    this.onTap,
    this.hoverScale = 1.05,
    this.shadowColor,
  });

  @override
  State<MotionGridTile> createState() => _MotionGridTileState();
}

class _MotionGridTileState extends State<MotionGridTile> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Animate(
          target: _isHovered ? 1 : 0,
          effects: [
            ScaleEffect(
              begin: const Offset(1, 1),
              end: Offset(widget.hoverScale, widget.hoverScale),
              duration: 200.ms,
              curve: Curves.easeOut,
            ),
            ElevationEffect(
              begin: 0,
              end: 10,
              color: widget.shadowColor ?? Colors.black.withOpacity(0.3),
              duration: 200.ms,
              curve: Curves.easeOut,
            ),
          ],
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            clipBehavior: Clip.antiAlias,
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
