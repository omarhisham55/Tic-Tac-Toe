import 'package:flutter/material.dart';
import 'package:elliptic_text/elliptic_text.dart';
import 'package:tic_tac_toe/Shared/constants.dart';

class DesktopMenu extends StatelessWidget {
  const DesktopMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  const SizedBox(
                    height: 500.0,
                    width: 500.0,
                    child: EllipticText(
                      text: "Tic-Tac-Toe",
                      style: TextStyle(
                        color: Colors.deepPurple,
                        fontSize: 50.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        "Choose player 1",
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                      const SizedBox(height: 20.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          MaterialButton(
                            onPressed: () {
                              goToGame(context, "X");
                            },
                            hoverColor: hoverColor,
                            color: xColor,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20.0,
                              ),
                              child: Text(
                                "X",
                                style: Theme.of(context).textTheme.displayLarge,
                              ),
                            ),
                          ),
                          const SizedBox(width: 20.0),
                          MaterialButton(
                            onPressed: () => goToGame(context, "O"),
                            hoverColor: hoverColor,
                            color: oColor,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15.0),
                              child: Text(
                                "O",
                                style: Theme.of(context).textTheme.displayLarge,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
