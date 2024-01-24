// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../commons/app_property.dart';

// 연관 동영상 목록
class RelatedVideoWidget extends StatefulWidget {
  final String title;
  final String thumbnail;
  final String subtitle;
  final String duration;

  const RelatedVideoWidget(
    Key? key,
    this.title,
    this.thumbnail,
    this.subtitle,
    this.duration,
  ) : super(key: key);

  @override
  RelatedVideoState createState() => RelatedVideoState();
}

class RelatedVideoState extends State<RelatedVideoWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: StoreStyleProperties.videoCardColor,
      margin: const EdgeInsets.only(left: 9.0, top: 2.0),
      child: Column(
        children: <Widget>[
          SizedBox(
            width: 180,
            height: 90,
            child: Stack(
              children: <Widget>[
                Image.network(
                  widget.thumbnail,
                  width: 180,
                  fit: BoxFit.fitWidth,
                ),
                Positioned(
                    right: 5.0,
                    bottom: 5.0,
                    child: Container(
                      decoration: const BoxDecoration(color: Colors.black),
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        widget.duration,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ))
              ],
            ),
          ),
          Expanded(
            child: SizedBox(
              width: 180,
              height: 80,
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 8.0, left: 3.0),
                    height: 20,
                    child: Text(
                      widget.title,
                      style: const TextStyle(color: Colors.white, fontSize: 17),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 5.0, left: 3.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        widget.subtitle,
                        style:
                            const TextStyle(color: Colors.grey, fontSize: 14),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
