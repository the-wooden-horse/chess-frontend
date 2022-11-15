import 'dart:collection';
import 'dart:developer';

import 'package:chess/chess_piece/chess_piece_object.dart';
import 'package:chess/chess_widget/position_handlers/cordinates.dart';
import 'package:chess/chess_widget/state/chess_board_state.dart';
import 'package:chess/chess_widget/state/init_chess_piece_state.dart';
import 'package:chess/constants/chess_piece_type.dart';

class MockChessBoardState extends ChessBoardState {
  late Set<ChessPieceObject> _state;

  MockChessBoardState() {
    _state = HashSet();
    _state.addAll(ChessPieceInitState.getInitialChessPieceObjects());
  }

  @override
  bool isCordinateContainsChessPiece(Cordinates cordinates) {
    return _state.any((element) => element.cordinates == cordinates);
  }

  @override
  void moveChessPiece(Cordinates from, Cordinates to) {
    bool isPiecePresentAtFrom = isCordinateContainsChessPiece(from);
    bool isPiecePresentAtTo = isCordinateContainsChessPiece(to);
    if (isPiecePresentAtFrom && !isPiecePresentAtTo) {
      final chessPieceEnumFrom = getChessPieceEnumAt(from);
      _state.removeWhere((element) => element.cordinates == from);
      _state.add(ChessPieceObject(chessPieceEnum: chessPieceEnumFrom, cordinates: to));
      log("message: moveChessPiece: from: $from, to: $to");
    }
  }

  ChessPieceEnum getChessPieceEnumAt(Cordinates cordinates) {
    return _state.firstWhere((element) => element.cordinates == cordinates).chessPieceEnum;
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

  Cordinates? selectedCordinates;

  void selectCordinates(Cordinates cordinates) {
    selectedCordinates = cordinates;
  }

  void unSelectCordinates() {
    selectedCordinates = null;
  }

  void moveOrSelect(Cordinates cordinates) {
    if (selectedCordinates == null) {
      if (isCordinateContainsChessPiece(cordinates)) {
        selectedCordinates = cordinates;
        log("selectedCordinates: $selectedCordinates");
      } else {
        log("No chess piece at $cordinates");
      }
    } else {
      moveChessPiece(selectedCordinates!, cordinates);
      unSelectCordinates();
    }
  }

  @override
  Cordinates cordinatesAtChessPieceEnum(ChessPieceEnum chessPieceEnum) {
    return _state.firstWhere((element) => element.chessPieceEnum == chessPieceEnum).cordinates;
  }
}
