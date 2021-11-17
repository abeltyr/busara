import 'package:busara/src/dashboard/controller/wins.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Kingdom extends StatelessWidget {
  const Kingdom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userWinsProvider =
        Provider.of<UserWinsProvider>(context, listen: true);
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return Container(
        width: constraints.maxWidth,
        height: 250,
        margin: const EdgeInsets.symmetric(vertical: 5),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            userWinsProvider.userRequired.image,
            fit: BoxFit.fitHeight,
          ),
        ),
      );
    });
  }
}
