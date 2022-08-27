import 'package:emi_calculator/state/index_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class IndexBottomContainer extends StatelessWidget {
  const IndexBottomContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    final state = Provider.of<IndexState>(context);

    return Container(
      width: screenWidth,
      margin: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.02, vertical: screenHeight * 0.02),
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.01),
      child: TextButton(
        style: TextButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            primary: Colors.white,
            backgroundColor: Colors.blue),
        onPressed: () {
          state.handleCalculation();
        },
        child: Text(
          'Calculate EMI'.toUpperCase(),
          style: TextStyle(
              color: Colors.white,
              fontSize: screenWidth * 0.035,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.5),
        ),
      ),
    );
  }
}
