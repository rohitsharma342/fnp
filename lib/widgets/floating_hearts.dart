import 'package:flutter/material.dart';
import 'dart:math' as math;
import '../config/romantic_colors.dart';
import '../config/romantic_animations.dart';

class FloatingHearts extends StatefulWidget {
  final int heartCount;
  final Duration animationDuration;
  final bool autoStart;
  
  const FloatingHearts({
    super.key,
    this.heartCount = 8,
    this.animationDuration = const Duration(seconds: 3),
    this.autoStart = true,
  });
  
  @override
  State<FloatingHearts> createState() => _FloatingHeartsState();
}

class _FloatingHeartsState extends State<FloatingHearts>
    with TickerProviderStateMixin {
  late List<AnimationController> _controllers;
  late List<Animation<double>> _animations;
  late List<HeartData> _hearts;
  
  @override
  void initState() {
    super.initState();
    _initializeHearts();
    
    if (widget.autoStart) {
      _startAnimations();
    }
  }
  
  void _initializeHearts() {
    _controllers = [];
    _animations = [];
    _hearts = [];
    
    for (int i = 0; i < widget.heartCount; i++) {
      final controller = AnimationController(
        duration: widget.animationDuration,
        vsync: this,
      );
      
      final animation = Tween<double>(
        begin: 0.0,
        end: 1.0,
      ).animate(CurvedAnimation(
        parent: controller,
        curve: RomanticAnimations.floating,
      ));
      
      final heart = HeartData(
        startX: math.Random().nextDouble(),
        startY: 1.0,
        endX: math.Random().nextDouble(),
        endY: -0.2,
        size: 15 + math.Random().nextDouble() * 20,
        color: _getRandomHeartColor(),
        rotation: math.Random().nextDouble() * 2 * math.pi,
      );
      
      _controllers.add(controller);
      _animations.add(animation);
      _hearts.add(heart);
    }
  }
  
  Color _getRandomHeartColor() {
    final colors = [
      RomanticColors.pinkGlow,
      RomanticColors.softCoral,
      RomanticColors.roseGold,
      RomanticColors.dustyRose,
      RomanticColors.romanticRed,
    ];
    return colors[math.Random().nextInt(colors.length)];
  }
  
  void _startAnimations() {
    for (int i = 0; i < _controllers.length; i++) {
      Future.delayed(Duration(milliseconds: i * 200), () {
        if (mounted) {
          _controllers[i].repeat();
        }
      });
    }
  }
  
  void startHeartAnimation() {
    _startAnimations();
  }
  
  void stopHeartAnimation() {
    for (final controller in _controllers) {
      controller.stop();
    }
  }
  
  @override
  void dispose() {
    for (final controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Stack(
        children: List.generate(widget.heartCount, (index) {
          return AnimatedBuilder(
            animation: _animations[index],
            builder: (context, child) {
              final heart = _hearts[index];
              final progress = _animations[index].value;
              
              final x = heart.startX + (heart.endX - heart.startX) * progress;
              final y = heart.startY + (heart.endY - heart.startY) * progress;
              
              final opacity = progress < 0.1
                  ? progress * 10
                  : progress > 0.8
                      ? (1.0 - progress) * 5
                      : 1.0;
              
              final scale = progress < 0.2
                  ? progress * 5
                  : progress > 0.8
                      ? 1.0 - (progress - 0.8) * 5
                      : 1.0;
              
              return Positioned(
                left: MediaQuery.of(context).size.width * x,
                top: MediaQuery.of(context).size.height * y,
                child: Transform.rotate(
                  angle: heart.rotation * progress,
                  child: Transform.scale(
                    scale: scale,
                    child: Opacity(
                      opacity: opacity.clamp(0.0, 1.0),
                      child: Icon(
                        Icons.favorite,
                        color: heart.color,
                        size: heart.size,
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        }),
      ),
    );
  }
}

class HeartData {
  final double startX;
  final double startY;
  final double endX;
  final double endY;
  final double size;
  final Color color;
  final double rotation;
  
  HeartData({
    required this.startX,
    required this.startY,
    required this.endX,
    required this.endY,
    required this.size,
    required this.color,
    required this.rotation,
  });
}