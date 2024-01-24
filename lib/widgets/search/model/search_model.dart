class Search {
  final dynamic id;
  final String title;
  final String channelTitle;
  final dynamic thumbnails;
  final String duration;
  final String viewCount;
  final String likeCount;
  final String dislikeCount;
  final String publishDate;

  Search({
    this.id,
    required this.title,
    required this.channelTitle,
    required this.thumbnails,
    required this.duration,
    required this.viewCount,
    required this.likeCount,
    required this.dislikeCount,
    required this.publishDate,
  });

  factory Search.fromJson(Map<String, dynamic> json) {
    return Search(
        id: json['id']['videoId'],
        title: json['snippet']['title'],
        channelTitle: json['snippet']['channelTitle'],
        thumbnails: json['snippet']['thumbnails']['medium']['url'],
        duration: json['duration'],
        viewCount: json['viewCount'],
        likeCount: json['likeCount'],
        dislikeCount: json['dislikeCount'],
        publishDate: json['snippet']['publishedAt']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> searchModel = <String, dynamic>{};
    searchModel['id'] = id;
    searchModel['title'] = title;
    searchModel['channelTitle'] = channelTitle;
    searchModel['thumbnails'] = thumbnails;
    searchModel['duration'] = duration;
    searchModel['viewCount'] = viewCount;
    searchModel['likeCount'] = likeCount;
    searchModel['dislikeCount'] = dislikeCount;
    searchModel['publishDate'] = publishDate;
    return searchModel;
  }
}
