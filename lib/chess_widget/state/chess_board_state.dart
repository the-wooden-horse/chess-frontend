import 'package:chess/chess_piece/chess_piece_object.dart';
import 'package:chess/chess_widget/position_handlers/cordinates.dart';
import 'package:chess/constants/chess_piece_type.dart';

abstract class ChessBoardState {
  List<ChessPieceObject> get chessPieces;
  bool isCordinateContainsChessPiece(Cordinates cordinates);
  void moveChessPiece(Cordinates from, Cordinates to);
  Cordinates cordinatesAtChessPieceEnum(ChessPieceEnum chessPieceEnum);
}
