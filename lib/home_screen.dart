import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:roomlights/add_device.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final List<Map<String, dynamic>> _listItem = [
    {"image": 'assets/images/lamp.jpg'},
    {"image": 'assets/images/lamp.jpg'},
    {"image": 'assets/images/lamp.jpg'},
    {"image": 'assets/images/lamp.jpg'},
    {"image": 'assets/images/lamp.jpg'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[600],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("Home"),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 16.0), // Add right padding to the action
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  PageTransition(
                    type: PageTransitionType.fade,
                    child: const AddDevice(),
                  )
                );
              },
              child: const Icon(Icons.add),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              const SizedBox(height: 20,),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  children: _listItem.map((item) => Card(
                    color: Colors.transparent,
                    elevation: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: AssetImage(item["image"]),
                          fit: BoxFit.cover
                        )
                      ),
                    ),
                  )).toList(),
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}