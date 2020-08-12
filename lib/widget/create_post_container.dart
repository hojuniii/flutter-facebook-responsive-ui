import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:facebook/data/data.dart';
import 'package:facebook/models/user_model.dart';
import 'package:facebook/widget/widgets.dart';

class CreatePostContainer extends StatelessWidget {
  final User currentUser;

  const CreatePostContainer({Key key, @required this.currentUser})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = Responsive.isDesktop(context);
    return Card(
      margin: EdgeInsets.symmetric(horizontal: isDesktop ? 5 : 8),
      elevation: isDesktop ? 1 : 0,
      shape: isDesktop
          ? RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
          : null,
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.fromLTRB(12, 8, 12, 0),
        child: Column(
          children: [
            Row(
              children: [
                ProfileAvatar(
                  imageUrl: currentUser.imageUrl,
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration.collapsed(
                        hintText: 'Waht\'s on your mind?'),
                  ),
                )
              ],
            ),
            Divider(
              height: 10,
              thickness: 0.5,
            ),
            Container(
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FlatButton.icon(
                      onPressed: () => print('12'),
                      icon: Icon(
                        Icons.videocam,
                        color: Colors.red,
                      ),
                      label: Text('Live')),
                  FlatButton.icon(
                      onPressed: () => print('12'),
                      icon: Icon(
                        Icons.photo_library,
                        color: Colors.green,
                      ),
                      label: Text('Photo')),
                  FlatButton.icon(
                      onPressed: () => print('12'),
                      icon: Icon(
                        Icons.video_call,
                        color: Colors.purpleAccent,
                      ),
                      label: Text('Room'))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
