import 'package:flutter/material.dart';

import '../../core/constants/colors.dart';
import 'player_buttons.dart';

class PlayButton extends StatelessWidget {
  const PlayButton({
    super.key,
    this.onPress,
    required this.icon,
  });

  final void Function()? onPress;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: YColors.accent,
        boxShadow: [
          BoxShadow(
            color: YColors.accentOpaque,
            spreadRadius: 4,
            blurRadius: 8,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: PlayerButtons(
          icon: icon,
          onPress: onPress,
          color: YColors.secondary,
        ),
      ),
    );
  }
}
