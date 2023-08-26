//To display the content of the bottom sheet

import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:list_view/resources/global_variable.dart';
import '../../resources/reminder.dart';
import '../flutter_widgets/text_field_input.dart';

class ShowBottomSheet extends StatefulWidget {
  ShowBottomSheet({
    super.key,
    required this.scrollController,
    this.onAddReminder,
    this.onUpdateReminder,
    this.reminder,
    this.toChange = false,
  });
  final ScrollController scrollController;
  Function(Reminder reminder)? onAddReminder;
  Function(Reminder oldItem, Reminder newItem)? onUpdateReminder;
  final Reminder? reminder;
  final bool toChange;
  @override
  State<ShowBottomSheet> createState() => _ShowBottomSheetState();
}

class _ShowBottomSheetState extends State<ShowBottomSheet> {
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    title.dispose();
    description.dispose();
  }

  DateTime date = DateTime.now();
  DateTime time = DateTime.now();
  TimeOfDay timeOfDay = TimeOfDay.now();

  // void addNewReminder(Reminder reminder) {
  //   widget.onAddReminder(reminder);
  // }

  @override
  Widget build(BuildContext context) {
    title = TextEditingController(
        text: (widget.toChange) ? widget.reminder!.title : title.text);
    description = TextEditingController(
        text: (widget.toChange)
            ? widget.reminder!.description
            : description.text);

    date = (widget.toChange) ? widget.reminder!.date : date;

    String selectedDate = dateFormatter.format(date);
    String? selectedTime;
    if (Platform.isAndroid) selectedTime = timeOfDay.format(context);
    if (Platform.isIOS) selectedTime = timeFormatter.format(time);
    // void setDate(DateTime date) {
    //   setState(() {
    //     selectedDate = dateFormatter.format(date);
    //     print(selectedDate);
    //   });
    // }

    // void setTimeAndroid(TimeOfDay time) {
    //   setState(() {
    //     selectedTime = time.format(context);
    //     print(selectedTime);
    //   });
    // }

    // void setTimeiOS(DateTime time) {
    //   setState(() {
    //     selectedTime = timeFormatter.format(time);
    //     print(selectedTime);
    //   });
    // }

    return Container(
      padding: EdgeInsets.only(
          top: 10, bottom: MediaQuery.of(context).viewInsets.bottom + 16),
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
              margin: const EdgeInsets.symmetric(vertical: 10),
              height: 500,
              child: ListView(
                controller: widget.scrollController,
                shrinkWrap: true,
                children: [
                  Container(
                    height: 200,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    padding: const EdgeInsets.all(20),
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
                    height: 250,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Column(
                      children: [
                        if (Platform.isIOS)
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                height: 100,
                                width: MediaQuery.of(context).size.width - 150,
                                child: Column(
                                  children: [
                                    Text(
                                      selectedDate,
                                    ),
                                    Expanded(
                                      child: CupertinoDatePicker(
                                        initialDateTime: date,
                                        mode: CupertinoDatePickerMode.date,
                                        onDateTimeChanged: (val) {
                                          setState(() {
                                            if (widget.toChange) {
                                              widget.reminder!.date = val;
                                            }
                                            date = val;
                                          });
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 50,
                              ),
                              SizedBox(
                                height: 60,
                                width: MediaQuery.of(context).size.width - 250,
                                child: Row(
                                  children: [
                                    Text(
                                      selectedTime!,
                                    ),
                                    Expanded(
                                      child: CupertinoDatePicker(
                                        use24hFormat: true,
                                        mode: CupertinoDatePickerMode.time,
                                        initialDateTime: time,
                                        onDateTimeChanged: (val) {
                                          setState(() {
                                            time = val;
                                          });
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        if (Platform.isAndroid)
                          Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    selectedDate,
                                    style: const TextStyle().copyWith(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  IconButton(
                                    onPressed: () async {
                                      DateTime? val = await showDatePicker(
                                        context: context,
                                        initialDate: date,
                                        firstDate: DateTime(2000),
                                        lastDate: DateTime(2100),
                                      );
                                      print(val.toString());
                                      if (val == null) return;
                                      setState(() {
                                        print('execute');
                                        if (widget.toChange) {
                                          widget.reminder!.date = val;
                                        }
                                        date = val;
                                        print(date.toString());
                                      });
                                      //setDate(date);
                                    },
                                    icon: const Icon(
                                      Icons.calendar_month_outlined,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(selectedTime!),
                                  IconButton(
                                      onPressed: () async {
                                        TimeOfDay? val = await showTimePicker(
                                          context: context,
                                          initialTime: timeOfDay,
                                        );
                                        if (val == null) return;
                                        setState(() {
                                          timeOfDay = val;
                                        });
                                      },
                                      icon: const Icon(Icons.timer))
                                ],
                              )
                            ],
                          ),
                      ],
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
                    ElevatedButton(
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
                        Reminder item = Reminder(
                            title: (title.text.trim().isNotEmpty)
                                ? title.text.trim()
                                : "NEW REMINDER",
                            description: description.text.trim(),
                            date: date,
                            time: selectedTime!,
                            timeStamp: date);
                        if (!widget.toChange) {
                          widget.onAddReminder!(item);
                        } else {
                          widget.onUpdateReminder!(widget.reminder!, item);
                        }
                        Navigator.pop(context);
                      },
                      child: Text(
                        (!widget.toChange) ? 'Create' : 'Update',
                        style: const TextStyle(fontSize: 15),
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
}
