import 'package:flutter/material.dart';

import '../../core/constants/colors.dart';

class PlayerButtons extends StatelessWidget {
  const PlayerButtons({
    super.key,
    required this.onPress,
    required this.icon,
    this.size = 40.0,
    this.color = YColors.white,
  });

  final void Function()? onPress;
  final IconData icon;
  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: const ButtonStyle().copyWith(foregroundColor: MaterialStatePropertyAll(color)),
      onPressed: onPress,
      child: Icon(
        icon,
        size: size,
      ),
    );
  }
}
