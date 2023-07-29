import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tic_tac_toe/Layout/GameLayout/Bloc/game_states.dart';
import 'package:tic_tac_toe/Shared/constants.dart';

class GameManager extends Cubit<GameStates> {
  GameManager() : super(InitialGameState());

  static GameManager get(context) => BlocProvider.of(context);

  List<Color?>? gamePlayColor = List.generate(9, (index) => null);
  List<String> cells = List.generate(9, (index) => '');
  int playerTurn = 0;
  int drawGames = 0;
  int firstPlayerScoreWin = 0;
  int firstPlayerScorelose = 0;
  int secondPlayerScoreWin = 0;
  int secondPlayerScorelose = 0;

  void restartGame() {
    gamePlayColor = List.generate(9, (index) => null);
    cells = List.generate(9, (index) => '');
    emit(RestartGameState());
  }

  void gamePlay({
    required int index,
    required String firstPlayer,
    required String secondPlayer,
    required Color firstColor,
    required Color secondColor,
  }) {
    playerTurn == 0
        ? {
            if (cells[index].isEmpty)
              {
                cells[index] = firstPlayer,
                gamePlayColor![index] = firstColor,
                playerTurn++,
                checkWin(firstPlayer, secondPlayer),
              }
          }
        : {
            if (cells[index].isEmpty)
              {
                cells[index] = secondPlayer,
                gamePlayColor![index] = secondColor,
                playerTurn--,
                checkWin(firstPlayer, secondPlayer),
              }
          };
    emit(ChangeTurnState());
  }

  void checkWin(String firstPlayer, String secondPlayer) {
    //check rows
    for (int i = 0; i < 3; i++) {
      if (cells[3 * i] == cells[3 * i + 1] &&
          cells[3 * i + 1] == cells[3 * i + 2] &&
          cells[3 * i] != "") {
        cells[3 * i] == firstPlayer
            ? {
                firstPlayerScoreWin++,
                secondPlayerScorelose++,
                emit(EndGameState(gameResult: "Player 1 Wins")),
              }
            : {
                firstPlayerScorelose++,
                secondPlayerScoreWin++,
                emit(EndGameState(gameResult: "Player 2 Wins")),
              };
      }
    }
    //check columns
    for (int i = 0; i < 3; i++) {
      if (cells[i] == cells[i + 3] &&
          cells[i + 3] == cells[i + 6] &&
          cells[i] != "") {
        cells[i] == firstPlayer
            ? {
                firstPlayerScoreWin++,
                secondPlayerScorelose++,
                emit(EndGameState(gameResult: "Player 1 Wins")),
              }
            : {
                firstPlayerScorelose++,
                secondPlayerScoreWin++,
                emit(EndGameState(gameResult: "Player 2 Wins")),
              };
      }
    }
    //check diagonals
    if (cells[0] == cells[4] && cells[4] == cells[8] && cells[0] != "") {
      cells[0] == firstPlayer
          ? {
              firstPlayerScoreWin++,
              secondPlayerScorelose++,
              emit(EndGameState(gameResult: "Player 1 Wins")),
            }
          : {
              firstPlayerScorelose++,
              secondPlayerScoreWin++,
              emit(EndGameState(gameResult: "Player 2 Wins")),
            };
    }

    if (cells[2] == cells[4] && cells[4] == cells[6] && cells[2] != "") {
      cells[2] == firstPlayer
          ? {
              firstPlayerScoreWin++,
              secondPlayerScorelose++,
              emit(EndGameState(gameResult: "Player 1 Wins")),
            }
          : {
              firstPlayerScorelose++,
              secondPlayerScoreWin++,
              emit(EndGameState(gameResult: "Player 2 Wins")),
            };
    }

    bool isFull = false;
    for (var element in cells) {
      if (element.isEmpty) {
        isFull = false;
        break;
      } else {
        isFull = true;
      }
    }
    if (isFull) {
      drawGames++;
      emit(EndGameState(gameResult: "Draw"));
    }
  }

  void isGameFinished(BuildContext context, String result, String firstPlayer) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Center(
          child: Text(
            result,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            MaterialButton(
              onPressed: () {
                popBack(context);
                restartGame();
              },
              color: Colors.deepPurple,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "Play again",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            MaterialButton(
              onPressed: () {
                popBack(context);
                popBack(context);
              },
              color: Colors.deepPurple,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "Main menu",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
