import 'package:chess/chess_piece/chess_piece_object.dart';
import 'package:chess/chess_widget/board_size/square8.dart';
import 'package:chess/chess_widget/position_handlers/cordinates.dart';
import 'package:chess/chess_widget/state/chess_board_state.dart';
import 'package:chess/constants/chess_piece_type.dart';

class King extends ChessPieceObject {
  King({required Cordinate cordinate, required ChessPieceEnum chessPieceEnum})
      : super(chessPieceEnum: chessPieceEnum, cordinate: cordinate);

  @override
  List<Cordinate> highlightCordinates(ChessBoardState boardState) {
    List<Cordinate> cordinates = [];
    cordinates.add(Cordinate(x: cordinate.x + 1, y: cordinate.y));
    cordinates.add(Cordinate(x: cordinate.x - 1, y: cordinate.y));
    cordinates.add(Cordinate(x: cordinate.x, y: cordinate.y + 1));
    cordinates.add(Cordinate(x: cordinate.x, y: cordinate.y - 1));
    cordinates.add(Cordinate(x: cordinate.x + 1, y: cordinate.y + 1));
    cordinates.add(Cordinate(x: cordinate.x + 1, y: cordinate.y - 1));
    cordinates.add(Cordinate(x: cordinate.x - 1, y: cordinate.y + 1));
    cordinates.add(Cordinate(x: cordinate.x - 1, y: cordinate.y - 1));

    cordinates.removeWhere((cordinate) => !Square8().contains(cordinate));

    cordinates.removeWhere((cordinate) {
      if (boardState.isCordinateContainsChessPiece(cordinate)) {
        return boardState.chessPieceAtCordinate(cordinate).chessPieceEnum.type == chessPieceEnum.type;
      }
      return false;
    });

    boardState.chessPieces.forEach((chessPieceObject) {
      if (chessPieceObject.chessPieceEnum.uniqueType == ChessPieceEnumUniqueType.king) {
      } else {
        if (chessPieceObject.chessPieceEnum.type != chessPieceEnum.type) {
          cordinates
              .removeWhere((cordinate) => chessPieceObject.highlightAttackCordinates(boardState).contains(cordinate));
        }
      }
    });

    return cordinates;
  }

  @override
  List<Cordinate> highlightAttackCordinates(ChessBoardState state) => highlightCordinates(state);
}
