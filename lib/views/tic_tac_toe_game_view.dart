import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_toe_game/components/app_assets.dart';
import 'package:tic_tac_toe_game/models/player_model.dart';
import 'package:tic_tac_toe_game/views/widgets/tic_tac_toe_box.dart';

import '../controllers/tic_tac_toe_controller.dart';

class TicTacToeGameView extends StatelessWidget {
  const TicTacToeGameView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Tic-Tac-Toe', style: TextStyle(fontWeight: FontWeight.w600)),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'Status: ${Provider.of<TicTacToeController>(context).status}',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                itemCount: 9,
                itemBuilder: (context, index) {
                  int row = index ~/ 3;
                  int col = index % 3;
                  log('$index: [$row, $col]');
                  var board = Provider.of<TicTacToeController>(context, listen: false).gameBoard;

                  return TicTacToeBox(
                    playerSymbol: _getPlayerSymbol(board[row][col]),
                    onTap: () {
                      Provider.of<TicTacToeController>(context, listen: false).makeMove(row, col);
                    },
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Provider.of<TicTacToeController>(context, listen: false).resetGame();
              },
              child: const Text('Restart Game'),
            ),
          ],
        ),
      ),
    );
  }

  String _getPlayerSymbol(Player player) {
    switch (player) {
      case Player.X:
        return AppAssets.X;
      case Player.O:
        return AppAssets.O;
      default:
        return '';
    }
  }
}
