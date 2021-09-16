import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: Colors.grey,
        child: CustomScrollView(
      slivers: <Widget>[
        CupertinoSliverNavigationBar(
          leading: Material(
            color: Colors.transparent,
            child: TextButton(
              style: ButtonStyle(foregroundColor: MaterialStateProperty.all(Colors.blue)),
                onPressed: () {
                  print('edit');
                },
                child: const Text(
                  "Edit",
                  textAlign: TextAlign.left,
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22),
                )),
          ),
          largeTitle: const Text('Weather'),
          trailing: Material(
            color: Colors.transparent,
            child: InkWell(
              child: const Icon(CupertinoIcons.add, size: 22,),
              onTap: () {
                print('ok');
              },
            ),
          ),
        ),
        SliverGrid(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200.0,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
            childAspectRatio: 3 / 2,
          ),
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Container(
                alignment: Alignment.center,
                color: Colors.blue[100 * (index % 9)],
                child: Text('Grid Item $index'),
              );
            },
            childCount: 20,
          ),
        )
      ],
    ));
  }
}
