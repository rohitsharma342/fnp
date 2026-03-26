import 'package:flutter/material.dart';
import '../config/romantic_colors.dart';
import '../config/romantic_animations.dart';

class RomanticBackground extends StatefulWidget {
  final Widget child;
  final bool showFloatingHearts;
  final bool showShimmer;
  
  const RomanticBackground({
    super.key,
    required this.child,
    this.showFloatingHearts = false,
    this.showShimmer = false,
  });
  
  @override
  State<RomanticBackground> createState() => _RomanticBackgroundState();
}

class _RomanticBackgroundState extends State<RomanticBackground>
    with TickerProviderStateMixin {
  late AnimationController _shimmerController;
  late AnimationController _heartController;
  late Animation<double> _shimmerAnimation;
  
  @override
  void initState() {
    super.initState();
    _shimmerController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );
    _heartController = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    );
    
    _shimmerAnimation = RomanticAnimations.createShimmer(_shimmerController);
    
    if (widget.showShimmer) {
      _shimmerController.repeat();
    }
    if (widget.showFloatingHearts) {
      _heartController.repeat();
    }
  }
  
  @override
  void dispose() {
    _shimmerController.dispose();
    _heartController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: RomanticColors.dreamyGradient,
      ),
      child: Stack(
        children: [
          // Subtle pattern overlay
          Positioned.fill(
            child: CustomPaint(
              painter: RomanticPatternPainter(),
            ),
          ),
          
          // Shimmer effect
          if (widget.showShimmer)
            AnimatedBuilder(
              animation: _shimmerAnimation,
              builder: (context, child) {
                return Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.white.withOpacity(0.0),
                          Colors.white.withOpacity(0.1),
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
                );
              },
            ),
          
          // Floating hearts
          if (widget.showFloatingHearts)
            ...List.generate(5, (index) {
              return AnimatedBuilder(
                animation: _heartController,
                builder: (context, child) {
                  final offset = (_heartController.value + index * 0.2) % 1.0;
                  return Positioned(
                    left: 50.0 + index * 80.0,
                    top: MediaQuery.of(context).size.height * offset,
                    child: Opacity(
                      opacity: (1.0 - offset) * 0.3,
                      child: Icon(
                        Icons.favorite,
                        color: RomanticColors.pinkGlow,
                        size: 20 + (index * 5),
                      ),
                    ),
                  );
                },
              );
            }),
          
          // Main content
          widget.child,
        ],
      ),
    );
  }
}

class RomanticPatternPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = RomanticColors.roseGold.withOpacity(0.05)
      ..style = PaintingStyle.fill;
    
    // Draw subtle heart patterns
    for (int i = 0; i < 10; i++) {
      for (int j = 0; j < 10; j++) {
        final x = (size.width / 10) * i;
        final y = (size.height / 10) * j;
        
        if ((i + j) % 3 == 0) {
          _drawHeart(canvas, paint, Offset(x, y), 8);
        }
      }
    }
  }
  
  void _drawHeart(Canvas canvas, Paint paint, Offset center, double size) {
    final path = Path();
    
    path.moveTo(center.dx, center.dy + size * 0.3);
    path.cubicTo(
      center.dx - size * 0.5, center.dy - size * 0.1,
      center.dx - size * 0.5, center.dy - size * 0.5,
      center.dx, center.dy - size * 0.2,
    );
    path.cubicTo(
      center.dx + size * 0.5, center.dy - size * 0.5,
      center.dx + size * 0.5, center.dy - size * 0.1,
      center.dx, center.dy + size * 0.3,
    );
    
    canvas.drawPath(path, paint);
  }
  
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}