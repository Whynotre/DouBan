import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("build homepage");
    return Container(
      child: Text("123"),
    );
  }
}

var _tab = ["动态", "推荐"];

DefaultTabController getWidget() {
  return DefaultTabController(
      length: _tab.length,
      child: Text(
        "Home Page",
      ));
}
