import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ButtonToggle extends StatefulWidget {
  VoidCallback tap;
  String text;
  double width;
  bool workingState;

  ButtonToggle({required this.tap, required this.width, required this.text, required this.workingState});
  _ButtonToggleState createState() => _ButtonToggleState();

}
class _ButtonToggleState extends State<ButtonToggle> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width * 0.8,
      height: widget.width * 0.12,
      padding: EdgeInsets.fromLTRB(
          widget.width * 0.048,
          widget.width * 0.024,
          widget.width * 0.048,
          widget.width * 0.024
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.deepOrange),
        color: widget.workingState ? Colors.white : Colors.deepOrange
      ),
      child: InkWell(
        child: Center(
          child: Text(
            widget.text,
            style: TextStyle(
              fontSize: widget.width * 0.035,
              color: widget.workingState ? Colors.black : Colors.white,
            ),
          ),
        ),
        onTap: () {
          setState(() {
            widget.tap();
            widget.workingState = !widget.workingState;
          });
        },
      ),
    );
  }
}