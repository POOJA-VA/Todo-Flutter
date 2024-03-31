import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController _textFieldController = TextEditingController();
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(20),
                    ),
                    child: const Icon(
                      Icons.close,
                      size: 20,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            const SizedBox(height: 240),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: _textFieldController,
                decoration: InputDecoration(hintText: "Enter your task"),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Align(
                alignment: Alignment.topLeft,
                child: Material(
                  color: const Color.fromARGB(255, 225, 218, 216),
                  borderRadius: BorderRadius.circular(50),
                  child: InkWell(
                    onTap: () {},
                    borderRadius: BorderRadius.circular(50),
                    child: Container(
                      width: 120,
                      height: 50,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(horizontal: 6),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.calendar_today),
                          SizedBox(width: 10),
                          Text('Today'),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 55),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.create_new_folder, color: Colors.grey),
                ),
                SizedBox(width: 40),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.flag_outlined, color: Colors.grey),
                ),
                SizedBox(width: 40),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.nightlight_outlined, color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          print(_textFieldController.text);
          Navigator.of(context).pop(_textFieldController.text);
        },
        label: Row(
          children: [
            Text(
              'New Task',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            SizedBox(width: 5), // Adjust the spacing between text and icon
            Icon(Icons.keyboard_arrow_up_outlined),
          ],
        ),
        backgroundColor: Colors.blue,
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(20), // Adjust the border radius as needed
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: Search(),
  ));
}
