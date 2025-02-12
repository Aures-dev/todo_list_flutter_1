import 'dart:math' as math;
import 'package:flutter/material.dart';

class FlipEffect extends StatefulWidget {
  final Widget child;
  final Duration duration;

  const FlipEffect({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 600),
  });

  @override
  State<FlipEffect> createState() => _FlipEffectState();
}

class _FlipEffectState extends State<FlipEffect>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _startFlip() {
    // Démarre l'animation de flip depuis le début.
    _controller.forward(from: 0.0);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _startFlip,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          // Calcul de l'angle de rotation (de 0 à π radians)
          final angle = _controller.value * math.pi;
          return Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()..rotateY(angle),
            child: child,
          );
        },
        child: widget.child,
      ),
    );
  }
}
