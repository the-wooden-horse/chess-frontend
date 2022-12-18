import 'package:chess/chess_widget/position_handlers/cordinates.dart';
import 'package:flutter/material.dart';

const Color selectedColor = Color.fromARGB(255, 255, 0, 0);

class Block extends StatelessWidget {
  final int index;
  final Function(Cordinate cordinates) onTap;
  final bool selected;
  Color get _defaultBlockColor => ((Cordinate.fromIndex(index).sum % 2 == 0) ? Colors.blue : Colors.white);

  const Block(this.index, {Key? key, required this.onTap, required this.selected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap(Cordinate.fromIndex(index));
      },
      child: Container(
        height: 30,
        width: 30,
        decoration: BoxDecoration(
          border: Border.all(color: selected ? selectedColor : Colors.black, width: selected ? 3 : 1),
          color: _defaultBlockColor,
        ),
      ),
    );
  }
}
