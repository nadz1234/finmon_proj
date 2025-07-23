import 'package:finmon_proj/component/globals.dart';
import 'package:flutter/material.dart';

class GradientOutlinedButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final bool loading;
  final List<Color> gradientColors;
  final double borderRadius;
  final Color backgroundColor;
  final TextStyle? textStyle;
  final double borderWidth;

  const GradientOutlinedButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.loading = false,
    this.gradientColors = const [Colors.blue, Colors.purple],
    this.borderRadius = 12,
    this.backgroundColor = const Color.fromARGB(255, 255, 255, 255),
    this.textStyle,
    this.borderWidth = 1.5,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: gradientColors),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      padding: EdgeInsets.all(borderWidth),
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: OutlinedButton(
          onPressed: loading ? null : onPressed,
          style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            side: BorderSide.none,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          ),
          child: Text(
            loading ? 'Loading...' : text,
            style:
                textStyle ??
                TextStyle(color: btnGradient2, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
