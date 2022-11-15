enum ChessPieceType {
  A,
  B;

  @override
  String toString() {
    return name;
  }
}

enum ChessPieceEnumUniqueType { king, queen, rook, bishop, knight, pawn }

enum ChessPieceEnum {
  kingA(1, ChessPieceType.A, ChessPieceEnumUniqueType.king),
  kingB(2, ChessPieceType.B, ChessPieceEnumUniqueType.king),
  queenA(3, ChessPieceType.A, ChessPieceEnumUniqueType.queen),
  queenB(4, ChessPieceType.B, ChessPieceEnumUniqueType.queen),
  bishopA1(5, ChessPieceType.A, ChessPieceEnumUniqueType.bishop),
  bishopA2(6, ChessPieceType.A, ChessPieceEnumUniqueType.bishop),
  bishopB1(7, ChessPieceType.B, ChessPieceEnumUniqueType.bishop),
  bishopB2(8, ChessPieceType.B, ChessPieceEnumUniqueType.bishop),
  knightA1(9, ChessPieceType.A, ChessPieceEnumUniqueType.knight),
  knightA2(10, ChessPieceType.A, ChessPieceEnumUniqueType.knight),
  knightB1(11, ChessPieceType.B, ChessPieceEnumUniqueType.knight),
  knightB2(12, ChessPieceType.B, ChessPieceEnumUniqueType.knight),
  rookA1(13, ChessPieceType.A, ChessPieceEnumUniqueType.rook),
  rookA2(14, ChessPieceType.A, ChessPieceEnumUniqueType.rook),
  rookB1(15, ChessPieceType.B, ChessPieceEnumUniqueType.rook),
  rookB2(16, ChessPieceType.B, ChessPieceEnumUniqueType.rook),
  pawnA1(17, ChessPieceType.A, ChessPieceEnumUniqueType.pawn),
  pawnA2(18, ChessPieceType.A, ChessPieceEnumUniqueType.pawn),
  pawnA3(19, ChessPieceType.A, ChessPieceEnumUniqueType.pawn),
  pawnA4(20, ChessPieceType.A, ChessPieceEnumUniqueType.pawn),
  pawnA5(21, ChessPieceType.A, ChessPieceEnumUniqueType.pawn),
  pawnA6(22, ChessPieceType.A, ChessPieceEnumUniqueType.pawn),
  pawnA7(23, ChessPieceType.A, ChessPieceEnumUniqueType.pawn),
  pawnA8(24, ChessPieceType.A, ChessPieceEnumUniqueType.pawn),
  pawnB1(25, ChessPieceType.B, ChessPieceEnumUniqueType.pawn),
  pawnB2(26, ChessPieceType.B, ChessPieceEnumUniqueType.pawn),
  pawnB3(27, ChessPieceType.B, ChessPieceEnumUniqueType.pawn),
  pawnB4(28, ChessPieceType.B, ChessPieceEnumUniqueType.pawn),
  pawnB5(29, ChessPieceType.B, ChessPieceEnumUniqueType.pawn),
  pawnB6(30, ChessPieceType.B, ChessPieceEnumUniqueType.pawn),
  pawnB7(31, ChessPieceType.B, ChessPieceEnumUniqueType.pawn),
  pawnB8(32, ChessPieceType.B, ChessPieceEnumUniqueType.pawn);

  final int key;
  final ChessPieceType type;
  final ChessPieceEnumUniqueType uniqueType;
  const ChessPieceEnum(
    this.key,
    this.type,
    this.uniqueType,
  );
}
