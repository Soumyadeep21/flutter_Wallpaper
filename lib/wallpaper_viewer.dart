
import 'dart:convert';
import 'package:flutter_wallpaper/fullscreen_image.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';


class displayWallpaper extends StatefulWidget {
  String url;
  displayWallpaper(this.url);

  @override
  displayWallpaperState createState() {
    return new displayWallpaperState();
  }
}

class displayWallpaperState extends State<displayWallpaper> {

  //String url = "https://pixabay.com/api/?key=11308358-67ad92507710cb90567e4924c&q=sports+car&image_type=photo&pretty=true";
  bool isDataLoaded = false;
  List data;

  @override
  void initState() {
    super.initState();
    this.getJsonData();
  }

  Future<String> getJsonData() async{
    var response = await http.get(
      Uri.encodeFull(widget.url),
    );
    print(response.body);
    setState(() {
      var convertDataToJson = json.decode(response.body);
      data = convertDataToJson['hits'];
      isDataLoaded = true;
    });
    return "Success";
  }

  @override
  Widget build(BuildContext context) {
    if(isDataLoaded)
      return Container(
        color: Colors.black,
        child: StaggeredGridView.countBuilder(
          padding: EdgeInsets.all(4.0),
          crossAxisCount: 4,
          itemCount: data.length,
          itemBuilder: (context,i){
            String imgPath = data[i]['largeImageURL'];
            return Material(
              clipBehavior: Clip.antiAlias,
              borderRadius: BorderRadius.circular(10.0),
              child: InkWell(
                child: Hero(
                    tag: imgPath,
                    child: FadeInImage(
                        fit: BoxFit.cover,
                        placeholder: AssetImage('images/place_holder.png'),
                        image: NetworkImage(imgPath)
                    )
                ),
                onTap: (){
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context)=> FullScreenImagePage(imgPath))
                  );
                },
              ),
            );
          },
          staggeredTileBuilder: (i)=> StaggeredTile.count(2, i.isEven ? 2 : 3),
          mainAxisSpacing: 8.0,
          crossAxisSpacing: 8.0,
        ),
      );
    else
      return Container(
          child: Center(
              child: CircularProgressIndicator(
                  valueColor: new AlwaysStoppedAnimation<Color>(Colors.yellowAccent)
              )
          ),
          color: Colors.black,
      );
  }
}