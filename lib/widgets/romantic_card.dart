import 'package:flutter/material.dart';
import '../config/romantic_colors.dart';
import '../config/romantic_animations.dart';

class RomanticCard extends StatefulWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final bool showGlow;
  final bool showShimmer;
  final VoidCallback? onTap;
  final double? width;
  final double? height;
  
  const RomanticCard({
    super.key,
    required this.child,
    this.padding,
    this.margin,
    this.showGlow = false,
    this.showShimmer = false,
    this.onTap,
    this.width,
    this.height,
  });
  
  @override
  State<RomanticCard> createState() => _RomanticCardState();
}

class _RomanticCardState extends State<RomanticCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _shimmerAnimation;
  late Animation<double> _scaleAnimation;
  bool _isHovered = false;
  
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: RomanticAnimations.tender,
      vsync: this,
    );
    
    _shimmerAnimation = RomanticAnimations.createShimmer(_controller);
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.02,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: RomanticAnimations.dreamy,
    ));
    
    if (widget.showShimmer) {
      _controller.repeat();
    }
  }
  
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.scale(
          scale: _isHovered ? _scaleAnimation.value : 1.0,
          child: GestureDetector(
            onTap: widget.onTap,
            onTapDown: (_) => setState(() => _isHovered = true),
            onTapUp: (_) => setState(() => _isHovered = false),
            onTapCancel: () => setState(() => _isHovered = false),
            child: Container(
              width: widget.width,
              height: widget.height,
              margin: widget.margin ?? const EdgeInsets.all(8),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.white,
                    RomanticColors.warmCream.withOpacity(0.5),
                  ],
                ),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: RomanticColors.roseGold.withOpacity(0.1),
                    blurRadius: widget.showGlow ? 20 : 10,
                    offset: const Offset(0, 5),
                    spreadRadius: widget.showGlow ? 2 : 0,
                  ),
                  if (widget.showGlow)
                    BoxShadow(
                      color: RomanticColors.pinkGlow.withOpacity(0.1),
                      blurRadius: 30,
                      offset: const Offset(0, 10),
                      spreadRadius: 5,
                    ),
                ],
                border: Border.all(
                  color: RomanticColors.blushPink.withOpacity(0.3),
                  width: 1,
                ),
              ),
              child: Stack(
                children: [
                  // Shimmer overlay
                  if (widget.showShimmer)
                    Positioned.fill(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Colors.white.withOpacity(0.0),
                                Colors.white.withOpacity(0.2),
                                Colors.white.withOpacity(0.0),
                              ],
                              stops: [
                                (_shimmerAnimation.value - 0.3).clamp(0.0, 1.0),
                                _shimmerAnimation.value.clamp(0.0, 1.0),
                                (_shimmerAnimation.value + 0.3).clamp(0.0, 1.0),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  
                  // Content
                  Padding(
                    padding: widget.padding ?? const EdgeInsets.all(16),
                    child: widget.child,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}