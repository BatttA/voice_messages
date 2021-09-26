import 'package:flutter/material.dart';

import 'components/message_player_widget.dart';

class UserMessagesScreen extends StatefulWidget {
  const UserMessagesScreen({Key? key}) : super(key: key);

  @override
  _UserMessagesScreenState createState() => _UserMessagesScreenState();
}

class _UserMessagesScreenState extends State<UserMessagesScreen> {
  MediaQueryData get _queryData => MediaQuery.of(context);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            const Text('Мои записи', style: TextStyle(color: Colors.black54)),
        centerTitle: true,
      ),
      backgroundColor: Colors.grey.withOpacity(0.05),
      body: Container(
        height: _queryData.size.height,
        width: _queryData.size.width,
        padding: EdgeInsets.symmetric(horizontal: _queryData.size.width * .05),
        child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          padding: EdgeInsets.only(
            bottom: _queryData.size.height * .12,
          ),
          itemCount: 20,
          separatorBuilder: (context, _) {
            return const Divider();
          },
          itemBuilder: (context, index) {
            return const MessagePlayerWidget();
          },
        ),
      ),
    );
  }
}
