import 'dart:html';

import 'package:flutter/cupertino.dart';

class ScreenUtils{

  // 当前屏幕的宽度
  static double screenW(BuildContext context){
    MediaQueryData mediaQuery = MediaQuery.of(context);
    double screen_width =  mediaQuery.size.width;
    return screen_width;
  }

  // 当前屏幕的高度
  static double ScreenH(BuildContext context){
    MediaQueryData mediaQuery = MediaQuery.of(context);
    double screen_height = mediaQuery.size.height;
    return screen_height;
  }
}