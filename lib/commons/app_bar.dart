import 'package:flutter/material.dart';
import '../commons/app_property.dart';

class TopAppBar extends StatefulWidget {
  const TopAppBar({super.key});
  @override
  AppBarState createState() => AppBarState();

  Size get preferredSize => const Size.fromHeight(55.0);
}

class AppBarState extends State<TopAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      // 제목 간격을 0으로
      titleSpacing: 15,
      title: Image.asset('assets/images/youtube-music.png',
          width: 120, fit: BoxFit.cover),
      backgroundColor: StoreStyleProperties.systemBarColor,
      actions: <Widget>[
        IconButton(
          icon: const Icon(
            Icons.videocam,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(
            Icons.search,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
        Container(
          width: 55,
          height: 50,
          padding: const EdgeInsets.all(12.0),
          child: const CircleAvatar(
            radius: 5.0,
            backgroundImage: AssetImage('assets/images/17153380.png'),
          ),
        )
      ],
    );
  }
}
