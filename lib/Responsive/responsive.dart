import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final StatelessWidget mobile;
  final StatelessWidget desktop;
  const ResponsiveLayout({
    super.key,
    required this.desktop,
    required this.mobile,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth <= 650) {
          return mobile;
        } else {
          return desktop;
        }
      },
    );
  }
}
