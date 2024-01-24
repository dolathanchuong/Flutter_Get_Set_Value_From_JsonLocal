// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../commons/app_dialog.dart';
import '../../commons/app_endpoint.dart';
import '../../commons/app_property.dart';
import '../../commons/custom_card.dart';
import 'model/related_model.dart';

class VideoDetail extends StatefulWidget {
  final String id;
  final String title;
  final String channelTitle;
  final String viewCount;
  final String likeCount;
  final String dislikeCount;
  final String publishDate;

  const VideoDetail(
    Key? key,
    this.id,
    this.title,
    this.channelTitle,
    this.viewCount,
    this.likeCount,
    this.dislikeCount,
    this.publishDate,
  ) : super(key: key);

  @override
  VideoDetailState createState() => VideoDetailState();
}

class VideoDetailState extends State<VideoDetail> {
  late YoutubePlayerController _controller;
  late Future<List<RelatedVideo>> props;

  @override
  void initState() {
    super.initState();
    // YT Video Controller Init
    _controller = YoutubePlayerController(
      initialVideoId: widget.id,
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: false,
      ),
    );
    // 연관 비디오 조회
    props = _getRelatedVideos();
  }

  // 연관 비디오 검색
  _getRelatedVideos() {
    return AppEndPoint.getVideoList(widget.id).then((response) {
      var data = json.decode(response.body);
      var searchData = data['items'];
      Future<dynamic> futureMergeData =
          AppEndPoint.getVideosDuration(searchData);
      return futureMergeData.then((data) {
        Iterable inter = data;
        List<RelatedVideo> list =
            inter.map((model) => RelatedVideo.fromJson(model)).toList();
        return list;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Logger logger = Logger();
    String videoTitle = widget.title;
    String channelTitle = widget.channelTitle;

    return Scaffold(
      backgroundColor: StoreStyleProperties.defaultBackgroundColor,
      body: Column(
        children: <Widget>[
          Container(
              padding: const EdgeInsets.only(top: 24.0),
              child: YoutubePlayer(
                controller: _controller,
                showVideoProgressIndicator: true,
                progressIndicatorColor: Colors.amber,
                progressColors: const ProgressBarColors(
                  playedColor: Colors.amber,
                  handleColor: Colors.amberAccent,
                ),
                onReady: () {
                  logger.i('Player is ready.');
                },
              )),
          ListTile(
            title: Text(
              videoTitle,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
              overflow: TextOverflow.ellipsis,
            ),
            subtitle: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                const SizedBox(
                  height: 30,
                ),
                Text(
                  '조회수 ${widget.viewCount} 회 / ${widget.publishDate}',
                  style: const TextStyle(
                    fontSize: 13,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              InkWell(
                child: Column(
                  children: <Widget>[
                    const Icon(
                      Icons.thumb_up,
                      color: Colors.blue,
                      size: 22.0,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 5.0),
                    ),
                    Text(
                      widget.likeCount,
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                onTap: () => AppDialog.showDefaultDialog(context, 'Sample1 !'),
              ),
              InkWell(
                child: Column(
                  children: <Widget>[
                    const Icon(
                      Icons.thumb_down,
                      color: Colors.pink,
                      size: 22.0,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 5.0),
                    ),
                    Text(
                      widget.dislikeCount,
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                onTap: () => AppDialog.showDefaultDialog(context, 'Sample2 !'),
              ),
              InkWell(
                  child: const Column(
                    children: <Widget>[
                      Icon(
                        Icons.share,
                        color: Colors.amberAccent,
                        size: 22.0,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 5.0),
                      ),
                      Text(
                        '공유',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                  //+Feature 클릭시 기본 팝업 표시
                  onTap: () => AppDialog.showDefaultDialog(
                      context, 'Not Feature Share!')),
              const Column(
                children: <Widget>[
                  Icon(
                    Icons.save,
                    color: Colors.deepPurple,
                    size: 22.0,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5.0),
                  ),
                  Text(
                    '저장',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              )
            ],
          ),
          const Divider(),
          const Divider(
            color: StoreStyleProperties.dividerColor,
          ),
          ListTile(
            contentPadding: const EdgeInsets.only(left: 20),
            leading: const CircleAvatar(
              backgroundImage: AssetImage('assets/images/channel-4.jpg'),
              //backgroundColor: Colors.black,
            ),
            title: Text(
              channelTitle,
              style: const TextStyle(color: Colors.white),
              overflow: TextOverflow.ellipsis,
            ),
            trailing: const TextButton(
              onPressed: null,
              child: Text(
                '구독',
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ),
          ),
          const Divider(
            color: StoreStyleProperties.dividerColor,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(left: 10.0),
                child: const Text(
                  "다음 동영상",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                  ),
                ),
              ),
            ],
          ),
          FutureBuilder(
            future: props,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return Expanded(
                  child: ListView.builder(
                    addAutomaticKeepAlives: true,
                    physics: const AlwaysScrollableScrollPhysics(),
                    padding: const EdgeInsets.only(top: 5, bottom: 5),
                    itemCount: snapshot.data?.length,
                    itemBuilder: (BuildContext context, int index) {
                      return CustomRelatedList(
                        thumbnail: snapshot.data![index].thumbnails,
                        title: snapshot.data![index].title,
                        author: snapshot.data![index].channelTitle,
                        viewCount: snapshot.data![index].viewCount,
                        key: UniqueKey(),
                        subtitle: 'banhbao',
                        readDuration: '',
                      );
                    },
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  } // build
}
