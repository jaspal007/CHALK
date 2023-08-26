//global variable resources for the file
import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:list_view/widgets/app_widgets/show_bottom_sheet.dart';

import 'reminder.dart';
import 'package:intl/intl.dart';

final dateFormatter = DateFormat.yMMMd();
final timeFormatter = DateFormat.Hm();
Reminder item = Reminder(
  title: "Reminder1",
  date: DateTime.now(),
  time: TimeOfDay.now().toString(),
  description: "description",
  timeStamp: DateTime.timestamp(),
);

PriorityQueue<Reminder> priorityQueue =
    PriorityQueue<Reminder>((a, b) => a.timeStamp.compareTo(b.timeStamp));


void showModalSheetAdd(context, onAdd) {
  showFlexibleBottomSheet(
    draggableScrollableController: DraggableScrollableController(),
    isSafeArea: true,
    anchors: [0, 0.4, 0.9],
    initHeight: 0.4,
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
    builder: (context, scrollController, bottomSheetOffset) => ShowBottomSheet(
      scrollController: scrollController,
      onAddReminder: onAdd,
    ),
  );
}


void showModalSheetUpdate(context, onUpdate, reminder) {
  showFlexibleBottomSheet(
    draggableScrollableController: DraggableScrollableController(),
    isSafeArea: true,
    anchors: [0, 0.4, 0.9],
    initHeight: 0.4,
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
    builder: (context, scrollController, bottomSheetOffset) => ShowBottomSheet(
      scrollController: scrollController,
      onUpdateReminder: onUpdate,
      reminder: reminder,
      toChange: true,
    ),
  );
}
