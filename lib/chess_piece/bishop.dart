import 'package:chess/chess_piece/chess_piece_object.dart';
import 'package:chess/chess_widget/board_size/square8.dart';
import 'package:chess/chess_widget/position_handlers/cordinates.dart';
import 'package:chess/chess_widget/state/chess_board_state.dart';
import 'package:chess/constants/chess_piece_type.dart';
import 'package:chess/rules/path.dart';

class Bishop extends ChessPieceObject {
  Bishop({required Cordinate cordinate, required ChessPieceEnum chessPieceEnum})
      : super(chessPieceEnum: chessPieceEnum, cordinate: cordinate);

  @override
  bool isValidMove(Cordinate from, Cordinate to, ChessBoardState board) {
    if (from.x == to.x || from.y == to.y) {
      return false;
    }

    // if board contains an enemy piece at to, then it is a valid move
    if (board.isCordinateContainsChessPiece(to)) {
      return true;
    }
    return false;
  }

  // highlight cordinates according to the rules of the bishop
  @override
  List<Cordinate> highlightCordinates(ChessBoardState boardState) {
    List<Cordinate> cordinates = [];

    final directions = [
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
    // highlight cordinates according to the rules of the bishop

    List<Cordinate> cordinates = [];

    final directions = [
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
