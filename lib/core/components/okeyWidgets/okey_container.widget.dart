import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zobo/colors/colors.dart';

class OkeyContainerWidget extends StatelessWidget {
  final ValueNotifier<int> score;

  const OkeyContainerWidget({super.key, required this.score});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: score,
      builder: (context, value, _) {
        return Container(
          height: 70,
          width: 130,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(color: btn2Color, blurRadius: 10, offset: Offset(0, 4)),
            ],
            color: bgColor,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: btn2Color, width: 2),
          ),
          child: Center(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return ScaleTransition(scale: animation, child: child);
              },
              child: Text(
                value.toString(),
                key: ValueKey<int>(value),
                style: GoogleFonts.poppins(
                  color: txtColor,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
