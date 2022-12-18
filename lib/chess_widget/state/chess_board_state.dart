import 'package:chess/chess_piece/chess_piece_object.dart';
import 'package:chess/chess_widget/position_handlers/cordinates.dart';
import 'package:chess/constants/chess_piece_type.dart';

abstract class ChessBoardState {
  List<ChessPieceObject> get chessPieces;

  get enPassantCaptureSquare => null;
  bool isCordinateContainsChessPiece(Cordinate cordinates);

  //moving chess piece from one cordinate to another
  void moveChessPiece(Cordinate from, Cordinate to);

  // cordinate of chess piece enum
  Cordinate cordinatesAtChessPieceEnum(ChessPieceEnum chessPieceEnum);
  // chess piece at cordinate
  ChessPieceObject chessPieceAtCordinate(Cordinate cordinate);

  //cordinate highlighting
  void highlightCordinates(Cordinate selectedCordinate);
  void unHighlightCordinates();

  //cordinate selection
  Cordinate? selectedCordinate;
  void selectCordinate(Cordinate selectedCordinate) {
    this.selectedCordinate = selectedCordinate;
    highlightCordinates(selectedCordinate);
  }

  //cordinate un-selection
  void unSelectCordinate() {
    unHighlightCordinates();
    selectedCordinate = null;
  }
}
