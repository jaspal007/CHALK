//widget containing the Scaffold to display the list of content

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'widgets/app_widgets/create_note.dart';
import 'resources/global_variable.dart';

class ShowList extends StatefulWidget {
  const ShowList({super.key});

  @override
  State<ShowList> createState() => _ShowListState();
}

int currentIndex = 0;

class _ShowListState extends State<ShowList> {
  void onAddItem(String title) {
    setState(() {
      addItem(title);
    });
  }

  void setIndex(int idx) {
    setState(() {
      currentIndex = idx;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      body: Container(
        height: double.infinity,
        margin: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                'Notes',
                style: GoogleFonts.roboto(
                  color: Colors.indigo[900],
                  fontSize: 80,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 500,
              child: Center(
                child: (list.isNotEmpty)
                    ? ListView.builder(
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              ListTile(
                                title: Text(list[index]),
                              ),
                              Divider(
                                height: 0,
                                thickness: 2,
                                indent: 30,
                                endIndent: 30,
                                color: Colors.indigo[900],
                              )
                            ],
                          );
                        },
                        itemCount: listLength(),
                        prototypeItem: ListTile(
                          title: Text(list.last),
                        ),
                      )
                    : const Text('Nothing to display'),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      floatingActionButton: CreateNote(
        onAdd: onAddItem,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        //type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            label: 'Item 1',
            icon: IconButton(
              onPressed: () => setIndex(0),
              icon: const Icon(Icons.circle_outlined),
            ),
            activeIcon: const Icon(Icons.circle),
          ),
          BottomNavigationBarItem(
            label: 'Item 2',
            icon: IconButton(
              onPressed: () => setIndex(1),
              icon: const Icon(Icons.offline_bolt_outlined),
            ),
            activeIcon: const Icon(Icons.offline_bolt),
          ),
        ],
      ),
    );
  }
}
