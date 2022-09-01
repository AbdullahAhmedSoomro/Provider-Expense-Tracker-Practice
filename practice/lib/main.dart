import 'package:flutter/material.dart';
import 'package:practice/models/expense_state.dart';
import 'package:practice/models/provider_date_state.dart';
import 'package:practice/screens/home.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ProviderDateState(),
        ),
        ChangeNotifierProvider(
          create: (_) => ExpenseState(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
