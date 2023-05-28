import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter/material.dart';

class CreateNote extends StatefulWidget {
  const CreateNote({super.key});

  @override
  State<CreateNote> createState() => _CreateNoteState();
}

final title = TextEditingController();
final description = TextEditingController();

class _CreateNoteState extends State<CreateNote> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    bool _clearButton = false;

    void initState() {
      super.initState();
      title.addListener(
        () {
          setState(() {
            _clearButton = title.text.isNotEmpty;
          });
        },
      );
    }

    Widget _getClearButton() {
      if (!_clearButton) {
        return const Icon(Icons.abc);
      }
      return IconButton(
        onPressed: () => title.clear(),
        icon: const Icon(Icons.clear_rounded),
      );
    }

    void dispose() {
      title.dispose();
      description.dispose();
    }

    void clear() {
      title.clear();
      description.clear();
    }

    return FloatingActionButton.large(
      backgroundColor: Colors.blue[50],
      elevation: 12,
      splashColor: Colors.blue,
      onPressed: () {
        showFlexibleBottomSheet(
          isSafeArea: true,
          anchors: [0, 0.38, 0.9],
          initHeight: 0.38,
          maxHeight: 0.9,
          bottomSheetColor: Colors.transparent,
          decoration: const BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          context: context,
          builder: _buildBottomSheet,
        );
      },
      child: Icon(Icons.create, color: Colors.indigo[900]),
    );
  }
}

Widget _buildBottomSheet(
  BuildContext context,
  ScrollController scrollController,
  double bottomSheetOffset,
) {
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
              controller: scrollController,
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
                      TextField(
                        controller: title,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            splashRadius: 20,
                            onPressed: () => title.clear(),
                            icon: const Icon(Icons.clear_rounded),
                          ),
                          labelText: 'Title',
                          enabledBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(500),
                            ),
                            borderSide: BorderSide(
                              strokeAlign: 1,
                              color: Colors.blue,
                              width: 4,
                              style: BorderStyle.solid,
                            ),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(500),
                            ),
                            borderSide: BorderSide(
                              strokeAlign: 1,
                              color: Colors.blue,
                              width: 4,
                              style: BorderStyle.solid,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 20,
                      ),
                      TextField(
                        controller: title,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            splashRadius: 20,
                            onPressed: () => title.clear(),
                            icon: const Icon(Icons.clear_rounded),
                          ),
                          labelText: 'Title',
                          enabledBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(500),
                            ),
                            borderSide: BorderSide(
                              strokeAlign: 1,
                              color: Colors.blue,
                              width: 4,
                              style: BorderStyle.solid,
                            ),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(500),
                            ),
                            borderSide: BorderSide(
                              strokeAlign: 1,
                              color: Colors.blue,
                              width: 4,
                              style: BorderStyle.solid,
                            ),
                          ),
                        ),
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
                      title.clear();
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
                        color: Colors.blue,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  Container(
                    width: 20,
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      minimumSize: const MaterialStatePropertyAll(
                        Size(100, 50),
                      ),
                      shape: MaterialStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(500),
                        ),
                      ),
                    ),
                    onPressed: () => 2 + 3,
                    child: const Text(
                      'Create',
                      style: TextStyle(fontSize: 15),
                    ),
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
