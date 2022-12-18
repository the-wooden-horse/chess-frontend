import 'package:chess/chess_widget/board_size/shape.dart';
import 'package:chess/chess_widget/board_size/square8.dart';
import 'package:chess/chess_widget/position_handlers/cordinates.dart';

enum PathType { line, point }

enum PathDirection { up, down, left, right, upLeft, upRight, downLeft, downRight, none }

class Path {
  PathDirection direction;
  Cordinate startCordinate;
  PathType type;
  Path._(this.direction, this.type, this.startCordinate);
  factory Path.fromLine(PathDirection direction, Cordinate startCordinate) {
    return Path._(direction, PathType.line, startCordinate);
  }
  factory Path.fromPoint(Cordinate cordinate) {
    return Path._(PathDirection.none, PathType.point, cordinate);
  }

  // was the path created from a point
  List<Cordinate> walkLine(Shape chessBoardShape) {
    List<Cordinate> cordinates = [];

    for (Cordinate cordinate = startCordinate; Square8().contains(cordinate); cordinate = cordinate.next(direction)) {
      cordinates.add(cordinate);
    }
    return cordinates;
  }
}
