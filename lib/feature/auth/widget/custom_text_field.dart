
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyTextField extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  final bool obscureText;
  final Widget? prefix;
  final TextInputType? keyboardType;
  const MyTextField({super.key,this.keyboardType,this.prefix,required this.obscureText,required this.hintText,required this.controller});

  @override
  MyTextFieldState createState() => MyTextFieldState();
}

class MyTextFieldState extends State<MyTextField> {
  final FocusNode _focusNode = FocusNode();
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoTextFormFieldRow(
      prefix: widget.prefix,
      controller:widget.controller ,
      keyboardType: widget.keyboardType,
      obscureText: widget.obscureText,
      padding: EdgeInsets.zero,
      focusNode: _focusNode,
      cursorColor: Colors.black,
      style: TextStyle(
        fontSize: 16,
        color: Colors.black,
      ),
      decoration: BoxDecoration(

        border: Border.all(
          color: _isFocused ? Colors.black : Color(0xFFD1D5DB),
          width: _isFocused?2:1,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      maxLength:widget.prefix!=null?12: 30,
      placeholder: widget.hintText,
      placeholderStyle: TextStyle(
          fontSize: 14,
          color: Color(0xFF6B7280)
      ),
    );
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }
}
