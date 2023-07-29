import 'package:flutter/material.dart';

import '../Layout/GameLayout/Bloc/game_manager.dart';

Widget headerScore({
  required BuildContext context,
  required GameManager manager,
  required String firstPlayer,
  required String secondPlayer,
  required Color firstColor,
  required Color secondColor,
  bool isDeskTop = false,
  bool isTablet = false,
}) =>
    (isDeskTop || isTablet)
        ? Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
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
                mainAxisSize: MainAxisSize.min,
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
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    secondPlayer,
                    style: Theme.of(context)
                        .textTheme
                        .displayLarge!
                        .copyWith(color: secondColor),
                  ),
                  const SizedBox(width: 20.0),
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
                ],
              ),
            ],
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    firstPlayer,
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium!
                        .copyWith(color: firstColor),
                  ),
                  const SizedBox(width: 10.0),
                  Column(
                    children: [
                      Text(
                        "wins: ${manager.firstPlayerScoreWin}",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      Text(
                        "loss: ${manager.firstPlayerScorelose}",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    "Draw",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(
                    "${manager.drawGames}",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ],
              ),
              Row(
                children: [
                  Column(
                    children: [
                      Text(
                        "wins: ${manager.secondPlayerScoreWin}",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      Text(
                        "loss: ${manager.secondPlayerScorelose}",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ],
                  ),
                  const SizedBox(width: 10.0),
                  Text(
                    secondPlayer,
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium!
                        .copyWith(color: secondColor),
                  ),
                ],
              ),
            ],
          );
