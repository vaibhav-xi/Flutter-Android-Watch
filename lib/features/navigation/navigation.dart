import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:roomlights/features/home/homescreen.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  
  @override
  Widget build(BuildContext context) {
    return HomeScreenView();
  }
}
