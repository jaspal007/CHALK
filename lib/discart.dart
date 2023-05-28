import 'package:flutter/material.dart';
import 'global_variable.dart';
import 'dart:ui';

class PopUp extends StatefulWidget {
  const PopUp({super.key});

  @override
  State<PopUp> createState() => _PopUpState();
}

class _PopUpState extends State<PopUp> {
  @override
  Widget build(BuildContext context) {
    final text1 = TextEditingController();
    final text2 = TextEditingController();

    @override
    void dispose() {
      text1.dispose();
      text2.dispose();
    }

    void printText() {
      print('the text is ${text1.text}');
    }

    String content() {
      String text = 'hi';
      setState(() {
        text = text1.text;
      });
      return text;
    }

    return AlertDialog(
      insetPadding: const EdgeInsets.symmetric(
        vertical: 230,
        horizontal: 1,
      ),
      shape: ContinuousRectangleBorder(
        side: const BorderSide(
          color: Colors.blue,
          width: 5,
        ),
        borderRadius: BorderRadius.circular(50),
      ),
      content: Column(
        children: [
          TextField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(500),
                ),
              ),
              labelText: 'Text 1',
              hintText: 'Text One',
            ),
            controller: text1,
          ),
          TextField(
            textAlign: TextAlign.center,
            readOnly: true,
            controller: text1,
            decoration: const InputDecoration(
              border: InputBorder.none,
            ),
          ),
          TextField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(500),
                ),
              ),
              labelText: 'Text 2',
              hintText: 'Text Two',
            ),
            controller: text2,
          ),
          TextField(
            textAlign: TextAlign.center,
            readOnly: true,
            controller: text2,
            decoration: const InputDecoration(
              border: InputBorder.none,
            ),
          ),
        ],
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            setState(() {
              if (text1.text.isNotEmpty) {
                list.add(text1.text);
              }
            });
            debugPrint('${list.length}');
            text1.clear();
            debugPrint('Submit button clicked!');
          },
          style: ElevatedButton.styleFrom(
            shape: const StadiumBorder(),
          ),
          child: const Text(
            'Submit',
            style: TextStyle(fontSize: 15),
          ),
        ),
      ],
    );
  }
}
