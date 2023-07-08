//function addition to the Floating Action Button to display the bottom sheet

import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:list_view/widgets/app_widgets/show_bottom_sheet.dart';

class CreateNote extends StatefulWidget {
  const CreateNote({
    super.key,
    required this.onAdd,
  });
  final Function(String title) onAdd;

  @override
  State<CreateNote> createState() => _CreateNoteState();
}

class _CreateNoteState extends State<CreateNote> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.large(
      elevation: 12,
      onPressed: () {
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
          builder: (context, scrollController, bottomSheetOffset) =>
              ShowBottomSheet(
            scrollController: scrollController,
            onAddTitle: widget.onAdd,
          ),
        );
      },
      child: const Icon(Icons.create),
    );
  }
}
