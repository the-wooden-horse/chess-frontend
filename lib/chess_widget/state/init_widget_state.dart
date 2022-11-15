import 'package:chess/chess_piece/chess_piece_widget.dart';
import 'package:chess/constants/chess_piece_type.dart';

abstract class ChessInitialWidgets {
  static List<ChessPieceWidget> getInitialWidgetsFromAssets() {
    return ChessPieceEnum.values.map((e) => ChessPieceWidget(chessPieceEnum: e)).toList();
  }
}
