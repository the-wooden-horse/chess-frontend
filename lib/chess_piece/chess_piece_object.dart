import 'package:chess/chess_widget/position_handlers/cordinates.dart';
import 'package:chess/chess_widget/state/chess_board_state.dart';
import 'package:chess/constants/chess_piece_type.dart';

class ChessPieceObject {
  final ChessPieceEnum chessPieceEnum;
  Cordinate cordinate;

  ChessPieceObject({
    required this.chessPieceEnum,
    required this.cordinate,
  });

  List<Cordinate> highlightCordinates(ChessBoardState boardState) => [cordinate];
  List<Cordinate> highlightAttackCordinates(ChessBoardState boardState) => [cordinate];
}
