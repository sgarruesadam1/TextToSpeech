import 'package:flutter/material.dart';
import 'package:flutter_text_to_speech/flutter_text_to_speech.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Text To Speech',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Text To Speech'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  VoiceController _voiceController;
  final myController = TextEditingController();

  String text =
      'This is an example tutorial of using text to speech in a flutter application! The example is provided on fluttercentral website.';

  @override
  void initState() {
    _voiceController = FlutterTextToSpeech.instance.voiceController();

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    myController.dispose();
    _voiceController.stop();
  }

  _playVoice() {
    _voiceController.init().then((_) {
      _voiceController.speak(
        myController.text,
        VoiceControllerOptions(),
      );
    });
  }

  _stopVoice() {
    _voiceController.stop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(91, 255, 123, 1),
      appBar: AppBar(
        shape: Border.all(
          color: Colors.black,
          width: 5.0,
        ),
        title: Text(
          widget.title,
          textAlign: TextAlign.center,
          style:
              TextStyle(color: Color.fromRGBO(91, 255, 123, 1), fontSize: 30),
        ),
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              textAlign: TextAlign.center,
              controller: myController,
            ),
            SizedBox(
              height: 30,
            ),
            RaisedButton(
              onPressed: _playVoice,
              color: Colors.white,
              child: Text('Play Voice',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  )),
            ),
            RaisedButton(
              onPressed: _stopVoice,
              color: Colors.white,
              child: Text('Stop Voice',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  )),
            ),
            SizedBox(
              height: 10,
            ),
            Icon(
              Icons.music_video,
              size: 50,
            )
          ],
        ),
      ),
    );
  }
}
