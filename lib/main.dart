import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tic_tac_toe/Layout/MenuLayout/mobile_menu.dart';
import 'package:tic_tac_toe/Responsive/responsive.dart';
import 'package:tic_tac_toe/Shared/theme.dart';

import 'Layout/MenuLayout/desktop_menu.dart';
import 'Shared/blocObserver.dart';

void main() {
  Bloc.observer = MyBlocObserver();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: GameTheme.gameTheme,
      home: const ResponsiveLayout(
        desktop: DesktopMenu(),
        mobile: MobileMenu(),
      ),
    );
  }
}
