import 'package:flutter/material.dart';
import 'package:flutter_wallpaper/wallpaper_body.dart';

void main()=> runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Wallpaper App",
      home: WallpaperHome(),
    );
  }
}

