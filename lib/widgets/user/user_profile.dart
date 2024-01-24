import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import '../player/model/simple_player_model.dart';
import 'package:youtube/widgets/player/simple_player.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  UserProfileState createState() => UserProfileState();
}

class UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    final myModel = Provider.of<SimplePlayerControlModel>(context);
    return Scaffold(
        body: Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                    ),
                    child: const Text(
                      'Random VideoID 추가',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () => myModel.updateVideoIdModel(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent,
                    ),
                    child: const Text(
                      'VideoID 삭제',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () => myModel.setVideoId(""),
                  ),
                )
              ],
            ),
            const Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                height: 50,
                child: SimplePlayerWidget(), // 재생중인 비디오가 있으면 하단에 표시한다.
              ),
            )
          ]),
    ));
  }
}
