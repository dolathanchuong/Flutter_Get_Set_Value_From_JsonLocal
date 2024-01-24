// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../commons/app_property.dart';
import '../widgets/detail/video_detail.dart';

class VideoCard extends StatefulWidget {
  final String id;
  final String title;
  final String channelTitle;
  final String thumbnails;
  final String duration;
  final String viewCount;
  final String likeCount;
  final String dislikeCount;
  final String publishDate;

  const VideoCard(
    Key? key,
    this.id,
    this.title,
    this.channelTitle,
    this.thumbnails,
    this.duration,
    this.viewCount,
    this.likeCount,
    this.dislikeCount,
    this.publishDate,
  ) : super(key: key);

  @override
  VideoCardState createState() => VideoCardState();
}

class VideoCardState extends State<VideoCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: StoreStyleProperties.videoCardColor,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Stack(
            children: <Widget>[
              Image.network(
                widget.thumbnails,
                width: 400,
                height: 215,
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
          ListTile(
            leading: const SizedBox(
              width: 40,
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/images/channel-4.jpg'),
              ),
            ),
            title: Row(
              children: [
                Expanded(
                  child: Text(
                    widget.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            subtitle: Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      '${widget.channelTitle}  /  ',
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      '${widget.viewCount} 회',
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                  ],
                )),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => VideoDetail(
                    UniqueKey(),
                    widget.id,
                    widget.title,
                    widget.channelTitle,
                    widget.viewCount,
                    widget.likeCount,
                    widget.dislikeCount,
                    widget.publishDate,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
