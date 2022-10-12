import 'package:chess/chess_widget/position_handlers/cordinates.dart';
import 'package:flutter/material.dart';

abstract class Transformation {
  static Matrix4 fromCordinates(Cordinates cordinates, Size boardSize) {
    return Matrix4.translationValues(cordinates.x * boardSize.width / 8, cordinates.y * boardSize.height / 8, 0)
        .scaled(1 / 8, 1 / 8);
  }
}
