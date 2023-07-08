//custom 'create' button for the bottom sheet to save the content of the textfields

import 'package:flutter/material.dart';

class CreateButton extends StatefulWidget {
  final TextEditingController controller1;
  final TextEditingController controller2;
  final BuildContext context;
  final Function(String title) onAddItem;
  const CreateButton({
    super.key,
    required this.controller1,
    required this.controller2,
    required this.context,
    required this.onAddItem,
  });

  @override
  State<CreateButton> createState() => _CreateButtonState();
}

class _CreateButtonState extends State<CreateButton> {
  TextEditingController get _controller1 => widget.controller1;
  TextEditingController get _controller2 => widget.controller2;
  BuildContext get _context => widget.context;

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
        widget.onAddItem(_controller1.text);
        _controller1.clear();
        _controller2.clear();
        Navigator.pop(_context);
      },
      child: const Text(
        'Create',
        style: TextStyle(fontSize: 15),
      ),
    );
  }
}
