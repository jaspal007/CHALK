import 'package:flutter/material.dart';

class TextFieldInput extends StatefulWidget {
  final TextEditingController textEditingController;
  final String labelText;
  const TextFieldInput({
    super.key,
    required this.textEditingController,
    required this.labelText,
  });

  @override
  State<TextFieldInput> createState() => _TextFieldInputState();
}

class _TextFieldInputState extends State<TextFieldInput> {
  get _controller => widget.textEditingController;
  get _label => widget.labelText;
  bool _showClearButton = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        _showClearButton = _controller.text.isNotEmpty;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      decoration: InputDecoration(
        suffixIcon: _showClearButton
            ? IconButton(
                icon: const Icon(Icons.clear),
                onPressed: () {
                  setState(() {
                    _controller.clear();
                    _showClearButton = false;
                  });
                },
              )
            : null,
        labelText: _label,
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(500),
          ),
          borderSide: BorderSide(
            strokeAlign: 1,
            color: Colors.indigo.shade900,
            width: 4,
            style: BorderStyle.solid,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(500),
          ),
          borderSide: BorderSide(
            strokeAlign: 1,
            color: Colors.indigo.shade900,
            width: 4,
            style: BorderStyle.solid,
          ),
        ),
      ),
    );
  }
}
