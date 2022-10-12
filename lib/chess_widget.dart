import 'dart:developer';

import 'package:chess/chess_widget/chess_grid.dart';
import 'package:flutter/material.dart';

class ChessWidget extends StatefulWidget {
  const ChessWidget({Key? key}) : super(key: key);

  @override
  State<ChessWidget> createState() => _ChessWidgetState();
}

class _ChessWidgetState extends State<ChessWidget> {
  @override
  Widget build(BuildContext context) {
    return ChessGrid(
      onBlockTap: (p0) {
        log("message : ${p0.toString()}");
      },
    );
  }
}
