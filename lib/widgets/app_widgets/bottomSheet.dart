//function addition to the Floating Action Button to display the bottom sheet

// import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:list_view/resources/global_variable.dart';
// import 'package:list_view/widgets/app_widgets/show_bottom_sheet.dart';

import '../../resources/reminder.dart';

class CreateReminder extends StatefulWidget {
  const CreateReminder({
    super.key,
    required this.onAdd,
  });
  final Function(Reminder reminder) onAdd;

  @override
  State<CreateReminder> createState() => _BottomSheetState();
}

class _BottomSheetState extends State<CreateReminder>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.large(
      elevation: 12,
      onPressed: () {
        return showModalSheetAdd(context, widget.onAdd);
      },
      child: const Icon(Icons.create),
    );
  }
}
