import 'package:flutter/material.dart';


void main() {
  runApp(CreateRoomScreen());
}

class CreateRoomScreen extends StatelessWidget {
   CreateRoomScreen({Key? key, this.title}) : super(key: key);
   final String? title;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.0,
      //  width: 100,
      color: Colors.white,
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: _CreateRoomButton(),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              children: [
                _AvatarImage(profileAvatarImage: "https://i.insider.com/57bf2f13956abc1d008b45f9?width=957&format=jpeg",),
                _AvatarImage(profileAvatarImage: "https://vignette.wikia.nocookie.net/marvelcinematicuniverse/images/0/0a/Nick_Fury_Textless_AoU_Poster.jpg/revision/latest/top-crop/width/360/height/360?cb=20161119163035",),
                _AvatarImage(profileAvatarImage: "https://cnet4.cbsistatic.com/img/hajPWxWk1aqwW7RiIRRZlIYsHBg=/940x0/2019/05/06/b8c3ae69-a9e4-4542-bc28-7a88e890b7cd/spider-man-far-from-home-sony.png",),
              ],
            ),
          )
        ],
      ),
    );
  }
}




class _GradientButtonRoom extends StatelessWidget {
  _GradientButtonRoom({this.child});

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) {
        return RadialGradient(
          center: Alignment.topLeft,
          radius: 1,
          colors: [Colors.blue, Colors.pinkAccent],
          tileMode: TileMode.clamp,
        ).createShader(bounds);
      },
      child: child,
    );
  }
}

class _AvatarImage extends StatelessWidget{

  final String profileAvatarImage;

  const _AvatarImage({
    Key? key,
   required this.profileAvatarImage,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
      return Padding(
        padding: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
        child: Stack(
            children: [
              CircleAvatar(
                radius: 20.0,
                backgroundColor: Colors.grey[200],
                backgroundImage: NetworkImage(profileAvatarImage!=null?profileAvatarImage:"https://qph.fs.quoracdn.net/main-qimg-11ef692748351829b4629683eff21100.webp"),
             //   image: NetworkImage(widget.first!?"https://qph.fs.quoracdn.net/main-qimg-11ef692748351829b4629683eff21100.webp":widget.StoryImage!),
              ),
              Positioned(
                bottom: 0.0,
                right: 0.0,
                child: Container(
                  height: 15.0,
                  width: 15.0,
                  decoration: BoxDecoration(
                    color: Color(0xFF50b525),
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: 2.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ]
        ),
      );
  }

}



class _CreateRoomButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 120,
      child:
      ElevatedButton(
        onPressed: () {
          print('create Room');
        },
        style: ElevatedButton.styleFrom(
          primary: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0),
          ),
          // color: Colors.white,
          side: const BorderSide(
            width: 2.0,
            color: Colors.blue,
          ),
          textStyle: const TextStyle(
            color:Color(0xFF1777F2),
          ),
        ),

        child: Row(
          children: [
            _GradientButtonRoom(
              child: const Icon(
                Icons.video_call,
                size: 25,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 7.0),
            const Text('Create\nRoom'),
          ],
        ),
      ),
    );
  }
}