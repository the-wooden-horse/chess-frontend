import 'package:chess/chess_widget/board_size/shape.dart';
import 'package:chess/chess_widget/position_handlers/cordinates.dart';

class Square8 extends Shape {
  static const int _dimension = 8;

  @override
  bool contains(Cordinate cordinate) {
    return cordinate.x >= 0 && cordinate.x < _dimension && cordinate.y >= 0 && cordinate.y < _dimension;
  }
}
