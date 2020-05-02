import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class TextComposer extends StatefulWidget {

  TextComposer(this.sendMessage);

  final Function({String text, File imgFile}) sendMessage;

  @override
  _TextComposerState createState() => _TextComposerState();
}

class _TextComposerState extends State<TextComposer> {
  final TextEditingController _textController = new TextEditingController();
  bool _isComposing = false;

  void _resetInputText(){
    _textController.clear();
    setState(() {
      _isComposing = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: Color(0xFFeeeeee),
        borderRadius: BorderRadius.all(Radius.circular(100)),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: <Widget>[
          IconButton(
              icon: Icon(Icons.photo_camera),
              onPressed: ()  async {
                final File imgFile = await ImagePicker.pickImage(source: ImageSource.camera);
                if(imgFile == null){
                  return;
                }else{
                  widget.sendMessage(text:_textController.text, imgFile:imgFile);
                }
              }
          ),
          Expanded(
              child: TextField(
                controller: _textController,
            decoration:
                InputDecoration.collapsed(hintText: "Type Your message"),
            onChanged: (text) {
              setState(() {
                _isComposing = text.isNotEmpty;
              });
            },
            onSubmitted: (text) {
              widget.sendMessage(text:text);
              _resetInputText();
            },
          )),
          IconButton(
            icon: Icon(Icons.send, color: Color(0xFFEA4C89)),
            onPressed: _isComposing ? () {
              widget.sendMessage(text:_textController.text);
              _resetInputText();
            } : null,
          ),
        ],
      ),
    );
  }
}
