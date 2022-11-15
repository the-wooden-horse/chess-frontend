import 'dart:developer';

import 'package:chess/chess_piece/chess_piece_widget.dart';
import 'package:chess/chess_widget/chess_flow_delegate.dart';
import 'package:chess/chess_widget/chess_grid.dart';
import 'package:chess/chess_widget/position_handlers/cordinates.dart';
import 'package:chess/chess_widget/state/chess_board_state.dart';
import 'package:chess/chess_widget/state/init_widget_state.dart';
import 'package:chess/chess_widget/state/mock_chess_board_state.dart';
import 'package:chess/constants/chess_piece_type.dart';
import 'package:flutter/material.dart';

class ChessFlow extends StatefulWidget {
  const ChessFlow({Key? key}) : super(key: key);

  @override
  State<ChessFlow> createState() => _ChessFlowState();
}

class _ChessFlowState extends State<ChessFlow> {
  final MockChessBoardState state = MockChessBoardState();
  @override
  Widget build(BuildContext context) {
    return Flow(delegate: ChessFlowDelegate(state), children: [
      ChessGrid(
        onBlockTap: (p0) {
          setState(() {
            state.moveOrSelect(p0);
          });
        },
      ),
      ...ChessInitialWidgets.getInitialWidgetsFromAssets()
          .map((e) => GestureDetector(
              onTap: () {
                log("cordinate ${state.cordinatesAtChessPieceEnum(e.chessPieceEnum)}");
                setState(() {
                  state.moveOrSelect(state.cordinatesAtChessPieceEnum(e.chessPieceEnum));
                });
              },
              child: e))
          .toList()
    ]);
  }
}
