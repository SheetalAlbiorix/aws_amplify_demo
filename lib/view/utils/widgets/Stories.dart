
import 'package:flutter/material.dart';

import '../base_constant/base_constants.dart';


void main() {
  runApp(StoriesScreen());
}

class StoriesScreen extends StatelessWidget {
  StoriesScreen({Key? key, this.StoryImage, this.userImage, this.userName, this.first}) : super(key: key);
  String? StoryImage;
  String? userImage;
  String? userName;
  bool? first = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10,bottom: 10,top: 10),
      child: AspectRatio(
        aspectRatio: 1.6/2.6,
        child: Container(
          margin: EdgeInsets.only(right: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
                image: NetworkImage(first!?"https://qph.fs.quoracdn.net/main-qimg-11ef692748351829b4629683eff21100.webp":StoryImage!),
                fit: BoxFit.cover
            ),
          ),
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: LinearGradient(
                    begin: Alignment.bottomRight,
                    colors: [
                      Colors.black.withOpacity(.9),
                      Colors.black.withOpacity(.1),
                    ]
                )
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                first!=null?
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                  child: Icon(Icons.add,color: Color(0xFF1777F2),),
                )
                    :
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2),
                      image: DecorationImage(
                          image: NetworkImage(userImage??""),
                          fit: BoxFit.cover
                      )
                  ),
                ),
                 Text(
                    userName??"",
                    style: TextStyle(
                      fontSize: 15,
                      color: BaseColors.white,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w500,
                    ),
                    softWrap: false,
                    textAlign: TextAlign.center,
                    maxLines: 1),
               // Text(userName??"", style: TextStyle(color: Colors.white),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}


