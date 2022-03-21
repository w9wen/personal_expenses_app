import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addNewTransaction;

  NewTransaction(this.addNewTransaction);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    // print("submitData");
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }
    // print("es: " + enteredTitle);
    widget.addNewTransaction(
      enteredTitle,
      enteredAmount,
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: const InputDecoration(labelText: "Title"),
              controller: titleController,
              keyboardType: TextInputType.text,
              // onChanged: (text) {
              //   titleInput = text;
              // },
            ),
            TextField(
              decoration: const InputDecoration(labelText: "Amount"),
              controller: amountController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (_) => submitData(),
              // onChanged: (text) => amountInput = text,
            ),
            Container(
              height: 70,
              child: Row(
                children: [
                  Text("No Date Chosen!"),
                  FlatButton(
                    textColor: Theme.of(context).primaryColor,
                    onPressed: null,
                    child: Text(
                      "Choose Date",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            RaisedButton(
              child: const Text("Add Transaction"),
              color: Theme.of(context).primaryColor,
              textColor: Theme.of(context).textTheme.button?.color,
              onPressed: () {
                print("onPressed");
                submitData();
                // print(titleController.text);
              },
            ),
          ],
        ),
      ),
    );
  }
}
