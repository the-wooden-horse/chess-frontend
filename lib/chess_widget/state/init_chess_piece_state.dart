import 'package:chess/chess_piece/chess_piece_object.dart';
import 'package:chess/constants/chess_piece_type.dart';

import '../position_handlers/cordinates.dart';

abstract class ChessPieceInitState {
  static List<ChessPieceObject> getInitialChessPieceObjects() {
    return [
      ChessPieceObject(chessPieceEnum: ChessPieceEnum.rookA1, cordinates: Cordinates.fromIndex(0)),
      ChessPieceObject(chessPieceEnum: ChessPieceEnum.knightA1, cordinates: Cordinates.fromIndex(1)),
      ChessPieceObject(chessPieceEnum: ChessPieceEnum.bishopA1, cordinates: Cordinates.fromIndex(2)),
      ChessPieceObject(chessPieceEnum: ChessPieceEnum.queenA, cordinates: Cordinates.fromIndex(3)),
      ChessPieceObject(chessPieceEnum: ChessPieceEnum.kingA, cordinates: Cordinates.fromIndex(4)),
      ChessPieceObject(chessPieceEnum: ChessPieceEnum.bishopA2, cordinates: Cordinates.fromIndex(5)),
      ChessPieceObject(chessPieceEnum: ChessPieceEnum.knightA2, cordinates: Cordinates.fromIndex(6)),
      ChessPieceObject(chessPieceEnum: ChessPieceEnum.rookA2, cordinates: Cordinates.fromIndex(7)),
      ChessPieceObject(chessPieceEnum: ChessPieceEnum.pawnA1, cordinates: Cordinates.fromIndex(8)),
      ChessPieceObject(chessPieceEnum: ChessPieceEnum.pawnA2, cordinates: Cordinates.fromIndex(9)),
      ChessPieceObject(chessPieceEnum: ChessPieceEnum.pawnA3, cordinates: Cordinates.fromIndex(10)),
      ChessPieceObject(chessPieceEnum: ChessPieceEnum.pawnA4, cordinates: Cordinates.fromIndex(11)),
      ChessPieceObject(chessPieceEnum: ChessPieceEnum.pawnA5, cordinates: Cordinates.fromIndex(12)),
      ChessPieceObject(chessPieceEnum: ChessPieceEnum.pawnA6, cordinates: Cordinates.fromIndex(13)),
      ChessPieceObject(chessPieceEnum: ChessPieceEnum.pawnA7, cordinates: Cordinates.fromIndex(14)),
      ChessPieceObject(chessPieceEnum: ChessPieceEnum.pawnA8, cordinates: Cordinates.fromIndex(15)),
      ChessPieceObject(chessPieceEnum: ChessPieceEnum.pawnB1, cordinates: Cordinates.fromIndex(48)),
      ChessPieceObject(chessPieceEnum: ChessPieceEnum.pawnB2, cordinates: Cordinates.fromIndex(49)),
      ChessPieceObject(chessPieceEnum: ChessPieceEnum.pawnB3, cordinates: Cordinates.fromIndex(50)),
      ChessPieceObject(chessPieceEnum: ChessPieceEnum.pawnB4, cordinates: Cordinates.fromIndex(51)),
      ChessPieceObject(chessPieceEnum: ChessPieceEnum.pawnB5, cordinates: Cordinates.fromIndex(52)),
      ChessPieceObject(chessPieceEnum: ChessPieceEnum.pawnB6, cordinates: Cordinates.fromIndex(53)),
      ChessPieceObject(chessPieceEnum: ChessPieceEnum.pawnB7, cordinates: Cordinates.fromIndex(54)),
      ChessPieceObject(chessPieceEnum: ChessPieceEnum.pawnB8, cordinates: Cordinates.fromIndex(55)),
      ChessPieceObject(chessPieceEnum: ChessPieceEnum.rookB1, cordinates: Cordinates.fromIndex(56)),
      ChessPieceObject(chessPieceEnum: ChessPieceEnum.knightB1, cordinates: Cordinates.fromIndex(57)),
      ChessPieceObject(chessPieceEnum: ChessPieceEnum.bishopB1, cordinates: Cordinates.fromIndex(58)),
      ChessPieceObject(chessPieceEnum: ChessPieceEnum.queenB, cordinates: Cordinates.fromIndex(59)),
      ChessPieceObject(chessPieceEnum: ChessPieceEnum.kingB, cordinates: Cordinates.fromIndex(60)),
      ChessPieceObject(chessPieceEnum: ChessPieceEnum.bishopB2, cordinates: Cordinates.fromIndex(61)),
      ChessPieceObject(chessPieceEnum: ChessPieceEnum.knightB2, cordinates: Cordinates.fromIndex(62)),
      ChessPieceObject(chessPieceEnum: ChessPieceEnum.rookB2, cordinates: Cordinates.fromIndex(63)),
    ];
  }
}
