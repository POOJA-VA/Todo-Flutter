import 'package:bar/lang.dart';
import 'package:bar/search.dart';
import 'package:flutter/material.dart';
import 'package:bar/list.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Home extends StatefulWidget {
  const Home({Key? key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool menuOpen = false;
  double tranx = 0, trany = 0, scale = 1.0;

  final List<Map<String, dynamic>> task = tasks;

  void _changeLanguage(Language language) {
    print(language.lang);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        transform: Matrix4.translationValues(tranx, trany, 0)..scale(scale),
        color: const Color.fromARGB(255, 250, 248, 248),
        child: Column(
          children: [
            SizedBox(height: 50),
            Row(
              children: [
                !menuOpen
                    ? IconButton(
                        icon: const Icon(Icons.menu),
                        onPressed: () {
                          setState(() {
                            scale = 0.5;
                            tranx = size.width - 100;
                            trany = (size.height - (size.height * scale)) / 2;
                            menuOpen = true;
                          });
                        },
                        color: const Color.fromARGB(255, 13, 15, 15),
                      )
                    : IconButton(
                        icon: const Icon(Icons.arrow_back_ios),
                        color: Colors.lightBlue,
                        onPressed: () {
                          setState(() {
                            scale = 1.0;
                            tranx = 0;
                            trany = 0;
                            menuOpen = false;
                          });
                        },
                      ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButton<Language>(
                    onChanged: (Language? language) {
                      if (language != null) {
                        _changeLanguage(language);
                      }
                    },
                    underline: SizedBox(),
                    icon: const Icon(Icons.search),
                    items: Language.langList()
                        .map<DropdownMenuItem<Language>>(
                            (lang) => DropdownMenuItem<Language>(
                                  value: lang,
                                  child: Row(
                                    children: <Widget>[Text(lang.lang)],
                                  ),
                                ),
                                )
                        .toList(),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.notifications),
                  onPressed: () {},
                ),
              ],
            ),
            Expanded(
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        AppLocalizations.of(context)!.title,
                        style: TextStyle(
                          fontFamily: 'Times New Roman',
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        'CATEGORIES',
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: 200,
                            child: Card(
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    const Text(
                                      '40 tasks',
                                      style: TextStyle(
                                        fontSize: 10,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    const Text(
                                      'Business',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                    const SizedBox(height: 16),
                                    LinearProgressIndicator(
                                      value:
                                          0.6, // Example value, adjust as needed
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                          Color.fromARGB(255, 196, 31, 198)),
                                      backgroundColor: Colors.grey[300],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 200,
                            child: Card(
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    const Text(
                                      '18 tasks',
                                      style: TextStyle(
                                        fontSize: 10,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    const Text(
                                      'Personal',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                    const SizedBox(height: 16),
                                    LinearProgressIndicator(
                                      value:
                                          0.8, // Example value, adjust as needed
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                          Color.fromARGB(255, 30, 103, 172)),
                                      backgroundColor: Colors.grey[300],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        'TODAY`S TASK',
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: task.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 16, left: 16),
                            child: Dismissible(
                              key: Key(tasks[index]["title"].toString()),
                              direction: DismissDirection.endToStart,
                              background: Container(
                                color: const Color.fromARGB(255, 185, 181, 181),
                                child: const Align(
                                  alignment: Alignment.centerRight,
                                  child: Padding(
                                    padding: EdgeInsets.only(right: 20),
                                    child:
                                        Icon(Icons.delete, color: Colors.white),
                                  ),
                                ),
                              ),
                              onDismissed: (direction) {
                                setState(() {
                                  tasks.removeAt(index);
                                });
                              },
                              child: SizedBox(
                                width: 330,
                                height: 70,
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      tasks[index]["check"] =
                                          !tasks[index]["check"];
                                      print(tasks[index]["title"] +
                                          " is now ${tasks[index]["check"] ? "completed" : "incomplete"}");
                                    });
                                  },
                                  child: Card(
                                    child: Row(
                                      children: [
                                        SizedBox(width: 10),
                                        Container(
                                          width: 23,
                                          height: 23,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color: Colors.black,
                                              width: 2.0,
                                            ),
                                          ),
                                          child: tasks[index]["check"]
                                              ? Icon(Icons.done,
                                                  size: 20,
                                                  color: Color.fromARGB(
                                                      255, 15, 16, 5))
                                              : null,
                                        ),
                                        SizedBox(width: 10),
                                        Text(
                                          tasks[index]["title"],
                                          style: TextStyle(
                                            fontSize: 17,
                                            decoration: tasks[index]["check"]
                                                ? TextDecoration.lineThrough
                                                : TextDecoration.none,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Search()),
          ).then((value) {
            print('main');
            Map<String, dynamic> task = {
              "title": value,
              "check": false,
              "color": Color.fromARGB(255, 97, 225, 99)
            };
            setState(() {
              tasks.add(task);
            });
          });
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
        shape: CircleBorder(),
      ),
    );
  }
}
