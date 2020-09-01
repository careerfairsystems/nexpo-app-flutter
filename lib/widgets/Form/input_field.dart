import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String _hintText;
  final Color _mainColor;
  final Color _secondaryColor;
  final Color _errorColor;
  final bool _hideText;
  final String _emptyMessage;

  InputField(
    this._hintText,
    this._mainColor,
    this._secondaryColor,
    this._errorColor,
    this._hideText,
    this._emptyMessage,
  );

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: _hintText,
        labelText: _hintText,
        fillColor: _mainColor,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: _mainColor,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(
            25.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: _secondaryColor,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(
            25.0,
          ),
        ),
        errorStyle: TextStyle(
          color: _errorColor,
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: _errorColor,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(
            25.0,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: _errorColor,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(
            25.0,
          ),
        ),
      ),
      obscureText: _hideText,
      validator: (value) {
        if (value.isEmpty) {
          return _emptyMessage;
        }
        return null;
      },
    );
  }
}
