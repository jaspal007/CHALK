//To display the content of the bottom sheet

import 'package:flutter/material.dart';
import '../flutter_widgets/create_button.dart';
import '../flutter_widgets/text_field_input.dart';

class ShowBottomSheet extends StatefulWidget {
  const ShowBottomSheet({
    super.key,
    required this.scrollController,
    required this.onAddTitle,
  });
  final ScrollController scrollController;
  final Function(String title) onAddTitle;
  @override
  State<ShowBottomSheet> createState() => _ShowBottomSheetState();
}

class _ShowBottomSheetState extends State<ShowBottomSheet> {
  final TextEditingController title = TextEditingController();
  final TextEditingController description = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    title.dispose();
    description.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        color: Colors.blue[50],
        shape: BoxShape.rectangle,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Container(
              height: 5,
              width: 40,
              decoration: const BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              height: 500,
              child: ListView(
                controller: widget.scrollController,
                shrinkWrap: true,
                children: [
                  Container(
                    height: 200,
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextFieldInput(
                          textEditingController: title,
                          labelText: 'Title',
                        ),
                        Container(
                          height: 20,
                        ),
                        TextFieldInput(
                          textEditingController: description,
                          labelText: 'Description',
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 200,
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  Container(
                    height: 200,
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  Container(
                    height: 200,
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  Container(
                    height: 200,
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  Container(
                    height: 200,
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  Container(
                    height: 200,
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  Container(
                    height: 200,
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 50,
            margin: const EdgeInsets.only(bottom: 10, right: 20),
            child: ListView(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        dispose();
                      },
                      style: const ButtonStyle(
                        minimumSize: MaterialStatePropertyAll(
                          Size(100, 50),
                        ),
                        shape: MaterialStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(500),
                            ),
                          ),
                        ),
                      ),
                      child: const Text(
                        'Cancel',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ),
                    Container(
                      width: 20,
                    ),
                    CreateButton(
                      controller1: title,
                      controller2: description,
                      context: context,
                      onAddItem: widget.onAddTitle,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
