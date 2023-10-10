import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tic_tac_toe_game/models/player_model.dart';

class TicTacToeController with ChangeNotifier {
  List<List<Player>> gameBoard = List.generate(3, (_) => List.filled(3, Player.none));
  Player currentPlayer = Player.X;
  String status = 'Playing...';

  void makeMove(int row, int col) {
    log(currentPlayer.toString());
    if (gameBoard[row][col] == Player.none && status == 'Playing...') {
      gameBoard[row][col] = currentPlayer;
      checkWin();
      togglePlayer();
      notifyListeners();
    }
    log('Row: $row, Column: $col');
    log(gameBoard.toString());
  }

  /// To switch player from X to O and vice versa
  void togglePlayer() {
    currentPlayer = currentPlayer == Player.X ? Player.O : Player.X;
  }

  /// To check the winner of Tic-Tac-Toe game
  void checkWin() {
    /// Tic-Tac-Toe Board indices pattern
    // 00, 01, 02
    // 10, 11, 12
    // 20, 21, 22
    for (int i = 0; i < 3; i++) {
      /// To check horizontal matches (00, 01, 02), (10, 11, 12), (20, 21, 22)
      if (gameBoard[i][0] != Player.none && gameBoard[i][0] == gameBoard[i][1] && gameBoard[i][0] == gameBoard[i][2]) {
        status = 'Player "${gameBoard[i][0].name}" wins!';
      }

      /// To check vertical matches (00, 10, 20), (01, 11, 21), (02, 12, 22)
      if (gameBoard[0][i] != Player.none && gameBoard[0][i] == gameBoard[1][i] && gameBoard[0][i] == gameBoard[2][i]) {
        status = 'Player "${gameBoard[0][i].name}" wins!';
      }
    }

    /// To check top-left to bottom-right diagonal match (00, 11, 22)
    if (gameBoard[0][0] != Player.none && gameBoard[0][0] == gameBoard[1][1] && gameBoard[0][0] == gameBoard[2][2]) {
      status = 'Player "${gameBoard[0][0].name}" wins!';
    }

    /// To check top-right to bottom-left diagonal match (02, 11, 20)
    if (gameBoard[0][2] != Player.none && gameBoard[0][2] == gameBoard[1][1] && gameBoard[0][2] == gameBoard[2][0]) {
      status = 'Player "${gameBoard[0][2].name}" wins!';
    }

    if (status != 'Playing...') {
      return;
    }

    bool isDraw = true;
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        if (gameBoard[i][j] == Player.none) {
          isDraw = false;
          break;
        }
      }
    }

    if (isDraw) {
      status = 'Draw!';
    }
  }

  /// To restart the game
  void resetGame() {
    gameBoard = List.generate(3, (_) => List.filled(3, Player.none));
    currentPlayer = Player.X;
    status = 'Playing...';
    notifyListeners();
  }
}
