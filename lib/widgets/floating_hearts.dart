import 'package:flutter/material.dart';
import '../config/romantic_colors.dart';

class FloatingHearts extends StatefulWidget {
  final int heartCount;
  final bool autoStart;
  
  const FloatingHearts({
    super.key,
    this.heartCount = 6,
    this.autoStart = true,
  });

  @override
  State<FloatingHearts> createState() => FloatingHeartsWidgetState();
}

class FloatingHeartsWidgetState extends State<FloatingHearts>
    with TickerProviderStateMixin {
  final List<AnimationController> _controllers = [];
  final List<Animation<Offset>> _animations = [];
  final List<Animation<double>> _opacityAnimations = [];
  final List<Animation<double>> _scaleAnimations = [];

  @override
  void initState() {
    super.initState();
    if (widget.autoStart) {
      _initializeAnimations();
    }
  }

  void _initializeAnimations() {
    for (int i = 0; i < widget.heartCount; i++) {
      final controller = AnimationController(
        duration: Duration(milliseconds: 2000 + (i * 200)),
        vsync: this,
      );

      final curvedAnimation = CurvedAnimation(
        parent: controller,
        curve: Curves.easeInOut,
      );

      final animation = Tween<Offset>(
        begin: Offset(
          (i % 3 - 1) * 0.3,
          1.5,
        ),
        end: Offset(
          (i % 3 - 1) * 0.5,
          -0.5,
        ),
      ).animate(curvedAnimation);

      final opacityAnimation = Tween<double>(
        begin: 0.0,
        end: 1.0,
      ).animate(
        CurvedAnimation(
          parent: controller,
          curve: const Interval(0.0, 0.3, curve: Curves.easeIn),
        ),
      );

      final fadeOutAnimation = Tween<double>(
        begin: 1.0,
        end: 0.0,
      ).animate(
        CurvedAnimation(
          parent: controller,
          curve: const Interval(0.7, 1.0, curve: Curves.easeOut),
        ),
      );

      final scaleAnimation = Tween<double>(
        begin: 0.5,
        end: 1.2,
      ).animate(curvedAnimation);

      _controllers.add(controller);
      _animations.add(animation);
      _opacityAnimations.add(opacityAnimation);
      _scaleAnimations.add(scaleAnimation);

      Future.delayed(Duration(milliseconds: i * 300), () {
        if (mounted) {
          controller.repeat();
        }
      });
    }
  }

  void startHeartAnimation() {
    if (_controllers.isEmpty) {
      _initializeAnimations();
    } else {
      for (var controller in _controllers) {
        controller.forward(from: 0.0);
      }
    }
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_controllers.isEmpty) {
      return const SizedBox.shrink();
    }

    return IgnorePointer(
      child: Stack(
        children: List.generate(
          widget.heartCount,
          (index) => AnimatedBuilder(
            animation: _controllers[index],
            builder: (context, child) {
              final opacity = _controllers[index].value < 0.3
                  ? _opacityAnimations[index].value
                  : _controllers[index].value > 0.7
                      ? _opacityAnimations[index].value *
                          (1.0 - _controllers[index].value)
                      : 1.0;

              return SlideTransition(
                position: _animations[index],
                child: Opacity(
                  opacity: opacity,
                  child: Transform.scale(
                    scale: _scaleAnimations[index].value,
                    child: Icon(
                      Icons.favorite,
                      color: RomanticColors.romanticRed
                          .withOpacity(0.6 + (index % 3) * 0.1),
                      size: 30 + (index % 3) * 5.0,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}