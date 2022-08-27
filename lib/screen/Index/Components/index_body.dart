import 'package:emi_calculator/screen/Index/Components/index_custom_output.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../state/index_state.dart';
import '../../../widget/custom_form_field.dart';

class IndexBody extends StatelessWidget {
  const IndexBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    Widget _verticalSizedBox() {
      return SizedBox(
        height: screenHeight * 0.001,
      );
    }

    return Consumer<IndexState>(builder: (context, state, child) {
      return SingleChildScrollView(
        child: Column(
          children: [
            CustomFormField(
              title: 'Principal Amount',
              controller: state.principalController,
              hintText: 'Enter Principal Amount',
              errorText: '',
              height: screenHeight,
              width: screenWidth,
              action: TextInputAction.next,
            ),
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: CustomFormField(
                    title: 'Tenure',
                    controller: state.tenureController,
                    hintText: 'Enter Number of Years / Months',
                    errorText: '',
                    height: screenHeight,
                    width: screenWidth,
                    action: TextInputAction.next,
                  ),
                ),
                Expanded(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      Text(
                        state.tenureType,
                        style: TextStyle(
                            color: Colors.grey.shade700,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.4,
                            overflow: TextOverflow.ellipsis,
                            fontSize: screenWidth * 0.03),
                      ),
                      Switch(
                          value: state.switchValue,
                          onChanged: (bool value) {
                            if (value) {
                              state.tenureType = state.tenureTypes[1];
                            } else {
                              state.tenureType = state.tenureTypes[0];
                            }
                            state.getSwitchValue = value;
                          })
                    ])),
              ],
            ),
            CustomFormField(
              title: "Interest Rate in %",
              controller: state.interestController,
              hintText: 'Enter Interest Rate',
              errorText: '',
              height: screenHeight,
              width: screenWidth,
              action: TextInputAction.done,
            ),
            _verticalSizedBox(),
            state.emiResult == "0" ||
                    state.emiResult == '' ||
                    state.emiResult.isEmpty
                ? const SizedBox()
                : const IndexCustomOutput()
          ],
        ),
      );
    });
  }
}
