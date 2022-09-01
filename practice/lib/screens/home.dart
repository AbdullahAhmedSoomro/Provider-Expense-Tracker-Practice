import 'package:flutter/material.dart';
import 'package:practice/models/expense_state.dart';
import 'package:practice/screens/addtoscreen.dart';
import 'package:provider/provider.dart';
import '../widgets/items.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Center(
        child: Column(
          children: [
            Consumer<ExpenseState>(
              builder: (BuildContext context, value, Widget? child) {
                return Expanded(
                  child: ListView.builder(
                    itemBuilder: ((context, index) => Items(
                          leading: value.a[index].leading ?? 'Msg1',
                          title: value.a[index].title ?? 'Msg2',
                          subtitle: value.a[index].description ?? 'Msg3',
                          trailing: value.a[index].amount ?? 0,
                        )),
                    itemCount: value.a.length,
                  ),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddToScreen(),
            ),
          );
        },
      ),
    );
  }
}
