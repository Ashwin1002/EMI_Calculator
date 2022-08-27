import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField({Key? key, required this.title, required this.controller, required this.hintText, required this.errorText, required this.height, required this.width, required this.action}) : super(key: key);

  final String title;
  final TextEditingController controller;
  final String hintText;
  final String errorText;
  final double height;
  final double width;
  final TextInputAction action;


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          alignment: Alignment.topLeft,
          margin: EdgeInsets.only(left: width * 0.03, right: width * 0.03, top: height * 0.01),
         //margin: const EdgeInsets.only(left: 20, right: 20, top: 8),
          child: Text(
            title,
            style: TextStyle(
              color: Colors.grey.shade700,
              fontWeight: FontWeight.w400,
              letterSpacing: 0.4,
              overflow: TextOverflow.ellipsis,
              fontSize: width * 0.035
            ),
          ),
        ),
        Container(
          //height: height * 0.08,
          margin: EdgeInsets.only(left: width * 0.03, right: width * 0.03),
          //margin: EdgeInsets.only(left: width * 0.03, right: width * 0.03, top: height * 0.01),
          child: TextFormField(
            maxLines: 1,
            controller: controller,
            validator: (value) {},
            textInputAction: action,
            decoration: InputDecoration(
                isDense: true,
                helperText: "",
                hintText: hintText,
                hintStyle: TextStyle(
                    color: Colors.grey.shade500,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.2,
                    overflow: TextOverflow.ellipsis,
                    fontSize: width * 0.03
                ),
                contentPadding: EdgeInsets.only(top: height * 0.015, bottom: height * 0.015),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                border: UnderlineInputBorder(
                  borderSide:
                  BorderSide(width: 0.5, color: Colors.grey.shade300),
                ),
                errorText: null,
            ),
          ),
        ),
      ],
    );
  }
}
