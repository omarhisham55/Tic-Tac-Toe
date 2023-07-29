import 'package:flutter/material.dart';
import 'package:tic_tac_toe/Layout/GameLayout/desktop_game.dart';
import 'package:tic_tac_toe/Layout/GameLayout/mobile_game.dart';
import 'package:tic_tac_toe/Layout/GameLayout/tablet_game.dart';
import 'package:tic_tac_toe/Responsive/responsive.dart';

const backgroundColor = Colors.black;
const hoverColor = Color.fromARGB(255, 28, 28, 28);
const xColor = Colors.red;
const oColor = Colors.green;

class FadePageAnimation extends PageRouteBuilder {
  final Widget page;
  FadePageAnimation({required this.page})
      : super(
            pageBuilder: (context, animation, animationtwo) => page,
            transitionsBuilder: (context, animation, animationtwo, child) {
              var begin = 4.0;
              var end = 1.0;
              var tween = Tween(begin: begin, end: end);
              var curveAnimation =
                  CurvedAnimation(parent: animation, curve: Curves.easeIn);
              return ScaleTransition(
                  scale: tween.animate(curveAnimation),
                  child: FadeTransition(opacity: animation, child: child));
            });
}

void goToGame(context, player) => Navigator.of(context).push(FadePageAnimation(
        page: ResponsiveLayout(
      desktop: DesktopGame(firstPlayer: player),
      mobile: MobileGame(firstPlayer: player),
    )));

void popBack(context) => Navigator.pop(context);

void replacePage(context, page) => Navigator.pushReplacement(
    context, MaterialPageRoute(builder: (context) => page));
