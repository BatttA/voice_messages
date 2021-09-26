import 'package:flutter/material.dart';

import 'bottam_bar_element.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int bottomBarIndex;
  final Function(int) tapToBottomBar;

  CustomBottomNavBar({
    Key? key,
    required this.bottomBarIndex,
    required this.tapToBottomBar,
  }) : super(key: key);

  final List<IconData> _icons = [
    Icons.music_note,
    Icons.mic,
    Icons.info_outline,
  ];

  final List<String> _navBarText = [
    'Записи',
    '',
    'Инфо',
  ];

  @override
  Widget build(BuildContext context) {
    final _queryData = MediaQuery.of(context);
    const _bottomBarHeight = 60.0;
    const _decorationHeight = 50.0;
    return SizedBox(
      height: _bottomBarHeight,
      width: _queryData.size.width,
      child: Stack(
        children: [
          Positioned(
            height: _decorationHeight,
            width: _queryData.size.width,
            bottom: 0,
            child: CustomPaint(
              size: Size(_queryData.size.width, _decorationHeight),
              painter: _BNBCustomPainter(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: _icons.map((icon) {
                  final index = _icons.indexOf(icon);
                  final active = bottomBarIndex == index;
                  if (index == 1) {
                    return const SizedBox();
                  }
                  return SquareBottomBarItem(
                      onTap: tapToBottomBar,
                      index: index,
                      iconData: icon,
                      text: _navBarText[index],
                      active: active);
                }).toList(),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: CircleBottomBarItem(
              onTap: tapToBottomBar,
              active: bottomBarIndex == 1,
              index: 1,
              iconData: _icons[1],
            ),
          ),
        ],
      ),
    );
  }
}

class _BNBCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final Path path = Path();
    path.moveTo(0, 0); // Start
    path.lineTo(size.width * .3, 0);
    path.quadraticBezierTo(
        size.width * .39, 0, size.width * .4, size.height * .5);
    path.quadraticBezierTo(
        size.width * .415, size.height, size.width * .5, size.height - 1);
    path.quadraticBezierTo(
        size.width * .585, size.height - 1, size.width * .59, size.height * .5);
    path.quadraticBezierTo(size.width * .6, 0, size.width * .7, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    canvas.drawShadow(path, Colors.black, 5, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
