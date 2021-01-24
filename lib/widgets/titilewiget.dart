import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:wallpaperapp/models/pictures_model.dart';
import 'package:wallpaperapp/view/image_view.dart';

Widget wallPaper(List<PicturesModel> listPictures, BuildContext context) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 16),
    child: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 0.6,
        physics: ClampingScrollPhysics(),
        shrinkWrap: true,
        padding: const EdgeInsets.all(4.0),
        mainAxisSpacing: 6.0,
        crossAxisSpacing: 6.0,
        children: listPictures.map((PicturesModel pictureModel) {
          return GridTile(
              child: GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ImageView(
                            imgPath: pictureModel.src.portrait,
                          )));
            },
            child: Hero(
              tag: pictureModel.src.portrait,
              child: Container(
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: kIsWeb
                        ? Image.network(
                            pictureModel.src.portrait,
                            height: 50,
                            width: 100,
                            fit: BoxFit.cover,
                          )
                        : CachedNetworkImage(
                            imageUrl: pictureModel.src.portrait,
                            placeholder: (context, url) => Container(
                                  color: Color(0xfff5f8fd),
                                ),
                            fit: BoxFit.cover)),
              ),
            ),
          ));
        }).toList()),
  );
}

Widget brandName() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Text(
        "The",
        style: TextStyle(color: Colors.red),
      ),
      Text(
        "Wallpaper",
        style: TextStyle(
          color: Colors.black,
        ),
      )
    ],
  );
}