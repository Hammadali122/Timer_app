import 'package:flutter/material.dart';
import 'button_wighet.dart';
import 'dart:async';




class Screen1 extends StatefulWidget {
  @override

  _Screen1State createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {

  bool isPause = false;
  bool isRunning = false;



  @override
  int seconds=maxSeconds;

  static const maxSeconds = 60;

  Timer timer;

  void startTimer({bool reset}){
    timer = Timer.periodic(Duration(seconds: 1),(_){
      if(seconds>0)
      setState(() {
        seconds--;
      });
      else{
        stopTimer(reset: false);
      }
    });
  }
  void resetTimer() {
    setState(() {
      seconds=maxSeconds;
    });
  }
  void stopTimer({bool reset =true}) {
    if(reset){
      resetTimer();
    }
    setState(() {
      timer?.cancel();
    });
  }



  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.greenAccent,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              nameTimer(),
              SizedBox(height: 80,),
              buildButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildButton() {

    return isRunning?
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ButtonWidget(
              text: !isPause ?'pause':'resume',
              onclick: () {
                if (isPause) {
                  startTimer();
                  setState(() {
                    isPause = false;

                  });
                } else {
                  stopTimer(reset: false);
                  setState(() {
                    isPause = true;

                  });
                }
              }),
            SizedBox(width: 9,),
            ButtonWidget(
              text: 'cancel',
              onclick:
                stopTimer,
            ),
          ],
        )
    : ButtonWidget(
      text: "start timer",
      onclick: (){
        setState(() {
          startTimer();
          isRunning = true;
        });
      },
    );
  }
  Widget nameTimer(){
    return
      SizedBox(
        height: 200,
        width: 200,
        child:Stack(
          fit: StackFit.expand,
          children: <Widget>[
            CircularProgressIndicator(
              value:1- seconds/maxSeconds,
              backgroundColor: Colors.blue,
              strokeWidth: 20,
              valueColor: AlwaysStoppedAnimation(Colors.white),
            ),
            Center(child: buildTimer(),),
          ],
        )
    );
  }

  Widget buildTimer() {
    return Text('$seconds',
      style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontSize: 80
      ),);
  }
}


