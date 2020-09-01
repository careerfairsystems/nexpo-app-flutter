import 'package:flutter/material.dart';

class FilledButton extends StatelessWidget {
  final String _buttonText;
  final TextStyle _style;
  final Color _color;
  Function _onPress;

  FilledButton(this._buttonText, this._style, this._color, this._onPress);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      padding: EdgeInsets.symmetric(vertical: 10),
      elevation: 10,
      splashColor: Colors.white,
      child: SizedBox(
        width: double.infinity,
        child: Text(
          _buttonText,
          style: _style,
          textAlign: TextAlign.center,
        ),
      ),
      color: _color,
      onPressed: () => _onPress(),
    );
  }
}
