import 'package:flutter/material.dart';

import 'package:tabbar/models/embedpost.dart';
import 'package:tabbar/widgets/single.dart';
import 'package:flutter_html_view/flutter_html_view.dart';
import 'package:intl/intl.dart';

class PostCard extends StatefulWidget {
  final Post post;

  PostCard(this.post);

  @override
  _PostCardState createState() => _PostCardState(post);
}

class _PostCardState extends State<PostCard> {
  Post post;

  _PostCardState(this.post);

  @override
  Widget build(BuildContext context) {
    return makeCard(post);
    // Card(
    //           child:

    //           ListTile(

    //               contentPadding: EdgeInsets.all(10.0),
    //               title: new Text(post.title.rendered),
    //               // subtitle: new Text(post.excerpt.rendered),
    //               subtitle: new Text(post.featuredMediaUrl),

    //               ),

    //           );
  }

  Container makeListTile(Post post) => Container(
    padding: EdgeInsets.all(12.0),
    child :
    Column(
       mainAxisSize: MainAxisSize.min,
    children: [
        post.featuredMedia == 0 ? new Container(width: 0, height: 0) :
        FadeInImage.assetNetwork(
          placeholder: 'images/placeholder.png',
          image: post.featuredMediaUrl ?? 'https://picsum.photos/250?image=9',
        ),
        ListTile(
          contentPadding:
              EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          leading: Container(
              padding: EdgeInsets.only(right: 12.0),
              decoration: new BoxDecoration(
                  border: new Border(
                      right:
                          new BorderSide(width: 1.0, color: Colors.white24))),
              child: 
               Icon(Icons.autorenew, color: Colors.white),
              ),
          title: Text(
            post.title.rendered,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),
          subtitle: Text(post.excerpt.rendered.replaceAll(new RegExp(r'<[^>]*>'), ''),
              style: TextStyle(color: Colors.white)),
        ),
        ListTile(
          title: Text(post.author, style: TextStyle(color: Colors.white)),
          subtitle: Text(
              DateFormat('MM-dd – kk:mm').format(post.date).toString(),
              style: TextStyle(color: Colors.white)),
          trailing:
              Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SinglePost(post: post)));
          },
        )
      ])
  );

  Card makeCard(Post post) => Card(
        elevation: 8.0,
        margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
        child: Container(
          decoration: BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
          child: makeListTile(post),
        ),
      );
}
