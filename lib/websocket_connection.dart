import 'package:challange_1_ui/screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class WebSocketConnection extends StatefulWidget {
  WebSocketConnection({Key key}) : super(key: key);

  @override
  _WebSocketState createState() => _WebSocketState();
}

class _WebSocketState extends State<WebSocketConnection> {
  final _channel = WebSocketChannel.connect(
    Uri.parse('ws:localhost:4000'),
  );

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _channel.stream,
      // ignore: missing_return
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          print(snapshot.data);
          if (snapshot.data == 'idle') {
            return IdleScreen();
          }
          if (snapshot.data == 'wake up') {
            return WelcomeScreen();
          }
          if (snapshot.data == 'introduction') {
            return IntroductionScreen();
          }
          if (snapshot.data == 'mission') {
            return MissionScreen();
          }
          if (snapshot.data == 'tell joke') {
            return JokeScreen();
          }
          if (snapshot.data == 'just kidding') {
            _channel.sink.add('hand gestures');
            return JustKiddingScreen();
          }
          if (snapshot.data == 'hand gestures') {
            return JustKiddingScreen();
          }
        }
        return Text('No connection to backend');
      },
    );
  }
}

class IdleScreen extends StatefulWidget {
  IdleScreen({Key key}) : super(key: key);

  @override
  _IdleScreenState createState() => _IdleScreenState();
}

class _IdleScreenState extends State<IdleScreen> {
  @override
  Widget build(BuildContext context) {
    return Screen(text: 'Zzz Zzz Zzzz....', assetName: 'sleeping.png');
  }
}

class WelcomeScreen extends StatefulWidget {
  WelcomeScreen({Key key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Screen(
        text: 'Hello, there! Welcome to [Location] Information Kiosk',
        assetName: 'happy.png');
  }
}

class IntroductionScreen extends StatefulWidget {
  IntroductionScreen({Key key}) : super(key: key);

  @override
  _IntroductionScreenState createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {
  @override
  Widget build(BuildContext context) {
    return Screen(
        text:
            'I’m your friendly neighbourhood egg, Eggcelsior, and I was installed here to remove biases from translation and recruit the best agents for my TOP SECRET missions to help form a more inclusive world.',
        assetName: 'happy.png');
  }
}

class MissionScreen extends StatelessWidget {
  const MissionScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Screen(
        text: 'The missions, should you decide to accept them, are as follows:',
        assetName: 'mission_offer.png');
  }
}

class JokeScreen extends StatelessWidget {
  const JokeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Screen(
        text: 'This kiosk will self-destruct in five seconds.',
        assetName: 'joke.png');
  }
}

class JustKiddingScreen extends StatelessWidget {
  const JustKiddingScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Screen(text: 'JUST KIDDING!', assetName: 'justkidding.png');
  }
}
