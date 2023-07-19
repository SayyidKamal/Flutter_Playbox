import 'package:flutter/material.dart';

/// Flutter code sample for [NavigationBar].

void main() => runApp(const NavigationBarApp());

class NavigationBarApp extends StatelessWidget {
  const NavigationBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: NavigationExample(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class NavigationExample extends StatefulWidget {
  const NavigationExample({super.key});

  @override
  State<NavigationExample> createState() => _NavigationExampleState();
}

class _NavigationExampleState extends State<NavigationExample> {
  int currentPageIndex = 0;
  final List<String> entries = <String>['A', 'B', 'C', 'D', 'E', 'F', 'G'];
  final List<int> colorCodes = <int>[800, 700, 600, 500, 400, 300, 200];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(Icons.looks_one),
            label: 'one',
          ),
          NavigationDestination(
            icon: Icon(Icons.looks_two),
            label: '',
          ),
          NavigationDestination(
            icon: Icon(Icons.looks_3),
            label: '',
          ),
          NavigationDestination(
            icon: Icon(Icons.looks_4),
            label: '',
          ),
        ],
      ),
      body: <Widget>[
        //Page 1
        Container(
          alignment: Alignment.center,
          child: ListView(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 8),
            children: <Widget>[
              Container(
                height: 50,
                color: Colors.amber[600],
                child: const Center(child: Text('Entry A')),
              ),
              Container(
                height: 50,
                color: Colors.amber[500],
                child: const Center(child: Text('Entry B')),
              ),
              Container(
                height: 50,
                color: Colors.amber[100],
                child: const Center(child: Text('Entry C')),
              ),
            ],
          ),
        ),

        //Page 2
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 8),
          child: Column(
            children: [
              const Expanded(
                child: Text(
                  "WELCOME",
                  style: TextStyle(
                      fontSize: 30, letterSpacing: 2.0, color: Colors.amber),
                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: entries.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('You Clicked ${entries[index]}'),
                              action: SnackBarAction(
                                label: 'Action',
                                onPressed: () {
                                  // Code to execute.
                                },
                              ),
                            ),
                          );
                        },
                        child: Container(
                          width: 100,
                          color: Colors.amber[colorCodes[index]],
                          child: Center(child: Text('Entry ${entries[index]}')),
                        ),
                      );
                    },
                  ),
                ),
              ),
              const Expanded(flex: 8, child: Text(''))
            ],
          ),
        ),

        //Page 3
        Container(
          alignment: Alignment.center,
          child: ListView.separated(
            itemCount: entries.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                height: 50,
                color: Colors.amber[colorCodes[index]],
                child: Center(child: Text('Entry ${entries[index]}')),
              );
            },
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(),
          ),
        ),
        Container(
          alignment: Alignment.center,
          child: const Text('Page 4'),
        ),
      ][currentPageIndex],
    );
  }
}
