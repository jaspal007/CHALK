import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'f_a_b.dart';
import 'global_variable.dart';

void main() {
  runApp(
    const listView(),
  );
}

int currentIndex = 0;

class listView extends StatefulWidget {
  const listView({super.key});

  @override
  State<listView> createState() => MylistViewApp();
}

class MylistViewApp extends State<listView> {
  @override
  Widget build(BuildContext context) {
    void setIndex(int idx) {
      setState(() {
        currentIndex = idx;
      });
    }

    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.indigo[900],
          centerTitle: true,
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.indigo[900],
          selectedItemColor: Colors.blue[50],
          selectedIconTheme: IconThemeData(size: 30),
          showSelectedLabels: true,
          unselectedIconTheme: IconThemeData(size: 30),
          type: BottomNavigationBarType.fixed,
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.indigo[900],
          foregroundColor: Colors.blue[50],
          splashColor: Colors.blue[50],
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(
              Colors.indigo[900],
            ),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            foregroundColor: MaterialStatePropertyAll(
              Colors.indigo[900],
            ),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blue[50],
        body: Container(
          height: double.infinity,
          margin: const EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
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
              Container(
                height: 500,
                child: Center(
                  child: (list.isNotEmpty)
                      ? ListView.builder(
                          itemBuilder: (context, index) {
                            return Container(
                              child: Column(
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
                              ),
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
        floatingActionButton: const CreateNote(),
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
      ),
    );
  }
}
