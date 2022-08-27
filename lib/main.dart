import 'package:emi_calculator/state/index_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screen/Index/index.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => IndexState()
        ),
      ],
      child: MaterialApp(
        title: 'EMI Calculator',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const IndexPage(),
      ),
    );
  }
}

