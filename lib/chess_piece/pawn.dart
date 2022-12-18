import 'package:chess/chess_piece/chess_piece_object.dart';
import 'package:chess/chess_widget/board_size/square8.dart';
import 'package:chess/chess_widget/position_handlers/cordinates.dart';
import 'package:chess/chess_widget/state/chess_board_state.dart';
import 'package:chess/constants/chess_piece_type.dart';

class Pawn extends ChessPieceObject {
  Pawn({required Cordinate cordinate, required ChessPieceEnum chessPieceEnum})
      : super(chessPieceEnum: chessPieceEnum, cordinate: cordinate);

  @override
  List<Cordinate> highlightCordinates(ChessBoardState boardState) {
    List<Cordinate> cordinates = [];
    if (chessPieceEnum.type == ChessPieceType.A) {
      cordinates.add(Cordinate(x: cordinate.x, y: cordinate.y + 1));
      if (cordinate.y == 1) {
        cordinates.add(Cordinate(x: cordinate.x, y: cordinate.y + 2));
      }
      // Capture diagonally
      if (boardState.isCordinateContainsChessPiece(Cordinate(x: cordinate.x + 1, y: cordinate.y + 1))) {
        cordinates.add(Cordinate(x: cordinate.x + 1, y: cordinate.y + 1));
      }
      if (boardState.isCordinateContainsChessPiece(Cordinate(x: cordinate.x - 1, y: cordinate.y + 1))) {
        cordinates.add(Cordinate(x: cordinate.x - 1, y: cordinate.y + 1));
      }

      // En passant capture
      if (boardState.enPassantCaptureSquare != null) {
        Cordinate enPassantCaptureSquare = boardState.enPassantCaptureSquare;
        if (enPassantCaptureSquare.x == cordinate.x - 1 || enPassantCaptureSquare.x == cordinate.x + 1) {
          cordinates.add(enPassantCaptureSquare);
        }
      }
    } else {
      cordinates.add(Cordinate(x: cordinate.x, y: cordinate.y - 1));
      if (cordinate.y == 6) {
        cordinates.add(Cordinate(x: cordinate.x, y: cordinate.y - 2));
      }

      if (boardState.isCordinateContainsChessPiece(Cordinate(x: cordinate.x + 1, y: cordinate.y - 1))) {
        cordinates.add(Cordinate(x: cordinate.x + 1, y: cordinate.y - 1));
      }
      if (boardState.isCordinateContainsChessPiece(Cordinate(x: cordinate.x - 1, y: cordinate.y - 1))) {
        cordinates.add(Cordinate(x: cordinate.x - 1, y: cordinate.y - 1));
      }

      // En passant capture
      if (boardState.enPassantCaptureSquare != null) {
        Cordinate enPassantCaptureSquare = boardState.enPassantCaptureSquare;
        if (enPassantCaptureSquare.x == cordinate.x - 1 || enPassantCaptureSquare.x == cordinate.x + 1) {
          cordinates.add(enPassantCaptureSquare);
        }
      }
    }
    cordinates.removeWhere((c) => !Square8().contains(c));
    cordinates.removeWhere((c) {
      if (boardState.isCordinateContainsChessPiece(c)) {
        return boardState.chessPieceAtCordinate(c).chessPieceEnum.type == chessPieceEnum.type;
      }
      return false;
    });
    // Promotion
    if (cordinate.y == 0 || cordinate.y == 7) {
      cordinates = [cordinate];
    }
    return cordinates;
  }

  @override
  List<Cordinate> highlightAttackCordinates(ChessBoardState boardState) {
    List<Cordinate> cordinates = [];
    if (chessPieceEnum.type == ChessPieceType.A) {
      // Capture diagonally
      cordinates.add(Cordinate(x: cordinate.x + 1, y: cordinate.y + 1));

      cordinates.add(Cordinate(x: cordinate.x - 1, y: cordinate.y + 1));

      // En passant capture
      if (boardState.enPassantCaptureSquare != null) {
        Cordinate enPassantCaptureSquare = boardState.enPassantCaptureSquare;
        if (enPassantCaptureSquare.x == cordinate.x - 1 || enPassantCaptureSquare.x == cordinate.x + 1) {
          cordinates.add(enPassantCaptureSquare);
        }
      }
    } else {
      cordinates.add(Cordinate(x: cordinate.x + 1, y: cordinate.y - 1));

      cordinates.add(Cordinate(x: cordinate.x - 1, y: cordinate.y - 1));

      // En passant capture
      if (boardState.enPassantCaptureSquare != null) {
        Cordinate enPassantCaptureSquare = boardState.enPassantCaptureSquare;
        if (enPassantCaptureSquare.x == cordinate.x - 1 || enPassantCaptureSquare.x == cordinate.x + 1) {
          cordinates.add(enPassantCaptureSquare);
        }
      }
    }
    cordinates.removeWhere((c) => !Square8().contains(c));

    // Promotion
    if (cordinate.y == 0 || cordinate.y == 7) {
      cordinates = [cordinate];
    }
    return cordinates;
  }
}
