
import 'package:amplify_ui_component/view/utils/widgets/Post.dart';
import 'package:flutter/material.dart';


class PostPage extends StatefulWidget {
  const PostPage({Key? key}) : super(key: key);

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Center(child: Text("Post")),
        actions: const [
          Padding(


            padding: EdgeInsets.only(right: 20.0),
            child: Icon(Icons.more_vert),
          )
        ],
      ),
      body:  PostScreen(userImage: 'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60', username: 'Charles', caption: 'This is a facebook app developed only for testing purpose. Thank you.', timeAgo: '3hrs',
    imageUrl: "https://placebeard.it/640x360", likes: '32', comments: '10',shares: '9',),
    );
  }
}


