import 'package:flutter/cupertino.dart';

class HorizontalLineWithText extends StatelessWidget {
  final String text;

  const HorizontalLineWithText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 1,
          color: CupertinoColors.systemGrey,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          color: CupertinoTheme.of(context).scaffoldBackgroundColor,
          child: Text(
            text,
            style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
              color: CupertinoColors.systemGrey,
              fontSize: 14,
            ),
          ),
        ),
      ],
    );
  }
}