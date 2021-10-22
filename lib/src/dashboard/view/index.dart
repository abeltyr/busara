import 'package:busara/utils/color_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: PlatformColorTheme.secondaryColor,
      body: Center(
        child: Text(
          "Center",
          style: TextStyle(color: PlatformColorTheme.primaryColor),
        ),
      ),
    );
  }
}
