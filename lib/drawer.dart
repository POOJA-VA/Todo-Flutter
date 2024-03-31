import 'package:flutter/material.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({Key? key});

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 110, 66, 223),
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          SizedBox(height: 50),
          Row(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(
                        'https://images.fineartamerica.com/images/artworkimages/mediumlarge/3/little-smiling-dog-on-blue-background-dmitro-kirichay.jpg',
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
          SizedBox(height: 30),
          ListTile(
            leading: Icon(Icons.save,
                color: const Color.fromARGB(255, 246, 244, 244)),
            title: Text(
              'Templates',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.category_outlined, color: Colors.white),
            title: Text(
              'Categories',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.iso_rounded, color: Colors.white),
            title: Text(
              'Analytics',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.settings_outlined, color: Colors.white),
            title: Text(
              'Templates',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onTap: () {},
          ),
          SizedBox(height: 290),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Good',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(height: 8),
                  const Text(
                    'Consistency',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}