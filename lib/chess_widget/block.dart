import 'dart:developer';

import 'package:chess/chess_widget/position_handlers/cordinates.dart';
import 'package:flutter/material.dart';

class Block extends StatelessWidget {
  final int index;
  final Function(Cordinates cordinates) onTap;
  const Block(this.index, {Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(Cordinates.fromIndex(index)),
      child: Container(
        height: 30,
        width: 30,
        decoration: BoxDecoration(
          border: Border.all(),
          color: ((Cordinates.fromIndex(index).sum % 2 == 0) ? Colors.blue : Colors.white),
        ),
        child: Text(
          Cordinates.fromIndex(index).toString(),
          textScaleFactor: 0.2,
          softWrap: true,
        ),
      ),
    );
  }
}
