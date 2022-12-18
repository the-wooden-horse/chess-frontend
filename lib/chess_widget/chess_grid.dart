import 'dart:collection';

import 'package:chess/chess_widget/block.dart';
import 'package:chess/chess_widget/position_handlers/cordinates.dart';
import 'package:flutter/material.dart';

class ChessGrid extends StatelessWidget {
  final Function(Cordinate) onBlockTap;
  final HashSet<Cordinate> highlightedCordinates;
  const ChessGrid({
    Key? key,
    required this.onBlockTap,
    required this.highlightedCordinates,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 8,
      crossAxisSpacing: 0,
      physics: const NeverScrollableScrollPhysics(),
      children: List.generate(64, (index) {
        return Block(
          index,
          onTap: onBlockTap,
          selected: highlightedCordinates.contains(Cordinate.fromIndex(index)),
        );
      }),
    );
  }
}
