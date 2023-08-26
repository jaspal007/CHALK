import 'package:flutter/material.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.75,
      child: SafeArea(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 2,
                    color: Colors.black54,
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back_ios_new),
                  ),
                  const Spacer(),
                  Text(
                    'Good evening! Mike',
                    style: const TextStyle().copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 5.0,
                    ),
                  ),
                  const CircleAvatar(
                    backgroundImage: AssetImage("lib/assets/wp6626988.jpg"),
                  )
                ],
              ),
            ),
            ListTile(
              title: Text(
                'Account',
                style: const TextStyle().copyWith(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
              onTap: () {},
            ),
            ListTile(
              title: Text(
                'Settings',
                style: const TextStyle().copyWith(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
              onTap: () {},
            ),
            ListTile(
              title: Text(
                'Reminder',
                style: const TextStyle().copyWith(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
              onTap: () {},
            ),
            ListTile(
              title: Text(
                'Flagged',
                style: const TextStyle().copyWith(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
              onTap: () {},
            ),
            ListTile(
              title: Text(
                'Completed',
                style: const TextStyle().copyWith(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
              onTap: () {},
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 5.0),
              child: Divider(
                thickness: 2,
                color: Colors.black54,
              ),
            ),
            ListTile(
              title: Text(
                'Notes',
                style: const TextStyle().copyWith(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
              onTap: () {},
            ),
            ListTile(
              title: Text(
                'Bin',
                style: const TextStyle().copyWith(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
              onTap: () {},
            ),
            ListTile(
              title: Text(
                'Locked',
                style: const TextStyle().copyWith(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
              onTap: () {},
            ),
            ListTile(
              title: Text(
                'Feedback',
                style: const TextStyle().copyWith(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
              onTap: () {},
            ),
            ListTile(
              title: Align(
                alignment: Alignment.center,
                child: Text(
                  'Sign Out',
                  style: const TextStyle().copyWith(
                    fontSize: 20,
                    color: Colors.red,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              onTap: () {},
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 5.0),
              child: Divider(
                thickness: 2,
                color: Colors.black54,
              ),
            ),
            const Text.rich(
              TextSpan(text: "CHALKⓇ is a registered trademark."),
              textAlign: TextAlign.center,
            ),
            const Text.rich(
              TextSpan(text: "Version: 1.0.0 \n 2023"),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
