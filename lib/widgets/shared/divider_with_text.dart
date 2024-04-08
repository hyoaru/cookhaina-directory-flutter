import 'package:flutter/material.dart';

class DividerWithText extends StatelessWidget {
  final String label;
  final double verticalMargin;

  const DividerWithText({
    super.key,
    required this.label,
    this.verticalMargin = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.5,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: verticalMargin),
        child: Row(
          children: [
            Text(label),
            Expanded(
              child: Divider(
                indent: 15,
                thickness: 0.5,
                color: Theme.of(context).primaryColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
