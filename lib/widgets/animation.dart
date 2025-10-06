import 'package:flutter/material.dart';

class AnimationLine extends StatefulWidget {
  @override
  _AnimationLineState createState() => _AnimationLineState();
}

class _AnimationLineState extends State<AnimationLine>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (_, __) {
          return ShaderMask(
            shaderCallback: (bounds) {
              return LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                stops: [_controller.value, 3.0, 4.0],
                colors: [Colors.transparent, Colors.black, Colors.black],
              ).createShader(bounds);
            },
            blendMode: BlendMode.dstIn,
            child: Image(image: AssetImage('asssets/splash/Rectangle 9.png')),
          );
        },
      ),
    );
  }
}
