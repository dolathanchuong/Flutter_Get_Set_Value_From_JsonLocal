class RelatedVideo {
  final dynamic id;
  final String title;
  final String channelTitle;
  final dynamic thumbnails;
  final String duration;
  final String viewCount;

  RelatedVideo({
    this.id,
    required this.title,
    required this.channelTitle,
    this.thumbnails,
    required this.duration,
    required this.viewCount,
  });

  factory RelatedVideo.fromJson(Map<String, dynamic> json) {
    return RelatedVideo(
      id: json['id']['videoId'],
      title: json['snippet']['title'],
      channelTitle: json['snippet']['channelTitle'],
      thumbnails: json['snippet']['thumbnails']['medium']['url'],
      duration: json['duration'],
      viewCount: json['viewCount'],
    );
  }
}
