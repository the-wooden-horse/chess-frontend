import 'dart:collection';
import 'dart:developer';

import 'package:chess/chess_piece/chess_piece_object.dart';
import 'package:chess/chess_widget/position_handlers/cordinates.dart';
import 'package:chess/chess_widget/state/chess_board_state.dart';
import 'package:chess/chess_widget/state/init_chess_piece_state.dart';
import 'package:chess/constants/chess_piece_type.dart';

class MockChessBoardState extends ChessBoardState {
  late Set<ChessPieceObject> _state;
  HashSet<Cordinate> highlightedCordinates = HashSet();
  bool isChessPieceTypeATurn = true;
  MockChessBoardState() {
    _state = HashSet();
    _state.addAll(ChessPieceInitState.getInitialChessPieceObjects());
  }

  @override
  bool isCordinateContainsChessPiece(Cordinate cordinates) {
    return _state.any((element) => element.cordinate == cordinates);
  }

  @override
  void moveChessPiece(Cordinate from, Cordinate to) {
    bool isPiecePresentAtFrom = isCordinateContainsChessPiece(from);
    bool isPiecePresentAtTo = isCordinateContainsChessPiece(to);
    if (from == to) {
      return;
    }

    if (isPiecePresentAtFrom && !isPiecePresentAtTo) {
      ChessPieceObject chessPieceObject = chessPieceAtCordinate(from);
      _state.remove(chessPieceObject);
      chessPieceObject.cordinate = to;
      _state.add(chessPieceObject);
      log("message: moveChessPiece: from: $from, to: $to");
    }

    if (isPiecePresentAtFrom && isPiecePresentAtTo) {
      ChessPieceObject chessPieceObjectAtTo = chessPieceAtCordinate(to);
      _state.remove(chessPieceObjectAtTo);

      ChessPieceObject chessPieceObject = chessPieceAtCordinate(from);
      _state.remove(chessPieceObject);
      chessPieceObject.cordinate = to;
      _state.add(chessPieceObject);
    }
    isChessPieceTypeATurn = !isChessPieceTypeATurn;
  }

  ChessPieceEnum getChessPieceEnumAt(Cordinate cordinates) {
    return _state.firstWhere((element) => element.cordinate == cordinates).chessPieceEnum;
  }

  @override
  List<ChessPieceObject> get chessPieces => _state.toList();

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return (other is MockChessBoardState) && listEquals(other.chessPieces, chessPieces);
  }

  @override
  int get hashCode => chessPieces.hashCode;

  bool listEquals(List<ChessPieceObject> chessPieces, List<ChessPieceObject> chessPieces2) {
    if (chessPieces.length != chessPieces2.length) {
      return false;
    }
    for (var chessPiece in chessPieces2) {
      if (!chessPieces.contains(chessPiece)) {
        return false;
      }
    }
    return true;
  }

  @override
  void highlightCordinates(Cordinate selectedCordinate) {
    //get highlighted cordinates from chess Piece Object
    final chessPieceObject = chessPieceAtCordinate(selectedCordinate);
    highlightedCordinates.addAll(chessPieceObject.highlightCordinates(this));
    highlightedCordinates.add(selectedCordinate);
  }

  @override
  void unHighlightCordinates() {
    highlightedCordinates.clear();
  }

  void moveOrSelect(Cordinate cordinates) {
    if (selectedCordinate == null) {
      if (isCordinateContainsChessPiece(cordinates)) {
        if (chessPieceAtCordinate(cordinates).chessPieceEnum.type == ChessPieceType.A) {
          if (isChessPieceTypeATurn) return;
        }
        if (chessPieceAtCordinate(cordinates).chessPieceEnum.type == ChessPieceType.B) {
          if (!isChessPieceTypeATurn) return;
        }
        selectCordinate(cordinates);
        log("selectedCordinate: $selectedCordinate");
      } else {
        log("No chess piece at $cordinates");
      }
    } else {
      if (highlightedCordinates.contains(cordinates)) {
        moveChessPiece(selectedCordinate!, cordinates);
        unSelectCordinate();
      } else {
        //remove this line to fix
        // moveChessPiece(selectedCordinate!, cordinates);

        unSelectCordinate();
      }
    }
  }

  @override
  Cordinate cordinatesAtChessPieceEnum(ChessPieceEnum chessPieceEnum) {
    return _state.firstWhere((element) => element.chessPieceEnum == chessPieceEnum).cordinate;
  }

  @override
  ChessPieceObject chessPieceAtCordinate(Cordinate cordinate) {
    return _state.firstWhere((element) => element.cordinate == cordinate);
  }
}
