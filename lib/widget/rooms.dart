import 'package:flutter/material.dart';
import 'package:facebook/config/palette.dart';
import 'package:facebook/models/models.dart';
import 'package:facebook/widget/widgets.dart';

class Rooms extends StatelessWidget {
  final List<User> onlineUsers;

  const Rooms({Key key, this.onlineUsers}) : super(key: key);
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
        height: 60,
        color: Colors.white,
        child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 4, vertical: 10),
            scrollDirection: Axis.horizontal,
            itemCount: 1 + onlineUsers.length,
            itemBuilder: (BuildContext context, int index) {
              if (index == 0) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: _CreateRoomButton(),
                );
              }
              User user = onlineUsers[index - 1];
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: ProfileAvatar(
                  imageUrl: user.imageUrl,
                  isActive: true,
                ),
              );
            }),
      ),
    );
  }
}

class _CreateRoomButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OutlineButton(
      onPressed: () => print("create room"),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      color: Colors.white,
      borderSide: BorderSide(
        width: 3,
        color: Colors.blueAccent[100],
      ),
      textColor: Palette.facebookBlue,
      child: Row(
        children: [
          // ShaderMask(
          //   shaderCallback: (rect) =>
          //       Palette.createRoomGradient.createShader(rect),
          //   child: Icon(
          //     Icons.video_call,
          //     size: 35,
          //     color: Colors.white,
          //   ),
          // ),
          Icon(
            Icons.video_call,
            size: 35,
            color: Colors.purple,
          ),
          SizedBox(
            width: 4,
          ),
          Text('Create\nRoom')
        ],
      ),
    );
  }
}
