import 'package:flutter/material.dart';
import 'package:flutter_wallpaper/wallpaper_viewer.dart';


class WallpaperHome extends StatefulWidget {
  @override
  _WallpaperHomeState createState() => _WallpaperHomeState();
}

class _WallpaperHomeState extends State<WallpaperHome> with SingleTickerProviderStateMixin{
  
  TabController _tabController;
  static var _TabPages = <Widget>[
    displayWallpaper("https://pixabay.com/api/?key=11308358-67ad92507710cb90567e4924c&q=sports+car&image_type=photo&pretty=true"),
    displayWallpaper("https://pixabay.com/api/?key=11308358-67ad92507710cb90567e4924c&q=nature&image_type=photo&pretty=true"),
    displayWallpaper("https://pixabay.com/api/?key=11308358-67ad92507710cb90567e4924c&q=mountains&image_type=photo&pretty=true"),
    displayWallpaper("https://pixabay.com/api/?key=11308358-67ad92507710cb90567e4924c&q=person&image_type=photo&pretty=true")
  ];
  static var _Tabs = <Tab>[
    Tab(text: "Cars",),
    Tab(text: "Nature",),
    Tab(text: "Mountains",),
    Tab(text: "Person",)
  ];
  
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _TabPages.length, vsync: this);
  }
  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "W A L L P A P E R S",
          style: TextStyle(
              color: Colors.yellowAccent,
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.black87,
      ),
      body: TabBarView(children: _TabPages,controller: _tabController,),
      bottomNavigationBar: Material(
        color: Colors.black,
        child: TabBar(
          tabs: _Tabs,
          controller: _tabController,
          labelColor: Colors.lightGreenAccent,
          indicatorColor: Colors.yellowAccent,
        )
      ),
    );
  }
}


