import 'package:amplify_ui_component/view/utils/base_constant/base_constants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

void main() {
  runApp(AddPost());
}


class AddPost extends StatelessWidget {
   AddPost({Key? key,this.title}) : super(key: key);
  final String?title;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.0,
      child: Container(
        padding: const EdgeInsets.fromLTRB(12.0, 15.0, 12.0, 0.0),
        color: Colors.white,
        child: Column(
          children: [
            Row(
              children: [
                Stack(
                  children: [
                    CircleAvatar(
                      radius: 20.0,
                      backgroundColor: Color(0xFF1777F2),
                      child: CircleAvatar(
                        radius: 20.0,
                        backgroundColor: Colors.grey[200],
                        backgroundImage: NetworkImage("https://qph.fs.quoracdn.net/main-qimg-11ef692748351829b4629683eff21100.webp"),
                      ),
                    ),
                  ],
                ),
                14.toHSB,
               const Expanded(
                  child: TextField(
                    decoration: InputDecoration.collapsed(
                      hintText: 'What\'s on your mind?',
                    ),
                  ),
                ),
                14.toHSB,
                const Icon(
                    Icons.search
                ),
              ],
            ),
            const Divider(height: 20.0, thickness: 0.5),
            Container(
              height: 40.0,

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton.icon(
                    label:Text(
                        BaseStrings.live,
                        style: TextStyle(
                          fontSize: 15,
                          color: BaseColors.black,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w500,
                        ),
                        softWrap: false,
                        textAlign: TextAlign.center,
                        maxLines: 1),

                    onPressed: () => print('Live'),
                    icon:  Icon(
                      MdiIcons.videoImage,
                      color: Colors.pink,
                      size: 20,
                    ),

                  ),
                  const VerticalDivider(width: 8.0,),
                  TextButton.icon(
                    label: const Text(
                        BaseStrings.photo,
                        style: TextStyle(
                          fontSize: 15,
                          color: BaseColors.black,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w500,
                        ),
                        softWrap: false,
                        textAlign: TextAlign.center,
                        maxLines: 1),
                    onPressed: () => print('Photo'),
                    icon: const Icon(
                      Icons.photo_library,
                      color: Colors.deepPurpleAccent,
                      size: 20,
                    ),
                    //   label: Text('Photo'),
                  ),
                  const VerticalDivider(width: 8.0),
                   TextButton.icon(
                    label: const Text(
                        BaseStrings.room,
                        style: TextStyle(
                          fontSize: 15,
                          color: BaseColors.black,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w500,
                        ),
                        softWrap: false,
                        textAlign: TextAlign.center,
                        maxLines: 1),
                    onPressed: () => print('Room'),
                    icon: const Icon(
                      Icons.video_call,
                      color: Colors.blueAccent,
                      size: 20,
                    ),
                    //  label: Text('Room'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}




