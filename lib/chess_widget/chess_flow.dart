import 'dart:developer';

import 'package:chess/chess_widget/chess_flow_delegate.dart';
import 'package:chess/chess_widget/chess_grid.dart';
import 'package:chess/chess_widget/position_handlers/cordinates.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ChessFlow extends StatefulWidget {
  const ChessFlow({Key? key}) : super(key: key);

  @override
  State<ChessFlow> createState() => _ChessFlowState();
}

class _ChessFlowState extends State<ChessFlow> {
  Cordinates _cordinates = Cordinates(0, 0);
  @override
  Widget build(BuildContext context) {
    return Flow(delegate: ChessFlowDelegate(_cordinates), children: [
      ChessGrid(
        onBlockTap: (p0) {
          setState(() {
            _cordinates = p0;
          });
        },
      ),
      SvgPicture.asset('assets/sprites/king.svg'),
    ]);
  }
}
