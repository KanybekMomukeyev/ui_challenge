import 'package:flutter/material.dart';
import 'package:flutterapp/constants.dart';

class OfferRow extends StatelessWidget {
  final int index;
  const OfferRow({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color? finalColor;
    if (index == 3) {
      finalColor = Colors.teal[100];
    } else if (index == 4) {
      finalColor = Colors.teal[200];
    } else if (index == 5) {
      finalColor = Colors.teal[300];
    } else if (index == 6) {
      finalColor = Colors.teal[400];
    } else if (index == 7) {
      finalColor = Colors.teal[500];
    } else if (index == 8) {
      finalColor = Colors.teal[600];
    }
    return Container(
      // color: finalColor,
      color: Colors.white,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 200,
                color: AppColors.completeBackgroundColor,
                child: const Text('Entry A'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
