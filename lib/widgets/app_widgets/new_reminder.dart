//custom 'create' button for the bottom sheet to save the content of the textfields

import 'package:flutter/material.dart';
import 'package:list_view/resources/reminder.dart';

import '../../resources/global_variable.dart';

class NewReminder extends StatefulWidget {
  final TextEditingController titile;
  final TextEditingController description;
  final DateTime date;
  final String time;
  //final DateTime timeStamp;
  final BuildContext context;
  final Function(Reminder reminder) onAddItem;
  const NewReminder({
    super.key,
    required this.titile,
    required this.description,
    required this.date,
    required this.time,
    //required this.timeStamp,
    required this.context,
    required this.onAddItem,
  });

  @override
  State<NewReminder> createState() => _NewReminderState();
}

class _NewReminderState extends State<NewReminder> {
  TextEditingController get _title => widget.titile;
  TextEditingController get _description => widget.description;
  DateTime get _date => widget.date;
  String get _time => widget.time;
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
        widget.onAddItem(
          Reminder(
            title: _title.text,
            date: _date,
            time: _time,
            description: _description.text,
            timeStamp: _date,
          ),
        );
        for (Reminder item in priorityQueue.toList()) {
          print(item.title);
        }
        _title.clear();
        _description.clear();
        Navigator.pop(_context);
      },
      child: const Text(
        'Create',
        style: TextStyle(fontSize: 15),
      ),
    );
  }
}
