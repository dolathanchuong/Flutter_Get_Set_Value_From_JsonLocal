import 'package:flutter/material.dart';
import 'dart:convert';

import '../../commons/app_property.dart';
import '../../commons/app_alarm_card.dart';

class NoticeWidget extends StatefulWidget {
  const NoticeWidget({super.key});

  @override
  NoticeWidgetState createState() => NoticeWidgetState();
}

class NoticeWidgetState extends State<NoticeWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: StoreStyleProperties.defaultBackgroundColor,
      body: SizedBox(
        child: FutureBuilder(
          future: DefaultAssetBundle.of(context)
              .loadString('assets/api/getAlarmList.json'),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            } else {
              var decodeJson = json.decode(snapshot.data.toString());
              return ListView.builder(
                shrinkWrap: true,
                addAutomaticKeepAlives: true,
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.only(top: 5, bottom: 5),
                itemCount: decodeJson.length,
                itemBuilder: (BuildContext context, int index) {
                  return AppAlarmCard(
                    decodeJson[index]['id'],
                    decodeJson[index]['title'],
                    decodeJson[index]['publishDate'],
                    decodeJson[index]['thumbnails'],
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
