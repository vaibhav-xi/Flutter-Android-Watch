import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddDevice extends StatefulWidget {
  const AddDevice({super.key});

  @override
  _AddDeviceState createState() => _AddDeviceState();
}

class _AddDeviceState extends State<AddDevice> {

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ipController = TextEditingController();
  File? _image;

  Future<void> _getImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[600],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("New Device"),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 16.0), // Add right padding to the action
            child: GestureDetector(
              onTap: () {
              },
              child: const Icon(Icons.done),
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
              Container(
                height: 60,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black12),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Name',
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              Container(
                height: 60,
                width: 400,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black12),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: _ipController,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'IP',
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              Container(
                padding: const EdgeInsets.all(10),      
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    stops: [0.0 , 0.5, 1.0],
                    colors: [Colors.white, Colors.white, Color.fromARGB(255, 238, 238, 238)]
                  )  
                ),
                child: RawMaterialButton(
                  onPressed: () {},
                  shape: const CircleBorder(),
                  elevation: 2.0,
                  fillColor: Colors.white,
                  padding: const EdgeInsets.all(18.0),
                  child: const Text("Image"),
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}