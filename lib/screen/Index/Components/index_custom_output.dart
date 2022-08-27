import 'package:emi_calculator/screen/Index/Components/detail_body.dart';
import 'package:emi_calculator/widget/custom_row_output.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../state/index_state.dart';

class IndexCustomOutput extends StatelessWidget {
  const IndexCustomOutput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    final state = Provider.of<IndexState>(context);

    return Consumer<IndexState>(
      builder: (context, state, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(
                  left: screenWidth * 0.06,
                  right: screenWidth * 0.06,
                  top: screenHeight * 0.01),
              padding: EdgeInsets.only(bottom: screenWidth * 0.02),
              //margin: const EdgeInsets.only(left: 20, right: 20, top: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Result'.toUpperCase(),
                    style: TextStyle(
                        color: Colors.grey.shade700,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.3,
                        overflow: TextOverflow.ellipsis,
                        fontSize: screenWidth * 0.035),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return const DetailBody();
                        }),
                      );
                    },
                    child: Text(
                      'View in Detail',
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.3,
                          overflow: TextOverflow.ellipsis,
                          fontSize: screenWidth * 0.03,
                          decoration: TextDecoration.underline),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              width: screenWidth,
              margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.all(Radius.circular(screenWidth * 0.03)),
                  border: Border.all(
                      color: Colors.grey.shade300,
                      width: 0.5,
                      style: BorderStyle.solid),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.grey,
                        blurRadius: 7,
                        spreadRadius: -5,
                        offset: Offset(0, 2),
                        blurStyle: BlurStyle.outer),
                  ]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: screenHeight * 0.01,
                  ),
                  CustomRowOutput(
                    height: screenHeight,
                    width: screenWidth,
                    rowTitle: state.tenureType == "Year(s)"
                        ? 'Yearly EMI '
                        : 'Monthly EMI ',
                    rowResult: 'Rs. ${state.emiResult}',
                  ),
                  CustomRowOutput(
                    height: screenHeight,
                    width: screenWidth,
                    rowTitle: 'Total Interest ',
                    rowResult: state.totalInterest,
                  ),
                  SizedBox(
                    height: screenHeight * 0.01,
                  ),
                ],
              ),
            ),
          ],
        );
      }
    );
  }
}
