import 'package:emi_calculator/screen/Index/Components/index_bottom_container.dart';
import 'package:emi_calculator/screen/Index/Components/index_body.dart';
import 'package:emi_calculator/state/index_state.dart';
import 'package:emi_calculator/widget/custom_form_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({Key? key}) : super(key: key);

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {

  @override
  void initState() {
    super.initState();
    Provider.of<IndexState>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'EMI Calculator'.toUpperCase(),
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: screenWidth * 0.04),
        ),
        elevation: 0.5,
      ),
      body: const IndexBody(),
      bottomSheet: const IndexBottomContainer(),
    );
  }
}
