//widget containing the Scaffold to display the list of content
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:list_view/resources/reminder.dart';
import 'package:list_view/widgets/flutter_widgets/drawer.dart';
import 'widgets/app_widgets/bottomSheet.dart';
import 'resources/global_variable.dart';

class ShowList extends StatefulWidget {
  const ShowList({super.key});

  @override
  State<ShowList> createState() => _ShowListState();
}

int currentIndex = 0;

class _ShowListState extends State<ShowList> {
  void onAddItem(Reminder item) {
    final newReminder = item;
    setState(() {
      priorityQueue.add(newReminder);
      // reminder.add(newReminder);
    });
  }

  void onRemoveReminder(Reminder item) {
    //final reminderIndex = reminder.indexOf(item);
    setState(() {
      priorityQueue.remove(item);
    });

    final SnackBar snackBar = SnackBar(
      content: Text('${item.title} reminder is deleted'),
      duration: const Duration(seconds: 2),
      action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              priorityQueue.add(item);
            });
          }),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void onUpdateReminder(Reminder oldItem, Reminder newItem) {
    priorityQueue.remove(oldItem);
    onAddItem(newItem);
  }

  void setIndex(int idx) {
    setState(() {
      currentIndex = idx;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Reminder> reminder = priorityQueue.toList();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 70,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.note_add,
            ),
          ),
        ],
      ),
      backgroundColor: Colors.blue[50],
      drawer: const MyDrawer(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Reminders',
                          style: GoogleFonts.roboto(
                            color: Colors.indigo[900],
                            fontSize: 60,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 500,
                        child: Center(
                          child: (reminder.isNotEmpty)
                              ? ListView.builder(
                                  itemBuilder: (context, index) {
                                    return Dismissible(
                                      key: ValueKey(reminder[index].rID),
                                      direction: DismissDirection.endToStart,
                                      onDismissed: (direction) {
                                        onRemoveReminder(reminder[index]);
                                      },
                                      child: Column(
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              print('tapped');
                                              showModalSheetUpdate(
                                                context,
                                                onUpdateReminder,
                                                reminder[index],
                                              );
                                            },
                                            child: ListTile(
                                              title:
                                                  Text(reminder[index].title),
                                              subtitle: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(reminder[index]
                                                      .description),
                                                  Column(
                                                    children: [
                                                      Text(dateFormatter.format(
                                                          reminder[index]
                                                              .date)),
                                                      Text(
                                                          reminder[index].time),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                          Divider(
                                            height: 0,
                                            thickness: 2,
                                            indent: 30,
                                            endIndent: 30,
                                            color: Colors.indigo[900],
                                          )
                                        ],
                                      ),
                                    );
                                  },
                                  itemCount: reminder.length,
                                  prototypeItem: ListTile(
                                    title: Text(reminder.last.title),
                                    subtitle: Row(
                                      children: [
                                        Text(reminder.last.rID),
                                        Column(
                                          children: [
                                            Text(dateFormatter
                                                .format(reminder.last.date)),
                                            Text(reminder.last.time),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              : const Text('Nothing to display'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      floatingActionButton: CreateReminder(
        onAdd: onAddItem,
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: currentIndex,
      //   //type: BottomNavigationBarType.shifting,
      //   items: [
      //     BottomNavigationBarItem(
      //       label: 'Item 1',
      //       icon: IconButton(
      //         onPressed: () => setIndex(0),
      //         icon: const Icon(Icons.circle_outlined),
      //       ),
      //       activeIcon: const Icon(Icons.circle),
      //     ),
      //     BottomNavigationBarItem(
      //       label: 'Item 2',
      //       icon: IconButton(
      //         onPressed: () => setIndex(1),
      //         icon: const Icon(Icons.offline_bolt_outlined),
      //       ),
      //       activeIcon: const Icon(Icons.offline_bolt),
      //     ),
      //   ],
      // ),
    );
  }
}
