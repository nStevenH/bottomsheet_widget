import 'package:flutter/material.dart';

class BlueCircleAnimation extends StatefulWidget {
  const BlueCircleAnimation({Key? key}) : super(key: key);

  @override
  State<BlueCircleAnimation> createState() => _BlueCircleAnimationState();
}

class _BlueCircleAnimationState extends State<BlueCircleAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Alignment> _animationPosition;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    );

    _animationPosition = AlignmentTween(
        begin: const Alignment(0, -0.5), end: const Alignment(0, 0))
        .animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0, end: 150),
      duration: const Duration(seconds: 5),
      builder: (BuildContext context, double size, Widget? child) {
        return Align(
          alignment: _animationPosition.value,
          child: Container(
            width: size,
            height: size,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              border: Border.fromBorderSide(
                BorderSide(
                  color: Colors.blueAccent,
                  width: 4,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
