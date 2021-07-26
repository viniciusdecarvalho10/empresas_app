import 'package:flutter/material.dart';
import '../helpers/app_colors.dart';

class InputRoundedWidget extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  const InputRoundedWidget({
    Key? key,
    required this.label,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextButton(
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            label,
            style: TextStyle(color: AppTheme.whisper, fontFamily: "Rubik", fontWeight: FontWeight.w500),
          ),
        ),
        style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0))),
            backgroundColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
              if (states.contains(MaterialState.disabled)) return AppTheme.grey40;
              return AppTheme.ruby; // Use the component's default.
            })),
      ),
    );
  }
}
