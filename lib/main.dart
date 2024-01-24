import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'commons/app.dart';
import 'dart:async';
import 'widgets/player/model/simple_player_model.dart';

void main() => runApp(const FlutterTube());

class FlutterTube extends StatelessWidget {
  const FlutterTube({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.black,
    ));
    return ChangeNotifierProvider(
      create: (context) => SimplePlayerControlModel.empty(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: AppPage(),
      ),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  startTime() async {
    var duration = const Duration(seconds: 2);
    return Timer(duration, navigationPage);
  }

  void navigationPage() {
    Navigator.of(context).pushReplacementNamed('/AppPage');
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(40, 40, 40, 1.0),
      body: Center(
        child: Image.asset(
          'assets/images/flutter1.png',
          width: 100,
          height: 80,
        ),
      ),
    );
  }
}
