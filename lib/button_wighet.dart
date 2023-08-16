import 'package:flutter/material.dart';



class ButtonWidget extends StatefulWidget {
  final String text;
  final Function onclick;

  const ButtonWidget({ this.text, this.onclick});

  @override
  _ButtonWidgetState createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  @override

  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: FlatButton(
        color: Colors.white,
        onPressed:(widget.onclick) ,
      child: Text(widget.text,style: TextStyle(color: Colors.black),),),
    );
  }

}
