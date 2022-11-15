class Cordinates {
  int x;
  int y;
  int get sum => x + y;
  int get index => x + y * 8;
  Cordinates(this.x, this.y);

  factory Cordinates.fromIndex(int index) {
    int X = index % 8;
    int Y = index ~/ 8;
    return Cordinates(X, Y);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Cordinates && other.x == x && other.y == y;
  }

  @override
  int get hashCode => x.hashCode ^ y.hashCode;

  @override
  String toString() {
    return '$x,  $y';
  }
}
