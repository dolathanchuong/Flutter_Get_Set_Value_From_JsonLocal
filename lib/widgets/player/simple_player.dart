import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './model/simple_player_model.dart';

class SimplePlayerWidget extends StatefulWidget {
  const SimplePlayerWidget({super.key});

  @override
  SimplePlayerState createState() => SimplePlayerState();
}

class SimplePlayerState extends State<SimplePlayerWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // SimplePlayerControlModel 을 가져옴
    final myModel = Provider.of<SimplePlayerControlModel>(context);
    if (myModel.videoId != "") {
      return Scaffold(
        body: Row(
          children: <Widget>[
            Flexible(
              fit: FlexFit.loose,
              flex: 1,
              child: Container(
                color: Colors.blue,
                height: 50,
                child: TextButton(
                  onPressed: () => myModel.updateVideoIdModel(),
                  child: const Text('Set VideoId'),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                  color: Colors.red,
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        myModel.videoId,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ],
                  )),
            ),
          ],
        ),
      );
    } else {
      return const SizedBox();
    }
  }
}
