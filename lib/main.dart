import 'package:flutter/material.dart';

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
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('List View Builder'),
          centerTitle: true,
        ),
        body: Container(
          height: double.infinity,
          margin: const EdgeInsets.all(20),
          child: Center(
            child: (list.isNotEmpty)
                ? ListView.builder(
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(list[index]),
                      );
                    },
                    itemCount: listLength(),
                    prototypeItem: ListTile(
                      title: Text(list.last),
                    ),
                  )
                : const Text('Nothing to display here!!!'),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: const CreateNote(),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          fixedColor: Colors.purple,
          type: BottomNavigationBarType.shifting,
          backgroundColor: Colors.redAccent,
          items: [
            BottomNavigationBarItem(
              label: 'Item 1',
              icon: IconButton(
                color: Colors.yellow,
                onPressed: () => setIndex(0),
                icon: const Icon(Icons.abc_outlined),
              ),
            ),
            BottomNavigationBarItem(
              label: 'Item 2',
              icon: IconButton(
                color: Colors.yellow,
                onPressed: () => setIndex(1),
                icon: const Icon(Icons.offline_bolt),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
