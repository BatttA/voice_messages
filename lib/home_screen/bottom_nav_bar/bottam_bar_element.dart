import 'package:flutter/material.dart';

class SquareBottomBarItem extends StatelessWidget {
  final Function(int) onTap;
  final int index;
  final IconData iconData;
  final String text;
  final bool active;
  final Color activeColor;
  final Color inActiveColor;

  const SquareBottomBarItem(
      {Key? key,
      required this.onTap,
      required this.index,
      required this.iconData,
      required this.text,
      required this.active,
      this.activeColor = Colors.blue,
      this.inActiveColor = Colors.black54})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        onTap(index);
      },
      backgroundColor: Colors.white,
      elevation: 0.0,
      foregroundColor: Colors.transparent,
      shape: Border.all(color: Colors.transparent),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            iconData,
            color: active ? activeColor : inActiveColor,
          ),
          Text(
            text,
            style: TextStyle(
              fontSize: 10,
              color: active ? activeColor : inActiveColor,
              letterSpacing: 0,
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

class CircleBottomBarItem extends StatelessWidget {
  final Function(int) onTap;
  final int index;
  final IconData iconData;
  final bool active;
  final Color activeBorderColor;
  final Color inActiveBorderColor;
  final Color activeIconColor;
  final Color inActiveIconColor;
  final Color activeBgColor;
  final Color inActiveBgColor;

  const CircleBottomBarItem(
      {Key? key,
      required this.onTap,
      required this.index,
      required this.iconData,
      this.active = true,
      this.activeBorderColor = Colors.black12,
      this.inActiveBorderColor = Colors.black12,
      this.activeIconColor = Colors.lightBlue,
      this.inActiveIconColor = Colors.black12,
      this.activeBgColor = Colors.green,
      this.inActiveBgColor = Colors.white})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.zero,
      onPressed: () {
        onTap(index);
      },
      icon: Container(
        decoration: BoxDecoration(
          color: active ? activeBgColor.withOpacity(0.15) : inActiveBgColor,
          shape: BoxShape.circle,
          border: Border.all(
            color: active ? activeBorderColor : inActiveBorderColor,
          ),
        ),
        child: Center(
          child: Icon(
            iconData,
            color: active ? activeIconColor : inActiveIconColor,
          ),
        ),
      ),
    );
  }
}
