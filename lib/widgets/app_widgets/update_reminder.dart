import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:list_view/resources/reminder.dart';

class UpdateReminder extends StatefulWidget {
  final Reminder reminder;
  // final int index;
  final Function(Reminder oldItem, Reminder newItem) onUpdate;
  const UpdateReminder({
    super.key,
    required this.reminder,
    // required this.index,
    required this.onUpdate,
  });

  @override
  State<UpdateReminder> createState() => _UpdateReminderState();
}

class _UpdateReminderState extends State<UpdateReminder> {
  Reminder get _reminder => widget.reminder;
  @override
  Widget build(BuildContext context) {
    final TextEditingController title =
        TextEditingController(text: _reminder.title);
    final TextEditingController description =
        TextEditingController(text: _reminder.description);
    DateTime date = _reminder.date;
    return AlertDialog(
      elevation: 5,
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            Reminder item = Reminder(
              title: title.text,
              date: _reminder.date,
              time: _reminder.time,
              timeStamp: _reminder.timeStamp,
            );
            print('Update');
            widget.onUpdate(_reminder, item);
            Navigator.pop(context);
          },
          child: const Text('Update'),
        ),
      ],
      title: const Text('Update'),
      content: SingleChildScrollView(
        child: Container(
          height: 250,
          child: Column(
            children: [
              TextField(
                controller: title,
              ),
              TextField(
                controller: description,
              ),
              Container(
                height: 80,
                child: Expanded(
                  child: CupertinoDatePicker(
                    initialDateTime: _reminder.date,
                    mode: CupertinoDatePickerMode.date,
                    onDateTimeChanged: ((value) {
                      setState(() {
                        date = value;
                      });
                    }),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
