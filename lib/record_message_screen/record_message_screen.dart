import 'package:flutter/material.dart';

class RecordMessagesScreen extends StatefulWidget {
  const RecordMessagesScreen({Key? key}) : super(key: key);

  @override
  _RecordMessagesScreenState createState() => _RecordMessagesScreenState();
}

class _RecordMessagesScreenState extends State<RecordMessagesScreen> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Record message'),
    );
  }
}
