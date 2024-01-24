import 'package:flutter/material.dart';
import 'dart:math';

// 재생한 비디오가 있을경우 상세 페이지를 제외한 다른 페이지에서 작은 플레이어를 하단에 표시한다.
class SimplePlayerControlModel with ChangeNotifier {
  late String _thumbnail;
  late String _videoTitle;
  late String _subTitle;
  late String _videoId;
  String get videoId => _videoId;

  SimplePlayerControlModel(
      this._thumbnail, this._videoTitle, this._subTitle, this._videoId);

  SimplePlayerControlModel.empty() {
    _thumbnail = '';
    _videoTitle = '';
    _subTitle = '';
    _videoId = '';
  }

  void setVideoId(String videoId) {
    _videoId = videoId;
    notifyListeners();
  }

  void updateVideoIdModel() {
    setVideoId(randomNumber());
  }

  String randomNumber() {
    Random random = Random();
    int randomNumber = random.nextInt(10000);
    return randomNumber.toString();
  }

  Map<String, dynamic> getData() {
    Map<String, dynamic> videoModel = <String, dynamic>{};
    videoModel['videoId'] = _videoId;
    videoModel['videoTitle'] = _videoTitle;
    videoModel['subTitle'] = _subTitle;
    videoModel['thumbnail'] = _thumbnail;
    return videoModel;
  }
}
