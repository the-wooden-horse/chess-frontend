import 'package:chess/constants/chess_piece_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChessPieceWidget extends StatelessWidget {
  final ChessPieceEnum chessPieceEnum;
  const ChessPieceWidget({Key? key, required this.chessPieceEnum}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset('assets/sprites/${chessPieceEnum.type.name}/${chessPieceEnum.uniqueType.name}.svg');
  }
}
