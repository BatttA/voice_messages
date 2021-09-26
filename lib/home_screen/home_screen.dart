import 'dart:async';

import 'package:flutter/material.dart';
import 'package:voice_messages/home_screen/bottom_nav_bar/battom_nav_bar.dart';
import 'package:voice_messages/information_screen/information_screen.dart';
import 'package:voice_messages/record_message_screen/record_message_screen.dart';
import 'package:voice_messages/user_messages_screen/user_messages_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late StreamController<int> _bottomBarStreamController;
  late int _bottomBarIndex;

  final List<Widget> _homeScreens = [
    const UserMessagesScreen(),
    const RecordMessagesScreen(),
    const InformationScreen(),
  ];

  @override
  void initState() {
    _bottomBarIndex = 0;
    _bottomBarStreamController = StreamController<int>.broadcast();
    super.initState();
  }

  @override
  void dispose() {
    _bottomBarStreamController.close();
    super.dispose();
  }

  void tapToBottomNavBar(int index) {
    _bottomBarIndex = index;
    _bottomBarStreamController.add(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<int>(
        stream: _bottomBarStreamController.stream,
        initialData: _bottomBarIndex,
        builder: (context, snapshot) {
          final index = snapshot.data ?? 0;
          return Stack(
            children: [
              Container(
                color: Colors.grey.withOpacity(0.1),
                child: _homeScreens[index],
              ),
              Positioned(
                bottom: 0,
                child: CustomBottomNavBar(
                  bottomBarIndex: index,
                  tapToBottomBar: tapToBottomNavBar,
                ),
              )
            ],
          );
        }
      ),
    );
  }
}
