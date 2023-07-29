import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tic_tac_toe/Layout/GameLayout/Bloc/game_manager.dart';
import 'package:tic_tac_toe/Layout/GameLayout/Bloc/game_states.dart';
import 'package:tic_tac_toe/Shared/constants.dart';

class TabletGame extends StatelessWidget {
  final String firstPlayer;
  TabletGame({super.key, required this.firstPlayer});

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
            child: Column(
              children: [
                headerScore(context: context, manager: manager),
                gameTable(context: context, manager: manager),
              ],
            ),
          ),
        );
      }),
    );
  }

  Widget headerScore({
    required BuildContext context,
    required GameManager manager,
  }) =>
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                firstPlayer,
                style: Theme.of(context)
                    .textTheme
                    .displayLarge!
                    .copyWith(color: firstColor),
              ),
              const SizedBox(width: 20.0),
              Column(
                children: [
                  Text(
                    "wins: ${manager.firstPlayerScoreWin}",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  Text(
                    "loss: ${manager.firstPlayerScorelose}",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ],
              ),
            ],
          ),
          Column(
            children: [
              Text(
                "Draw",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              Text(
                "${manager.drawGames}",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ],
          ),
          Row(
            children: [
              Column(
                children: [
                  Text(
                    "wins: ${manager.secondPlayerScoreWin}",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  Text(
                    "loss: ${manager.secondPlayerScorelose}",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ],
              ),
              const SizedBox(width: 20.0),
              Text(
                secondPlayer,
                style: Theme.of(context)
                    .textTheme
                    .displayLarge!
                    .copyWith(color: secondColor),
              ),
            ],
          ),
        ],
      );

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
