import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:list_view/global_variable.dart';

class CreateButton extends StatefulWidget {
  TextEditingController controller;
  BuildContext context;
  CreateButton({
    super.key,
    required this.controller,
    required this.context,
  });

  @override
  State<CreateButton> createState() => _CreateButtonState();
}

class _CreateButtonState extends State<CreateButton> {
  get _controller => widget.controller;
  get _context => widget.context;

  void listItems(String values) {
    setState(() {
      addItem(values);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
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
      onPressed: () {
        listItems(widget.controller.text);
        widget.controller.clear();
        Navigator.pop(_context);
      },
      child: const Text(
        'Create',
        style: TextStyle(fontSize: 15),
      ),
    );
  }
}
