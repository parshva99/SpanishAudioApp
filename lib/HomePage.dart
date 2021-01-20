import 'package:flutter/material.dart';
import 'NumberAudio.dart';
import 'package:audioplayers/audio_cache.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AudioCache audioPlayer = AudioCache();

  List<NumberAudio> numberList = [
    NumberAudio("one.wav", Colors.purple, "One"),
    NumberAudio("two.wav", Colors.indigo, "Two"),
    NumberAudio("three.wav", Colors.blue, "Three"),
    NumberAudio("four.wav", Colors.green, "Four"),
    NumberAudio("five.wav", Colors.yellow, "Five"),
    NumberAudio("six.wav", Colors.orange, "Six"),
    NumberAudio("seven.wav", Colors.red, "Seven"),
    NumberAudio("eight.wav", Colors.blueGrey, "Eight"),
    NumberAudio("nine.wav", Colors.lightGreen, "Nine"),
    NumberAudio("ten.wav", Colors.deepPurple, "Ten"),
  ];

  play(String uri) {
    audioPlayer.play(uri);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Spanish Audio Numbers'),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: [
              Image(
                image: AssetImage("images/logo.png"),
              ),
              Expanded(
                child: GridView.builder(
                  padding: EdgeInsets.all(20),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: numberList.length,
                  itemBuilder: (context, i) => SizedBox(
                    width: 100,
                    height: 50,
                    child: RaisedButton(
                      onPressed: () {
                        play(numberList[i].audioUri);
                      },
                      color: numberList[i].buttonColor,
                      child: Text(
                        numberList[i].buttonText,
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
