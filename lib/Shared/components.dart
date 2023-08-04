import 'package:flutter/material.dart';

import '../Layout/GameLayout/Bloc/game_manager.dart';

// ignore: must_be_immutable
class HeaderScore extends StatefulWidget {
  final BuildContext context;
  final GameManager manager;
  final String firstPlayer;
  final String secondPlayer;
  final Color firstColor;
  final Color secondColor;
  bool? isDeskTop = false;
  bool? isTablet = false;
  HeaderScore({
    super.key,
    required this.context,
    required this.manager,
    required this.firstPlayer,
    required this.secondPlayer,
    required this.firstColor,
    required this.secondColor,
    this.isDeskTop,
    this.isTablet,
  });

  @override
  State<HeaderScore> createState() => _HeaderScoreState();
}

class _HeaderScoreState extends State<HeaderScore>
    with TickerProviderStateMixin {
  late final AnimationController controller =
      AnimationController(duration: const Duration(seconds: 1), vsync: this)
        ..repeat(reverse: true);
  late final Animation<double> animation = CurvedAnimation(
    parent: controller,
    curve: Curves.easeIn,
  );
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return (widget.isDeskTop ?? false || widget.isTablet == true)
        ? Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GameManager.get(context).playerTurn == 0
                      ? fadeTurn(
                          context: context,
                          text: widget.firstPlayer,
                          color: widget.firstColor,
                        )
                      : Text(
                          widget.firstPlayer,
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge!
                              .copyWith(color: widget.firstColor),
                        ),
                  const SizedBox(width: 20.0),
                  Column(
                    children: [
                      Text(
                        "wins: ${widget.manager.firstPlayerScoreWin}",
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      Text(
                        "loss: ${widget.manager.firstPlayerScorelose}",
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
                    "${widget.manager.drawGames}",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GameManager.get(context).playerTurn == 1
                      ? fadeTurn(
                          context: context,
                          text: widget.secondPlayer,
                          color: widget.secondColor,
                        )
                      : Text(
                          widget.secondPlayer,
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge!
                              .copyWith(color: widget.secondColor),
                        ),
                  const SizedBox(width: 20.0),
                  Column(
                    children: [
                      Text(
                        "wins: ${widget.manager.secondPlayerScoreWin}",
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      Text(
                        "loss: ${widget.manager.secondPlayerScorelose}",
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
                  GameManager.get(context).playerTurn == 0
                      ? fadeTurn(
                          context: context,
                          text: widget.firstPlayer,
                          color: widget.firstColor,
                        )
                      : Text(
                          widget.firstPlayer,
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(color: widget.firstColor),
                        ),
                  const SizedBox(width: 10.0),
                  Column(
                    children: [
                      Text(
                        "wins: ${widget.manager.firstPlayerScoreWin}",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      Text(
                        "loss: ${widget.manager.firstPlayerScorelose}",
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
                    "${widget.manager.drawGames}",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ],
              ),
              Row(
                children: [
                  Column(
                    children: [
                      Text(
                        "wins: ${widget.manager.secondPlayerScoreWin}",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      Text(
                        "loss: ${widget.manager.secondPlayerScorelose}",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ],
                  ),
                  const SizedBox(width: 10.0),
                  GameManager.get(context).playerTurn == 1
                      ? fadeTurn(
                          context: context,
                          text: widget.secondPlayer,
                          color: widget.secondColor,
                        )
                      : Text(
                          widget.secondPlayer,
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(color: widget.secondColor),
                        ),
                ],
              ),
            ],
          );
  }

  Widget fadeTurn({
    required BuildContext context,
    required String text,
    required Color color,
  }) =>
      FadeTransition(
        opacity: controller,
        child: Text(
          text,
          style:
              Theme.of(context).textTheme.displayMedium!.copyWith(color: color),
        ),
      );
}
