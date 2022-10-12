class Cordinates {
  int x;
  int y;
  int get sum => x + y;
  Cordinates(this.x, this.y);

  factory Cordinates.fromIndex(int index) {
    int X = index % 8;
    int Y = index ~/ 8;
    return Cordinates(X, Y);
  }

  @override
  String toString() {
    return '$x,  $y';
  }
}
