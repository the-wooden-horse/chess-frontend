// write a class Rook that extends ChessPiece
// it should contain a constructor that takes a ChessPieceEnum
// it should have rules for moving the rook

import 'package:chess/chess_piece/chess_piece_object.dart';
import 'package:chess/chess_widget/board_size/square8.dart';
import 'package:chess/chess_widget/position_handlers/cordinates.dart';
import 'package:chess/chess_widget/state/chess_board_state.dart';
import 'package:chess/constants/chess_piece_type.dart';
import 'package:chess/rules/path.dart';

// HAATHI
class Rook extends ChessPieceObject {
  Rook({required Cordinate cordinate, required ChessPieceEnum chessPieceEnum})
      : super(chessPieceEnum: chessPieceEnum, cordinate: cordinate);

  // highlight cordinates according to the rules of the rook
  @override
  List<Cordinate> highlightCordinates(ChessBoardState boardState) {
    List<Cordinate> cordinates = [];

    final directions = [
      PathDirection.up,
      PathDirection.down,
      PathDirection.left,
      PathDirection.right,
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

    final directions = [
      PathDirection.up,
      PathDirection.down,
      PathDirection.left,
      PathDirection.right,
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
