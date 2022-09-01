import 'package:flutter/material.dart';
import 'package:practice/models/expense_state.dart';
import 'package:practice/models/expense_model.dart';
import 'package:intl/intl.dart';
import 'package:practice/models/provider_date_model.dart';
import 'package:provider/provider.dart';
import '../models/provider_date_state.dart';

class AddToScreen extends StatelessWidget {
  TextEditingController titleController = TextEditingController();
  TextEditingController descripController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add TO Screen"),
      ),
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: titleController,
            ),
            TextField(
              controller: descripController,
            ),
            TextField(
              controller: amountController,
              keyboardType: TextInputType.number,
            ),
            TextField(
              onTap: () async {
                await pickdate(context);
                dateController.text =
                    Provider.of<ProviderDateState>(context, listen: false)
                            .a
                            ?.date ??
                        "Msg5";
              },
              controller: dateController,
              readOnly: true,
            ),
            ElevatedButton(
              onPressed: () async {
                await pickdate(context);

                dateController.text =
                    Provider.of<ProviderDateState>(context, listen: false)
                            .a
                            ?.date ??
                        "Msg4";
              },
              child: Text("date"),
            ),
            Consumer2<ExpenseState, ProviderDateState>(
              builder: (BuildContext context, expenseModel, providerDate,
                  Widget? child) {
                return ElevatedButton(
                    onPressed: () {
                      expenseModel.updateData(
                        ExpenseModel(
                          title: titleController.text,
                          description: descripController.text,
                          amount: int.parse(amountController.text),
                          leading: providerDate.a!.date,
                        ),
                      );
                      Navigator.pop(context);
                    },
                    child: Text("Enter"));
              },
            )
          ],
        ),
      ),
    );
  }

  Future<void> pickdate(context) async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1950),
        lastDate: DateTime.now());
    if (pickedDate != null) {
      String formattedDate = DateFormat('dd MMM, yyyy').format(pickedDate);
      Provider.of<ProviderDateState>(context, listen: false)
          .updateDate(ProviderDateModel(date: formattedDate));
    } else {
      return showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Text("Error"),
          actions: [
            TextButton(
              onPressed: (() => Navigator.pop(context)),
              child: Text('Ok'),
            ),
          ],
        ),
      );
    }
  }
}
