import 'package:flutter/material.dart';
import 'package:flutter_icon_data/flutter_icon_data.dart';
import 'dart:convert';

import '../../commons/app_property.dart';
import '../../commons/app_related_card.dart';

class CollectionBox extends StatefulWidget {
  @override
  _CollectionBoxState createState() => _CollectionBoxState();
}

class _CollectionBoxState extends State<CollectionBox> {
  int _value = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: StoreStyleProperties.defaultBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Center(
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(9.0),
                    child: Text(
                      "최근 동영상",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 145,
              child: FutureBuilder(
                future: DefaultAssetBundle.of(context)
                    .loadString('assets/api/getSearchList.json'),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return const Text('error!');
                  } else {
                    var decodeJson = json.decode(snapshot.data.toString());
                    return ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      itemBuilder: (BuildContext context, int index) {
                        return RelatedVideoWidget(
                          UniqueKey(),
                          decodeJson[index]['title'],
                          decodeJson[index]['thumbnails'],
                          decodeJson[index]['channelTitle'],
                          decodeJson[index]['duration'],
                        );
                      },
                    );
                  }
                },
              ),
            ),
            const Divider(
              color: StoreStyleProperties.dividerColor,
            ),
            SizedBox(
              height: 260,
              child: ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: const [
                  ListTile(
                    leading: Icon(
                      MaterialCommunityIcons.history,
                      color: Colors.white,
                    ),
                    title: Text(
                      '기록',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                  ListTile(
                    leading: Icon(
                      MaterialCommunityIcons.download,
                      color: Colors.white,
                    ),
                    title: Text(
                      '오프라인 저장 동영상',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    subtitle: Text(
                      '동영상 2개',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  ListTile(
                    leading: Icon(
                      MaterialCommunityIcons.play_box_outline,
                      color: Colors.white,
                    ),
                    title: Text(
                      '내 동영상',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                  ListTile(
                    leading: Icon(
                      MaterialCommunityIcons.clock,
                      color: Colors.white,
                    ),
                    title: Text(
                      '나중에 볼 동영상',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    subtitle: Text(
                      '시청하지 않은 동영상 26개',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              color: StoreStyleProperties.dividerColor,
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.all(10.0),
                    child: const Text(
                      "재생목록",
                      style: TextStyle(color: Colors.white, fontSize: 17),
                    ),
                  ),
                  Center(
                      child: Theme(
                    data: Theme.of(context).copyWith(
                      canvasColor: const Color.fromRGBO(20, 20, 20, 0.9),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        value: _value,
                        items: const [
                          DropdownMenuItem(
                            value: 0,
                            child: Text(
                              "최근 추가순",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          DropdownMenuItem(
                            value: 1,
                            child: Text(
                              "가나다순",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                        onChanged: (value) {
                          setState(() {
                            _value = value!;
                          });
                        },
                      ),
                    ),
                  ))
                ],
              ),
            ),
            Center(
              child: ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  const ListTile(
                    leading: SizedBox(
                        width: 40,
                        child: Icon(
                          MaterialCommunityIcons.plus,
                          size: 38,
                          color: Colors.lightBlueAccent,
                        )),
                    title: Row(
                      children: [
                        Expanded(
                          child: Text(
                            "새 재생목록",
                            style: TextStyle(
                              color: Colors.lightBlue,
                              fontWeight: FontWeight.bold,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                  ListTile(
                    leading: SizedBox(
                        width: 40,
                        child: ClipRRect(
                          child: Image.asset("assets/images/channel-4.jpg"),
                        )),
                    title: const Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Animation Music Collection",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    subtitle: const Text(
                      "동영상 200개",
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  ListTile(
                    leading: SizedBox(
                        width: 40,
                        child: ClipRRect(
                          child: Image.asset("assets/images/channel-4.jpg"),
                        )),
                    title: const Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Animation Music Collection",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    subtitle: const Text(
                      "동영상 200개",
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  ListTile(
                    leading: SizedBox(
                        width: 40,
                        child: ClipRRect(
                          child: Image.asset("assets/images/channel-4.jpg"),
                        )),
                    title: const Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Animation Music Collection",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    subtitle: const Text(
                      "동영상 200개",
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
