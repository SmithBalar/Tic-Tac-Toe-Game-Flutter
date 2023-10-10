import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_toe_game/components/app_colors.dart';
import 'package:tic_tac_toe_game/controllers/tic_tac_toe_controller.dart';
import 'package:tic_tac_toe_game/views/tic_tac_toe_game_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TicTacToeController(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          colorSchemeSeed: AppColors.primaryColor,
          scaffoldBackgroundColor: AppColors.secondaryColor,
        ),
        home: const TicTacToeGameView(),
      ),
    );
  }
}
