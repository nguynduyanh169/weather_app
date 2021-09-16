import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class WeatherDetailsScreen extends StatelessWidget {
  const WeatherDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: CustomScrollView(
      slivers: <Widget>[
        CupertinoSliverNavigationBar(
            leading: TextButton(
                onPressed: () {
                  print('edit');
                },
                child: const Text(
                  "Edit",
                  style: TextStyle(fontWeight: FontWeight.w700),
                ))),
      ],
    ));
  }
}
