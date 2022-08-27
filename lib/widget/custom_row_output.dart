import 'package:flutter/material.dart';

class CustomRowOutput extends StatelessWidget {
  const CustomRowOutput({Key? key, required this.height, required this.width, required this.rowTitle, required this.rowResult}) : super(key: key);

  final double height;
  final double width;
  final String rowTitle;
  final String rowResult;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: height * 0.007),
      padding: EdgeInsets.only(left: width * 0.05),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: Text(
              rowTitle,
              style: TextStyle(
                color: Colors.grey.shade700,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.3,
                overflow: TextOverflow.ellipsis,
                fontSize: width * 0.035,
              ),
            ),
          ),
          Expanded(
            child: Text(
              " : ",
              style: TextStyle(
                color: Colors.grey.shade700,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.3,
                overflow: TextOverflow.ellipsis,
                fontSize: width * 0.035,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Text(rowResult,
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.w400,
                letterSpacing: 0.3,
                overflow: TextOverflow.ellipsis,
                fontSize: width * 0.035,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
