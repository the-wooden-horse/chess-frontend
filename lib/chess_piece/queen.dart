import 'package:chess/chess_piece/chess_piece_object.dart';
import 'package:chess/chess_widget/board_size/square8.dart';
import 'package:chess/chess_widget/position_handlers/cordinates.dart';
import 'package:chess/chess_widget/state/chess_board_state.dart';
import 'package:chess/constants/chess_piece_type.dart';
import 'package:chess/rules/path.dart';

class Queen extends ChessPieceObject {
  Queen({required Cordinate cordinate, required ChessPieceEnum chessPieceEnum})
      : super(chessPieceEnum: chessPieceEnum, cordinate: cordinate);

  @override
  List<Cordinate> highlightCordinates(ChessBoardState boardState) {
    List<Cordinate> cordinates = [];
    List<PathDirection> directions = [
      PathDirection.up,
      PathDirection.down,
      PathDirection.left,
      PathDirection.right,
      PathDirection.upLeft,
      PathDirection.upRight,
      PathDirection.downLeft,
      PathDirection.downRight,
    ];
    void addCordinates(PathDirection direction) {
      final pathCordinates = Path.fromLine(direction, cordinate).walkLine(Square8());
      for (final cordinate in pathCordinates) {
        if (cordinate == super.cordinate) {
          continue;
        }
        if (!boardState.isCordinateContainsChessPiece(cordinate)) {
          cordinates.add(cordinate);
          continue;
        }
        if (boardState.chessPieceAtCordinate(cordinate).chessPieceEnum.type == chessPieceEnum.type) {
          break;
        }
        if (boardState.chessPieceAtCordinate(cordinate).chessPieceEnum.type != chessPieceEnum.type) {
          cordinates.add(cordinate);
          break;
        }
      }
    }

    directions.forEach(addCordinates);

    return cordinates;
  }

  @override
  List<Cordinate> highlightAttackCordinates(ChessBoardState boardState) {
    List<Cordinate> cordinates = [];
    List<PathDirection> directions = [
      PathDirection.up,
      PathDirection.down,
      PathDirection.left,
      PathDirection.right,
      PathDirection.upLeft,
      PathDirection.upRight,
      PathDirection.downLeft,
      PathDirection.downRight,
    ];
    void addCordinates(PathDirection direction) {
      final pathCordinates = Path.fromLine(direction, cordinate).walkLine(Square8());
      for (final cordinate in pathCordinates) {
        if (cordinate == super.cordinate) {
          continue;
        }
        if (!boardState.isCordinateContainsChessPiece(cordinate)) {
          cordinates.add(cordinate);
          continue;
        }
        if (boardState.chessPieceAtCordinate(cordinate).chessPieceEnum.type == chessPieceEnum.type) {
          cordinates.add(cordinate);
          break;
        }
        if (boardState.chessPieceAtCordinate(cordinate).chessPieceEnum.type != chessPieceEnum.type) {
          cordinates.add(cordinate);
          break;
        }
      }
    }

    directions.forEach(addCordinates);

    return cordinates;
  }
}
