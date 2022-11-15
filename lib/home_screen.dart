import 'package:chess/chess_widget/chess_flow.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
      ),
      body: SizedBox.square(
        dimension: (width < 400) ? width : 400,
        child: ChessFlow(),
      ),
    );
  }
}
