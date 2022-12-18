import 'package:chess/chess_piece/bishop.dart';
import 'package:chess/chess_piece/chess_piece_object.dart';
import 'package:chess/chess_piece/king.dart';
import 'package:chess/chess_piece/knight.dart';
import 'package:chess/chess_piece/pawn.dart';
import 'package:chess/chess_piece/queen.dart';
import 'package:chess/chess_piece/rook.dart';
import 'package:chess/constants/chess_piece_type.dart';

import '../position_handlers/cordinates.dart';

abstract class ChessPieceInitState {
  static List<ChessPieceObject> getInitialChessPieceObjects() {
    return [
      Rook(chessPieceEnum: ChessPieceEnum.rookA1, cordinate: Cordinate.fromIndex(0)),
      Knight(chessPieceEnum: ChessPieceEnum.knightA1, cordinate: Cordinate.fromIndex(1)),
      Bishop(chessPieceEnum: ChessPieceEnum.bishopA1, cordinate: Cordinate.fromIndex(2)),
      Queen(chessPieceEnum: ChessPieceEnum.queenA, cordinate: Cordinate.fromIndex(3)),
      King(chessPieceEnum: ChessPieceEnum.kingA, cordinate: Cordinate.fromIndex(4)),
      Bishop(chessPieceEnum: ChessPieceEnum.bishopA2, cordinate: Cordinate.fromIndex(5)),
      Knight(chessPieceEnum: ChessPieceEnum.knightA2, cordinate: Cordinate.fromIndex(6)),
      Rook(chessPieceEnum: ChessPieceEnum.rookA2, cordinate: Cordinate.fromIndex(7)),
      Pawn(chessPieceEnum: ChessPieceEnum.pawnA1, cordinate: Cordinate.fromIndex(8)),
      Pawn(chessPieceEnum: ChessPieceEnum.pawnA2, cordinate: Cordinate.fromIndex(9)),
      Pawn(chessPieceEnum: ChessPieceEnum.pawnA3, cordinate: Cordinate.fromIndex(10)),
      Pawn(chessPieceEnum: ChessPieceEnum.pawnA4, cordinate: Cordinate.fromIndex(11)),
      Pawn(chessPieceEnum: ChessPieceEnum.pawnA5, cordinate: Cordinate.fromIndex(12)),
      Pawn(chessPieceEnum: ChessPieceEnum.pawnA6, cordinate: Cordinate.fromIndex(13)),
      Pawn(chessPieceEnum: ChessPieceEnum.pawnA7, cordinate: Cordinate.fromIndex(14)),
      Pawn(chessPieceEnum: ChessPieceEnum.pawnA8, cordinate: Cordinate.fromIndex(15)),
      Pawn(chessPieceEnum: ChessPieceEnum.pawnB1, cordinate: Cordinate.fromIndex(48)),
      Pawn(chessPieceEnum: ChessPieceEnum.pawnB2, cordinate: Cordinate.fromIndex(49)),
      Pawn(chessPieceEnum: ChessPieceEnum.pawnB3, cordinate: Cordinate.fromIndex(50)),
      Pawn(chessPieceEnum: ChessPieceEnum.pawnB4, cordinate: Cordinate.fromIndex(51)),
      Pawn(chessPieceEnum: ChessPieceEnum.pawnB5, cordinate: Cordinate.fromIndex(52)),
      Pawn(chessPieceEnum: ChessPieceEnum.pawnB6, cordinate: Cordinate.fromIndex(53)),
      Pawn(chessPieceEnum: ChessPieceEnum.pawnB7, cordinate: Cordinate.fromIndex(54)),
      Pawn(chessPieceEnum: ChessPieceEnum.pawnB8, cordinate: Cordinate.fromIndex(55)),
      Rook(chessPieceEnum: ChessPieceEnum.rookB1, cordinate: Cordinate.fromIndex(56)),
      Knight(chessPieceEnum: ChessPieceEnum.knightB1, cordinate: Cordinate.fromIndex(57)),
      Bishop(chessPieceEnum: ChessPieceEnum.bishopB1, cordinate: Cordinate.fromIndex(58)),
      Queen(chessPieceEnum: ChessPieceEnum.queenB, cordinate: Cordinate.fromIndex(59)),
      King(chessPieceEnum: ChessPieceEnum.kingB, cordinate: Cordinate.fromIndex(60)),
      Bishop(chessPieceEnum: ChessPieceEnum.bishopB2, cordinate: Cordinate.fromIndex(61)),
      Knight(chessPieceEnum: ChessPieceEnum.knightB2, cordinate: Cordinate.fromIndex(62)),
      Rook(chessPieceEnum: ChessPieceEnum.rookB2, cordinate: Cordinate.fromIndex(63)),
    ];
  }
}
