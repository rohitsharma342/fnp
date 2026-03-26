import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../config/romantic_colors.dart';
import '../config/romantic_animations.dart';

class RomanticAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final Widget? leading;
  final bool showHeartIcon;
  final bool centerTitle;
  final VoidCallback? onHeartTap;
  
  const RomanticAppBar({
    super.key,
    required this.title,
    this.actions,
    this.leading,
    this.showHeartIcon = false,
    this.centerTitle = true,
    this.onHeartTap,
  });
  
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  
  @override
  State<RomanticAppBar> createState() => _RomanticAppBarState();
}

class _RomanticAppBarState extends State<RomanticAppBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _heartBeatAnimation;
  late Animation<double> _shimmerAnimation;
  
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: RomanticAnimations.gentle,
      vsync: this,
    );
    
    _heartBeatAnimation = Tween<double>(
      begin: 1.0,
      end: 1.2,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.elasticOut,
    ));
    
    _shimmerAnimation = RomanticAnimations.createShimmer(_controller);
    
    if (widget.showHeartIcon) {
      _controller.repeat(reverse: true);
    }
  }
  
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: RomanticColors.sunsetGradient,
        boxShadow: [
          BoxShadow(
            color: RomanticColors.roseGold.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: widget.centerTitle,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
        ),
        leading: widget.leading ?? _buildDefaultLeading(),
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (widget.showHeartIcon) ..[
              AnimatedBuilder(
                animation: _heartBeatAnimation,
                builder: (context, child) {
                  return Transform.scale(
                    scale: _heartBeatAnimation.value,
                    child: GestureDetector(
                      onTap: widget.onHeartTap,
                      child: Icon(
                        Icons.favorite,
                        color: RomanticColors.romanticRed,
                        size: 24,
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(width: 8),
            ],
            Flexible(
              child: Text(
                widget.title,
                style: TextStyle(
                  color: RomanticColors.dustyRose.withOpacity(0.9),
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.5,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        actions: widget.actions ?? [],
        flexibleSpace: AnimatedBuilder(
          animation: _shimmerAnimation,
          builder: (context, child) {
            return Container(
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
            );
          },
        ),
      ),
    );
  }
  
  Widget? _buildDefaultLeading() {
    if (Navigator.of(context).canPop()) {
      return IconButton(
        icon: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            Icons.arrow_back_ios_new,
            color: RomanticColors.dustyRose,
            size: 18,
          ),
        ),
        onPressed: () => Navigator.of(context).pop(),
      );
    }
    return null;
  }
}