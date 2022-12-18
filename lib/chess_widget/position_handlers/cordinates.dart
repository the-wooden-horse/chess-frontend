import 'package:chess/chess_widget/board_size/shape.dart';
import 'package:chess/rules/path.dart';

class Cordinate {
  int x;
  int y;
  int get sum => x + y;
  int get index => x + y * 8;
  Cordinate({required this.x, required this.y});

  factory Cordinate.fromIndex(int index) {
    int X = index % 8;
    int Y = index ~/ 8;
    return Cordinate(x: X, y: Y);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Cordinate && other.x == x && other.y == y;
  }

  @override
  int get hashCode => x.hashCode ^ y.hashCode;

  @override
  String toString() {
    return '$x,  $y';
  }

  Cordinate next(PathDirection direction) {
    switch (direction) {
      case PathDirection.up:
        return Cordinate(x: x, y: y - 1);
      case PathDirection.down:
        return Cordinate(x: x, y: y + 1);
      case PathDirection.left:
        return Cordinate(x: x - 1, y: y);
      case PathDirection.right:
        return Cordinate(x: x + 1, y: y);
      case PathDirection.upLeft:
        return Cordinate(x: x - 1, y: y - 1);
      case PathDirection.upRight:
        return Cordinate(x: x + 1, y: y - 1);
      case PathDirection.downLeft:
        return Cordinate(x: x - 1, y: y + 1);
      case PathDirection.downRight:
        return Cordinate(x: x + 1, y: y + 1);
      case PathDirection.none:
        return this;
    }
  }

  bool withinBounds(Shape shape) {
    return shape.contains(this);
  }
}
