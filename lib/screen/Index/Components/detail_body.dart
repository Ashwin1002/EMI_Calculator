import 'package:adaptive_scrollbar/adaptive_scrollbar.dart';
import 'package:emi_calculator/state/index_state.dart';
import 'package:emi_calculator/utils/string_separator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailBody extends StatelessWidget {
  const DetailBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    final state = Provider.of<IndexState>(context);

    Widget _titleTable({required name, required fontSize, required color}){
      return Expanded(
        child: Container(
          //margin: EdgeInsets.only(left: screenWidth * 0.01, top: screenHeight * 0.01, bottom: screenHeight * 0.01),
          //padding: EdgeInsets.only(left: screenWidth * 0.08),
          alignment: Alignment.centerLeft,
          child: Text(
            name,
            style: TextStyle(
                color: color,
                fontWeight: FontWeight.w400,
                fontSize: fontSize),
          ),
        ),
      );
    }

    Widget _rsTable({required name, required fontSize, required color}){
      return Expanded(
        child: Container(
          alignment: Alignment.center,
          //padding: EdgeInsets.all(screenWidth * 0.01),
          margin: EdgeInsets.symmetric(vertical: screenHeight * 0.01),
          child: Row(
            children: [
              Text('Rs. ', style: TextStyle(
                  color: color,
                  fontWeight: FontWeight.w400,
                  fontSize: fontSize),),
              Text(
                name,
                style: TextStyle(
                    color: color,
                    fontWeight: FontWeight.w400,
                    fontSize: fontSize),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'EMI DETAILS',
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: screenWidth * 0.04),
        ),
        leading: InkWell(
          onTap: (){
            state.clear();
            Navigator.pop(context);
          },
          child: Icon(
            Icons.close,
            size: screenWidth * 0.06,
          ),
        ),
      ),
      body: Container(
        width: screenWidth * 1.5,
        height: screenHeight,
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
        alignment: Alignment.centerLeft,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Column(
            children: [
              Container(
                width: screenWidth * 1.4,
                height: screenHeight * 0.06,
                margin: EdgeInsets.only(top: screenWidth * 0.02),
                decoration: BoxDecoration(
                  color: Colors.cyan.shade600.withOpacity(0.5)
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(width: screenWidth * 0.04,),
                    _titleTable(name: 'Month', fontSize: screenWidth * 0.035, color: Colors.grey.shade50),
                    _titleTable(name: 'Opening', fontSize: screenWidth * 0.035, color: Colors.grey.shade50),
                    _titleTable(name: 'Principal', fontSize: screenWidth * 0.035, color: Colors.grey.shade50),
                    _titleTable(name: 'Interest', fontSize: screenWidth * 0.035, color: Colors.grey.shade50),
                    _titleTable(name: 'EMI', fontSize: screenWidth * 0.035, color: Colors.grey.shade50),
                    _titleTable(name: 'Closing', fontSize: screenWidth * 0.035, color: Colors.grey.shade50),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  width: screenWidth * 1.4,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 0.5
                    )
                  ),
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: state.tableData.length,
                      itemBuilder: (context, index) {
                        return Container(
                          color: index % 2 == 0 ? Colors.grey.shade200 : Colors.white,
                          //padding: EdgeInsets.only(left: screenWidth * 0.015),
                          child: Row(
                              children: [
                                SizedBox(width: screenWidth * 0.04,),
                                _rsTable(name: state.tableData[index].month.toString(), fontSize: screenWidth * 0.030, color: Colors.grey.shade700),
                                _rsTable(name: formatString(value:state.tableData[index].opening.toString()), fontSize: screenWidth * 0.03, color: Colors.grey.shade700),
                                _rsTable(name: formatString(value:state.tableData[index].principal.toString()), fontSize: screenWidth * 0.03, color: Colors.grey.shade700),
                                _rsTable(name: formatString(value:state.tableData[index].interest.toString()), fontSize: screenWidth * 0.03, color: Colors.grey.shade700),
                                _rsTable(name: formatString(value:state.tableData[index].emi.toString()), fontSize: screenWidth * 0.03, color: Colors.grey.shade700),
                                _rsTable(name: formatString(value:state.tableData[index].closing.toString()), fontSize: screenWidth * 0.03, color: Colors.grey.shade700),
                              ]),
                        );
                      }),
                ),
              ),
              SizedBox(
                height: screenHeight * 0.02,
              )
            ],
          ),
        ),
      ),
    );
  }
}
