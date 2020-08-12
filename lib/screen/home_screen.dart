import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'package:facebook/config/palette.dart';
import 'package:facebook/data/data.dart';
import 'package:facebook/models/models.dart';
import 'package:facebook/widget/circle_button.dart';
import 'package:facebook/widget/widgets.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //스크롤 오프셋을 가지고 있는 컨트롤러를 선언해 desktop 스크린과 mobile 스크린의 컨트롤러에 넣어줌
  //넣어주지 않으면 디바이스바 바뀌면 리렌더링하여 스크롤의 위치가 초기화됨
  final TrackingScrollController _trackingScrollController =
      TrackingScrollController();
  @override
  void dispose() {
    _trackingScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Responsive(
          mobile: _HomeScreenMobile(scrollContoller: _trackingScrollController),
          desktop:
              _HomeScreenDesktop(scrollContoller: _trackingScrollController),
        ),
      ),
    );
  }
}

class _HomeScreenMobile extends StatelessWidget {
  final TrackingScrollController scrollContoller;

  const _HomeScreenMobile({Key key, @required this.scrollContoller})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: scrollContoller,
      slivers: [
        SliverAppBar(
          brightness: Brightness.light,
          backgroundColor: Colors.white,
          title: Text(
            'hojunbook',
            style: TextStyle(
                color: Palette.facebookBlue,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                letterSpacing: -1.2),
          ),
          centerTitle: false,
          floating: true,
          actions: [
            CircleButton(
              icon: Icons.search,
              iconSize: 30,
              onPressed: () => print('search'),
            ),
            CircleButton(
              icon: MdiIcons.facebookMessenger,
              iconSize: 30,
              onPressed: () => print('Messenger'),
            ),
          ],
        ),
        SliverToBoxAdapter(
          child: CreatePostContainer(currentUser: currentUser),
        ),
        SliverPadding(
          padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
          sliver: SliverToBoxAdapter(
            child: Rooms(onlineUsers: onlineUsers),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
          sliver: SliverToBoxAdapter(
            child: Stories(
              currentUser: currentUser,
              stories: stories,
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            final Post post = posts[index];
            return PostContainer(post: post);
          }, childCount: posts.length),
        )
      ],
    );
  }
}

class _HomeScreenDesktop extends StatelessWidget {
  final TrackingScrollController scrollContoller;

  const _HomeScreenDesktop({Key key, @required this.scrollContoller})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 2,
          child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.all(12),
                child: MoreOptionsList(currentUser: currentUser),
              )),
        ),
        const Spacer(),
        Container(
          width: 600,
          child: CustomScrollView(
            controller: scrollContoller,
            slivers: [
              SliverPadding(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
                sliver: SliverToBoxAdapter(
                  child: Stories(
                    currentUser: currentUser,
                    stories: stories,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: CreatePostContainer(currentUser: currentUser),
              ),
              SliverPadding(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
                sliver: SliverToBoxAdapter(
                  child: Rooms(onlineUsers: onlineUsers),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  final Post post = posts[index];
                  return PostContainer(post: post);
                }, childCount: posts.length),
              )
            ],
          ),
        ),
        const Spacer(),
        Flexible(
          flex: 2,
          child: Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Container(
                child: ContactsList(users: onlineUsers),
              ),
            ),
          ),
        )
      ],
    );
  }
}
