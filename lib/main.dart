import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerornek/model/chart_provider.dart';
import 'package:providerornek/view/home_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ChartProvider(),
      builder: (context, child) => MaterialApp(
        theme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        home: HomeView(),

      ),
    );
  }
}
