import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

class AddCityScreen extends StatelessWidget{
  const AddCityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(middle: Text('Home Screen'),),
      child: Container()
      );
  }

}