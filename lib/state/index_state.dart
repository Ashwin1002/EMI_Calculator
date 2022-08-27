import 'dart:math';

import 'package:flutter/material.dart';

import '../model/emi_model.dart';

class IndexState with ChangeNotifier {
  late String emiResult = '';
  late String totalInterest;
  late String totalPayment;
  late TextEditingController principalController,
      tenureController,
      interestController;
  late List tenureTypes;
  late String tenureType;

  late bool switchValue;

  late List<EMIModel> tableData;
  late List<EMIModel> _emiModel;

  IndexState() {
    totalInterest = '';
    principalController = TextEditingController(text: '');
    tenureController = TextEditingController(text: '');
    interestController = TextEditingController(text: '');
    tenureTypes = ['Month(s)', 'Year(s)'];
    tenureType = "Year(s)";
    switchValue = true;
    tableData = [];
    _emiModel = [];
  }

  init(){
    clear();
  }

  clear(){
    tableData = [];
    principalController.clear();
    tenureController.clear();
    interestController.clear();
    emiResult = '';
    totalInterest = '';
    notifyListeners();
  }

  List<EMIModel> get emiModel {
    return [..._emiModel];
  }

  set getSwitchValue(bool value) {
    switchValue = value;
    notifyListeners();
  }

  handleCalculation() {
    //  Amortization
    //  A = Payment amount per period
    //  P = Initial Principal (loan amount)
    //  r = interest rate
    //  n = total number of payments or periods

    debugPrint("principal amount => ${principalController.text}");
    debugPrint("tenure => ${tenureController.text}");
    debugPrint("interest rate => ${interestController.text}");

    double A = 0.0;
    double B = 0.0;
    int P = int.parse(principalController.text);
    double r = int.parse(interestController.text) / 12 / 100;
    int n = tenureType == "Year(s)"
        ? int.parse(tenureController.text) * 12
        : int.parse(tenureController.text);

    A = (P * r * pow((1 + r), n) / (pow((1 + r), n) - 1));

    // emi result
    emiResult = A.toStringAsFixed(2);

    // total interest
    double TI = double.parse(emiResult);
    B = TI * n;
    totalInterest = B.toStringAsFixed(2);

    // payment details per month
    int month = 1;
    double paidTill = 0;
    double totalAmount = P.toDouble();

    while (P > 0) {
      int i = (P * r).round();
      double principal = A - i;
      double newEmi = i + principal;
      double closing = P - principal;
      if (closing < 0) {
        closing = 0;
      }
      paidTill = paidTill + P;
      double paidPercent = (paidTill / totalAmount) / 100;
      // tableData.add({
      //   month++,
      //   P.round(),
      //   principal.round(),
      //   i.round(),
      //   newEmi.round(),
      //   closing.round(),
      //   // paidTill.round(),
      //   // paidPercent
      // });
      tableData.add(
        EMIModel.name(
          month: month++,
          opening: P.round(),
          principal: principal.round(),
          interest: i.round(),
          emi: A.toInt(),
          closing: closing.round(),
        ),
      );
      P = (P - principal.toInt());
    }

    debugPrint("total emi => Rs. $emiResult");
    debugPrint("table data => $tableData");

    notifyListeners();
  }
}
