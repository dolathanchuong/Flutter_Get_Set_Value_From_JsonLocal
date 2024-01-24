import 'package:flutter/material.dart';
import 'package:flutter_icon_data/flutter_icon_data.dart';
import '../commons/app_dialog.dart';

class AppAlarmCard extends StatefulWidget {
  final String id;
  final String title;
  final String publishDate;
  final String thumbnails;

  const AppAlarmCard(this.id, this.title, this.publishDate, this.thumbnails,
      {super.key});

  @override
  AppAlarmState createState() => AppAlarmState();
}

class AppAlarmState extends State<AppAlarmCard> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 8,
          child: ListTile(
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
            subtitle: Text(
              widget.publishDate,
              style: const TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Container(
            height: 50,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(widget.thumbnails),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: InkWell(
            child: const Icon(
              MaterialIcons.more_vert,
              color: Colors.white,
            ),
            onTap: () => AppDialog.settingModalBottomSheet(context),
          ),
        )
      ],
    );
  }
}
