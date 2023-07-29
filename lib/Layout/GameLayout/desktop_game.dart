import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tic_tac_toe/Layout/GameLayout/Bloc/game_manager.dart';
import 'package:tic_tac_toe/Layout/GameLayout/Bloc/game_states.dart';
import 'package:tic_tac_toe/Shared/constants.dart';

import '../../Shared/components.dart';

class DesktopGame extends StatelessWidget {
  final String firstPlayer;
  DesktopGame({super.key, required this.firstPlayer});

  late final String secondPlayer = firstPlayer == "X" ? "O" : "X";
  late final Color firstColor = firstPlayer == "X" ? xColor : oColor;
  late final Color secondColor = firstPlayer == "X" ? oColor : xColor;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GameManager(),
      child: BlocConsumer<GameManager, GameStates>(listener: (context, state) {
        if (state is EndGameState) {
          GameManager.get(context)
              .isGameFinished(context, state.gameResult, firstPlayer);
        }
      }, builder: (context, state) {
        GameManager manager = GameManager.get(context);
        return Scaffold(
          appBar: AppBar(
            leading: Container(),
            actions: [
              TextButton(
                onPressed: () => popBack(context),
                child: const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Text(
                    'Back to menu',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Row(
              children: [
                Expanded(
                    flex: 2,
                    child: gameTable(context: context, manager: manager)),
                const SizedBox(width: 20.0),
                Expanded(
                  child: headerScore(
                    context: context,
                    manager: manager,
                    firstColor: firstColor,
                    secondColor: secondColor,
                    firstPlayer: firstPlayer,
                    secondPlayer: secondPlayer,
                    isDeskTop: true,
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }

  Widget gameTable({
    required BuildContext context,
    required GameManager manager,
  }) =>
      Table(
        children: [
          for (int i = 0; i < 3; i++)
            TableRow(
              children: [
                for (int j = 0; j < 3; j++)
                  GestureDetector(
                    onTap: () => manager.gamePlay(
                      index: i * 3 + j,
                      firstColor: firstColor,
                      secondColor: secondColor,
                      firstPlayer: firstPlayer,
                      secondPlayer: secondPlayer,
                    ),
                    child: Container(
                      height: 150,
                      width: 100,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        // color: Colors.green,
                      ),
                      child: Center(
                        child: Text(
                          manager.cells[i * 3 + j],
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(
                                  color: manager.gamePlayColor![i * 3 + j]),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
        ],
      );
}
