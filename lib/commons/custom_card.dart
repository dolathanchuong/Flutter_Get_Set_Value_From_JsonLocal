import 'package:flutter/material.dart';
import '../commons/utils.dart';

// 연관 동영상 목록
class CustomRelatedList extends StatelessWidget {
  const CustomRelatedList({
    required Key key,
    required this.thumbnail,
    required this.title,
    required this.subtitle,
    required this.author,
    required this.viewCount,
    required this.readDuration,
  }) : super(key: key);

  final String thumbnail;
  final String title;
  final String subtitle;
  final String author;
  final String viewCount;
  final String readDuration;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: SizedBox(
        height: 85,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Image.network(
                thumbnail,
                width: 150,
                height: 86,
                fit: BoxFit.fitWidth,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 0.0, 2.0, 0.0),
                child: _ArticleDescription(
                  title: title,
                  author: author,
                  viewCount: Utils.numberGrouping(int.parse(viewCount)),
                  readDuration: readDuration,
                  key: UniqueKey(),
                  subtitle: 'banhmi',
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// 연관 동영상 카드 디자인
class _ArticleDescription extends StatelessWidget {
  const _ArticleDescription({
    required Key key,
    required this.title,
    required this.subtitle,
    required this.author,
    required this.viewCount,
    required this.readDuration,
  }) : super(key: key);

  final String title;
  final String subtitle;
  final String author;
  final String viewCount;
  final String readDuration;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              author,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 12.0,
                color: Colors.grey,
              ),
            ),
            Text(
              '조회수 $viewCount 회',
              style: const TextStyle(
                fontSize: 12.0,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
