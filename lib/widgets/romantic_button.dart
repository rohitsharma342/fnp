import 'package:flutter/material.dart';
import '../config/romantic_colors.dart';
import '../config/romantic_animations.dart';

class RomanticButton extends StatefulWidget {
  final String text;
  final VoidCallback? onPressed;
  final IconData? icon;
  final bool isPrimary;
  final bool showHeartBeat;
  final double? width;
  final double? height;
  
  const RomanticButton({
    super.key,
    required this.text,
    this.onPressed,
    this.icon,
    this.isPrimary = true,
    this.showHeartBeat = false,
    this.width,
    this.height,
  });
  
  @override
  State<RomanticButton> createState() => _RomanticButtonState();
}

class _RomanticButtonState extends State<RomanticButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _heartBeatAnimation;
  bool _isPressed = false;
  
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: RomanticAnimations.gentle,
      vsync: this,
    );
    
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 0.95,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: RomanticAnimations.romantic,
    ));
    
    _heartBeatAnimation = Tween<double>(
      begin: 1.0,
      end: 1.1,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.elasticOut,
    ));
    
    if (widget.showHeartBeat) {
      _startHeartBeat();
    }
  }
  
  void _startHeartBeat() {
    _controller.repeat(reverse: true);
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
          scale: widget.showHeartBeat ? _heartBeatAnimation.value : _scaleAnimation.value,
          child: GestureDetector(
            onTapDown: (_) {
              if (!widget.showHeartBeat) {
                setState(() => _isPressed = true);
                _controller.forward();
              }
            },
            onTapUp: (_) {
              if (!widget.showHeartBeat) {
                setState(() => _isPressed = false);
                _controller.reverse();
              }
              widget.onPressed?.call();
            },
            onTapCancel: () {
              if (!widget.showHeartBeat) {
                setState(() => _isPressed = false);
                _controller.reverse();
              }
            },
            child: Container(
              width: widget.width,
              height: widget.height ?? 54,
              decoration: BoxDecoration(
                gradient: widget.isPrimary
                    ? RomanticColors.heartGradient
                    : RomanticColors.romanticGradient,
                borderRadius: BorderRadius.circular(27),
                boxShadow: [
                  BoxShadow(
                    color: widget.isPrimary
                        ? RomanticColors.softCoral.withOpacity(0.3)
                        : RomanticColors.roseGold.withOpacity(0.3),
                    blurRadius: 12,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(27),
                  onTap: widget.onPressed,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (widget.icon != null) ..[
                          Icon(
                            widget.icon,
                            color: Colors.white,
                            size: 20,
                          ),
                          const SizedBox(width: 8),
                        ],
                        Text(
                          widget.text,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}