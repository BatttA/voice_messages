import 'package:flutter/material.dart';

class MessagePlayerWidget extends StatelessWidget {
  final bool showMoreButton;

  const MessagePlayerWidget({Key? key, this.showMoreButton = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final queryData = MediaQuery.of(context);
    final iconSize = queryData.size.width * .1;
    final playerHeight = queryData.size.height * .035;
    final playerWidth = showMoreButton
        ? queryData.size.width * 0.5
        : queryData.size.width * 0.6;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5),
      color: Colors.pink.withOpacity(0.1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _iconWidget(
                onPressed: () {},
                iconSize: iconSize,
                icon: const Icon(Icons.play_arrow_rounded),
              ),
              const SizedBox(width: 2),
              _iconWidget(
                onPressed: () {},
                iconSize: iconSize,
                icon: const Icon(Icons.stop),
              ),
            ],
          ),
          Container(
            constraints: BoxConstraints(
              maxWidth: queryData.size.width * .6,
            ),
            color: Colors.white,
            height: playerHeight,
            width: playerWidth,
          ),
          if (showMoreButton)
            _iconWidget(
              onPressed: () {},
              iconSize: iconSize,
              icon: const Icon(Icons.more_horiz),
            ),
          const SizedBox(width: 1),
        ],
      ),
    );
  }

  Widget _iconWidget(
      {required double iconSize, required Widget icon, Function? onPressed}) {
    return IconButton(
      constraints: BoxConstraints(
        maxWidth: iconSize,
        maxHeight: iconSize,
      ),
      padding: EdgeInsets.zero,
      onPressed: () {
        if (onPressed != null) {
          onPressed();
        }
      },
      iconSize: iconSize,
      splashRadius: iconSize / 2,
      icon: icon,
    );
  }
}
