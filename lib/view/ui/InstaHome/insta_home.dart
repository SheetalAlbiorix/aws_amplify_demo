
import 'package:amplify_ui_component/view/utils/base_constant/base_constants.dart';
import 'package:amplify_ui_component/view/utils/widgets/widgets.dart';
import 'package:amplify_ui_component/viewmodel/InstaController.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';


class InstaHome extends StatelessWidget {

  final InstaController logic = Get.put(InstaController());


  final topText = Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      const TextView(
        "Stories",
        color: BaseColors.black,
        fontSize: 14,
        fontFamily: 'Spartan',
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w700,
        textAlign: TextAlign.center,
      ),

      Row(
        children: const <Widget>[
          Icon(Icons.play_arrow),
          TextView(
            "Watch All",
            color: BaseColors.black,
            fontSize: 14,
            fontFamily: 'Spartan',
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w700,
            textAlign: TextAlign.center,
          ),
        ],
      )
    ],
  );

  final stories = Expanded(
    child: Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) =>
            Stack(
              alignment: Alignment.bottomRight,
              children: <Widget>[
                Column(
                  children: [
                    Container(
                      width: 60.0,
                      height: 60.0,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(
                                "https://picsum.photos/200/300?random=1")),
                      ),
                      margin: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 2),

                    ),
                    const TextView(
                      "John doe",
                      color: BaseColors.black,
                      fontSize: 10,
                      fontFamily: 'Spartan',
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w700,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),

                index == 0
                    ? const Positioned(
                    right: 5.0, bottom: 30,
                    child: CircleAvatar(
                      backgroundColor: Colors.blueAccent,
                      radius: 10.0,
                      child: Icon(
                        Icons.add,
                        size: 14.0,
                        color: Colors.white,
                      ),
                    ))
                    : Container(),


              ],
            ),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery
        .of(context)
        .size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xfff8faf8),
          centerTitle: true,
          elevation: 1.0,
          leading: const Icon(Icons.camera_alt),
          title: const TextView(
            BaseStrings.title,
            color: BaseColors.black,
            fontSize: 24,
            fontFamily: 'Spartan',
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w600,
            textAlign: TextAlign.center,
          ),
          actions: const <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 12.0),
              child: Icon(Icons.send),
            )
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Flexible(child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) =>
              index == 0
                  ? SizedBox(
                height: deviceSize.height * 0.19,
                child: Container(
                  margin: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      topText,
                      stories,
                    ],
                  ),
                ),
              )
                  : Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16.0, 16.0, 8.0, 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Container(
                              height: 40.0,
                              width: 40.0,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: NetworkImage(
                                        "https://picsum.photos/200/300?random=2")),
                              ),
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const TextView(
                                  "imfdkljkdj doe",
                                  color: BaseColors.black,
                                  fontSize: 14,
                                  fontFamily: 'Spartan',
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w700,
                                  textAlign: TextAlign.center,
                                ),

                                5.toVSB,
                                const TextView(
                                  "John doe",
                                  color: BaseColors.grey,
                                  fontSize: 10,
                                  fontFamily: 'Spartan',
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w600,
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            )
                          ],
                        ),
                        const IconButton(
                          icon: Icon(Icons.more_vert),
                          onPressed: null,
                        )
                      ],
                    ),
                  ),
                  Flexible(
                    fit: FlexFit.loose,
                    child: Image.network(
                      "https://images.pexels.com/photos/672657/pexels-photo-672657.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Obx(() {
                              return IconButton(
                                icon: Icon(
                                    logic.isPressed.value
                                        ? Icons.favorite
                                        : FontAwesomeIcons.heart),
                                color: logic.isPressed.value
                                    ? Colors.red
                                    : Colors
                                    .black,
                                onPressed: () {

                                  logic.isPressed.value =
                                  !logic.isPressed.value;

                                },
                              );
                            }),
                            10.toHSB,
                            const Icon(
                              FontAwesomeIcons.comment,
                            ),
                            10.toHSB,
                            const Icon(FontAwesomeIcons.paperPlane),
                          ],
                        ),
                        const Icon(FontAwesomeIcons.bookmark)
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child:
                     TextView(
                      "Liked by pawankumar, pk and 528,331 others",
                      color: BaseColors.black,
                      fontSize: 14,
                      fontFamily: 'Spartan',
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w700,
                    ),

                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16.0, 16.0, 0.0, 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          height: 40.0,
                          width: 40.0,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage(
                                    "https://i.picsum.photos/id/646/200/300.jpg?hmac=qCJ0bf6G6oSxx8YMMc1ZLVryK-w596XjRD3o8cXQLFc")),
                          ),
                        ),
                        7.toHSB,
                        const Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Add a comment...",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: TextView(
                      "1 Day Ago",
                      color: BaseColors.grey,
                      fontSize: 14,
                      fontFamily: 'Spartan',
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w500,
                    ),

                  )
                ],
              ),
            ),)
          ],
        ),

    );
  }
}
