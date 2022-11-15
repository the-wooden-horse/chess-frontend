import 'package:chess/chess_widget/position_handlers/cordinates.dart';
import 'package:chess/constants/chess_piece_type.dart';

class ChessPieceObject {
  final ChessPieceEnum chessPieceEnum;
  final Cordinates cordinates;

  ChessPieceObject({
    required this.chessPieceEnum,
    required this.cordinates,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ChessPieceObject && other.chessPieceEnum == chessPieceEnum && other.cordinates == cordinates;
  }

  @override
  int get hashCode => chessPieceEnum.hashCode ^ cordinates.hashCode;
}
