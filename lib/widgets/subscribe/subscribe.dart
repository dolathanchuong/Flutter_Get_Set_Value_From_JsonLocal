import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:convert';

import '../../commons/app_property.dart';
import '../../commons/app_video_card.dart';
import '../../commons/utils.dart';
import '../player/simple_player.dart';
import '../player/model/simple_player_model.dart';

class Subscribe extends StatefulWidget {
  const Subscribe({super.key});

  @override
  SubscribeState createState() => SubscribeState();
}

class SubscribeState extends State<Subscribe> {
  @override
  Widget build(BuildContext context) {
    final myModel = Provider.of<SimplePlayerControlModel>(context);
    return Scaffold(
      backgroundColor: StoreStyleProperties.defaultBackgroundColor,
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 80,
            child: Row(
              children: <Widget>[
                Flexible(
                  flex: 7,
                  fit: FlexFit.loose,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      Container(
                        width: 65,
                        margin: const EdgeInsets.all(5.0),
                        child: const CircleAvatar(
                          radius: 55,
                          backgroundImage:
                              AssetImage('assets/images/17153380.png'),
                        ),
                      ),
                      Container(
                        width: 65,
                        margin: const EdgeInsets.all(5.0),
                        child: const CircleAvatar(
                          radius: 55,
                          backgroundImage:
                              AssetImage('assets/images/channel-4.jpg'),
                        ),
                      ),
                      Container(
                        width: 65,
                        margin: const EdgeInsets.all(5.0),
                        child: const CircleAvatar(
                          radius: 55,
                          backgroundImage:
                              AssetImage('assets/images/channel-7.jpg'),
                        ),
                      ),
                      Container(
                        width: 65,
                        margin: const EdgeInsets.all(5.0),
                        child: const CircleAvatar(
                          radius: 55,
                          backgroundImage:
                              AssetImage('assets/images/channel-6.jpg'),
                        ),
                      ),
                      Container(
                        width: 65,
                        margin: const EdgeInsets.all(5.0),
                        child: const CircleAvatar(
                          radius: 55,
                          backgroundImage:
                              AssetImage('assets/images/channel-3.jpg'),
                        ),
                      ),
                      Container(
                        width: 65,
                        margin: const EdgeInsets.all(5.0),
                        child: const CircleAvatar(
                          radius: 55,
                          backgroundImage:
                              AssetImage('assets/images/channel-4.jpg'),
                        ),
                      ),
                      Container(
                        width: 65,
                        margin: const EdgeInsets.all(5.0),
                        child: const CircleAvatar(
                          radius: 55,
                          backgroundImage:
                              AssetImage('assets/images/yt-music.png'),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Center(
                    child: InkWell(
                      onTap: () {},
                      child: const Text(
                        '전체',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.lightBlue,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            color: StoreStyleProperties.dividerColor,
          ),
          SizedBox(
            height: 45,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Container(
                  margin: const EdgeInsets.all(5.0),
                  child: ButtonTheme(
                    minWidth: 50,
                    buttonColor: StoreStyleProperties.borderColor,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: const BorderSide(
                              color: StoreStyleProperties.borderColor),
                        ),
                      ),
                      child: const Text(
                        "전체",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          fontFamily: 'Roboto',
                        ),
                      ),
                      onPressed: () {},
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(5.0),
                  child: ButtonTheme(
                    minWidth: 50,
                    buttonColor: StoreStyleProperties.borderColor,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: const BorderSide(
                              color: StoreStyleProperties.borderColor),
                        ),
                      ),
                      child: const Text(
                        "오늘",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                      onPressed: () {},
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(5.0),
                  child: ButtonTheme(
                    minWidth: 50,
                    buttonColor: StoreStyleProperties.borderColor,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: const BorderSide(
                              color: StoreStyleProperties.borderColor),
                        ),
                      ),
                      child: const Text(
                        "이어서 시청하기",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                      onPressed: () {},
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(5.0),
                  child: ButtonTheme(
                    minWidth: 50,
                    buttonColor: StoreStyleProperties.borderColor,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: const BorderSide(
                              color: StoreStyleProperties.borderColor),
                        ),
                      ),
                      child: const Text(
                        "시청하지 않음",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                      onPressed: () {},
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(5.0),
                  child: ButtonTheme(
                    minWidth: 50,
                    buttonColor: StoreStyleProperties.borderColor,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: const BorderSide(
                              color: StoreStyleProperties.borderColor),
                        ),
                      ),
                      child: const Text(
                        "실시간",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                      onPressed: () {},
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            color: StoreStyleProperties.dividerColor,
          ),
          FutureBuilder(
            future: DefaultAssetBundle.of(context)
                .loadString('assets/api/getSubscribeList.json'),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              } else {
                var decodeJson = json.decode(snapshot.data.toString());
                return Expanded(
                  child: ListView.builder(
                    addAutomaticKeepAlives: true,
                    physics: const AlwaysScrollableScrollPhysics(),
                    padding: const EdgeInsets.only(bottom: 5),
                    itemCount: decodeJson.length,
                    itemBuilder: (BuildContext context, int index) {
                      return VideoCard(
                        UniqueKey(),
                        decodeJson[index]['id'],
                        Utils.replaceTitle(decodeJson[index]['title']),
                        decodeJson[index]['channelTitle'],
                        decodeJson[index]['thumbnails'],
                        decodeJson[index]['duration'],
                        Utils.numberGrouping(decodeJson[index]['viewCount']),
                        Utils.numberGrouping(decodeJson[index]['likeCount']),
                        Utils.numberGrouping(decodeJson[index]['dislikeCount']),
                        decodeJson[index]['publishDate'],
                      );
                    },
                  ),
                );
              } // else
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              height: myModel.videoId != "" ? 50 : 0,
              child: const SimplePlayerWidget(), // 재생중인 비디오가 있으면 하단에 표시한다.
            ),
          )
        ],
      ),
    );
  }
}
