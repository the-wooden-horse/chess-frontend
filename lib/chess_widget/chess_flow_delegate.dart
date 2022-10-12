import 'dart:developer';

import 'package:chess/chess_widget/position_handlers/cordinates.dart';
import 'package:chess/chess_widget/position_handlers/transformation.dart';
import 'package:flutter/material.dart';

class ChessFlowDelegate extends FlowDelegate {
  final Cordinates cordinates;
  ChessFlowDelegate(this.cordinates);
  @override
  void paintChildren(FlowPaintingContext context) {
    log("message : ${context.size}");
    log("message: parent size ${context.size}");
    log("message: child size ${context.getChildSize(1)}");
    context.paintChild(0, transform: Matrix4.translationValues(0, 0, 0));
    context.paintChild(1, transform: Transformation.fromCordinates(cordinates, context.size));
  }

  @override
  bool shouldRepaint(ChessFlowDelegate oldDelegate) {
    return cordinates != oldDelegate.cordinates;
  }
}
