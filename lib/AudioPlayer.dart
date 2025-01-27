import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

// Stateful widget to handle audio playback.
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState(); // State creation.
}

class _MyAppState extends State<MyApp> {
  final AudioPlayer audioPlayer = AudioPlayer(); // Audio player instance.
  final AudioPlayer audioPlayerOnline = AudioPlayer();

  @override
  void dispose() {
    audioPlayer.dispose();
    audioPlayerOnline.dispose(); // Release audio player resources.
    super.dispose();
  }

  // Plays an audio file.
  void playAudio() async {
    await audioPlayer.play(AssetSource('audio/sound.mp3'));
  }

  // Stops the audio playback.
  void stopAudio() async {
    await audioPlayer.stop();
  }

  // Plays audio online
  void playAudioOnline() async {
    await audioPlayerOnline.play(UrlSource(
        'https://raw.githubusercontent.com/Flutter-Tutorial-Website/SimpleFlutterAudioPlayer/master/assets/audio/sound.mp3'));
  }

  // Stops the audio playback online.
  void stopAudioOnline() async {
    await audioPlayerOnline.stop();
  }

  @override
  Widget build(BuildContext context) {
    // Builds the app's UI.
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Center(
            child: Text(
              'My Audio Player',
              style: GoogleFonts.wallpoet(color: Colors.white),
            ),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      ElevatedButton(
                          onPressed: playAudioOnline,
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.amber),
                          child: const Text('Play Audio Online')),
                      SizedBox(
                        height: 15,
                      ),
                      ElevatedButton(
                          onPressed: stopAudioOnline,
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.amber),
                          child: const Text('Stop Audio Online')),
                    ],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    children: [
                      ElevatedButton(
                          onPressed: playAudio,
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.amber),
                          child: const Text('Play Audio')),
                      SizedBox(
                        height: 15,
                      ),
                      ElevatedButton(
                          onPressed: stopAudio,
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.amber),
                          child: const Text('Stop Audio')),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
