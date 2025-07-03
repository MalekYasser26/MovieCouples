import 'package:flutter/material.dart';
import 'package:movies_couples_tracker/core/utils/app_colors.dart';

class SplitHeartPainter extends CustomPainter {
  final bool isLeftFilled;
  final bool isRightFilled;
  final double animationValue;

  SplitHeartPainter({
    this.isLeftFilled = true,
    this.isRightFilled = false,
    this.animationValue = 1.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paintFilled = Paint()
      ..color = AppColors.lightPrimary
      ..style = PaintingStyle.fill;

    final paintEmpty = Paint()
      ..color = AppColors.lightPrimary.withValues(alpha: 0.3)
      ..style = PaintingStyle.fill;

    final width = size.width;
    final height = size.height;

    final heartPath = Path();

    // Move to bottom center (taller heart shape)
    heartPath.moveTo(width / 2, height * 0.9);

    // Right lobe
    heartPath.cubicTo(
      width * 1.1, height * 0.5,
      width * 0.8, height * 0.1,
      width / 2, height * 0.35,
    );

    // Left lobe
    heartPath.cubicTo(
      width * 0.2, height * 0.1,
      -width * 0.1, height * 0.5,
      width / 2, height * 0.9,
    );

    heartPath.close();

    // Draw left half
        {
      canvas.save();

      // Calculate center for left half scaling
      final leftCenterX = isLeftFilled==true && isRightFilled ==true ? width /1.35 : isLeftFilled ==true && isRightFilled ==false ? width : width;
      final centerY = height / 2;

      // Translate to left half center
      canvas.translate(leftCenterX, centerY);

      // Scale if left is filled, else scale = 1
      final leftScale = isLeftFilled ? animationValue : 1.0;
      canvas.scale(leftScale, leftScale);

      // Translate back
      canvas.translate(-leftCenterX, -centerY);

      // Clip to left half and draw
      canvas.clipPath(heartPath);
      canvas.clipRect(Rect.fromLTRB(0, 0, width / 2, height));
      canvas.drawRect(
        Rect.fromLTRB(0, 0, width / 2, height),
        isLeftFilled ? paintFilled : paintEmpty,
      );

      canvas.restore();
    }

    // Draw right half
        {
      canvas.save();

      // Calculate center for right half scaling
      final rightCenterX = width * 3 / 4;
      final centerY = height / 2;

      // Translate to right half center
      canvas.translate(rightCenterX, centerY);

      // Scale if right is filled, else scale = 1
      final rightScale = isRightFilled ? animationValue : 1.0;
      canvas.scale(rightScale, rightScale);

      // Translate back
      canvas.translate(-rightCenterX, -centerY);

      // Clip to right half and draw
      canvas.clipPath(heartPath);
      canvas.clipRect(Rect.fromLTRB(width / 2, 0, width, height));
      canvas.drawRect(
        Rect.fromLTRB(width / 2, 0, width, height),
        isRightFilled ? paintFilled : paintEmpty,
      );

      canvas.restore();
    }
  }

  @override
  bool shouldRepaint(covariant SplitHeartPainter oldDelegate) {
    return oldDelegate.isLeftFilled != isLeftFilled ||
        oldDelegate.isRightFilled != isRightFilled ||
        oldDelegate.animationValue != animationValue;
  }
}

class SplitHeartWidget extends StatefulWidget {
  final bool isLeftFilled;
  final bool isRightFilled;
  final double size;
  final Duration duration;

  const SplitHeartWidget({
    super.key,
    this.isLeftFilled = true,
    this.isRightFilled = false,
    this.size = 150,
    this.duration = const Duration(milliseconds: 800),
  });

  @override
  State<SplitHeartWidget> createState() => _SplitHeartWidgetState();
}

class _SplitHeartWidgetState extends State<SplitHeartWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    );

    _animation = Tween<double>(
      begin: 1.0,
      end: 1.15,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.elasticOut,
    ));

    // Start the animation loop only if there's a filled part
    if (widget.isLeftFilled || widget.isRightFilled) {
      _controller.repeat(reverse: true);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(SplitHeartWidget oldWidget) {
    super.didUpdateWidget(oldWidget);

    // Start or stop animation based on filled state
    if (widget.isLeftFilled || widget.isRightFilled) {
      if (!_controller.isAnimating) {
        _controller.repeat(reverse: true);
      }
    } else {
      _controller.stop();
      _controller.reset();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        double currentScale = 1.0;

        // Only apply animation if any part is filled
        if (widget.isLeftFilled || widget.isRightFilled) {
          currentScale = _animation.value;
        }

        return CustomPaint(
          painter: SplitHeartPainter(
            isLeftFilled: widget.isLeftFilled,
            isRightFilled: widget.isRightFilled,
            animationValue: currentScale,
          ),
          size: Size(widget.size, widget.size),
        );
      },
    );
  }
}

