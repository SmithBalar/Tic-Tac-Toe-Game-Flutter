import 'package:flutter/material.dart';
import 'package:tic_tac_toe_game/components/app_colors.dart';

class TicTacToeBox extends StatelessWidget {
  const TicTacToeBox({
    super.key,
    required this.playerSymbol,
    required this.onTap,
  });

  final VoidCallback? onTap;
  final String playerSymbol;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: AppColors.primaryColor.withOpacity(0.2),
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.borderColor, width: 2),
        ),
        child: Center(
          child: Visibility(
            visible: playerSymbol.isNotEmpty,
            child: Image.asset(
              playerSymbol,
              color: AppColors.primaryColor,
              height: 30,
              width: 30,
            ),
          ),
        ),
      ),
    );
  }
}
