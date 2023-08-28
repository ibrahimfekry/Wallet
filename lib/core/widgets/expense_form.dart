import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/database_provider.dart';
import '../../models/expense.dart';
import '../constants/icons.dart';

class ExpenseForm extends StatefulWidget {
  const ExpenseForm({super.key});

  @override
  State<ExpenseForm> createState() => _ExpenseFormState();
}

class _ExpenseFormState extends State<ExpenseForm> {
  final _title = TextEditingController();
  final _amount = TextEditingController();
  DateTime? _date;
  String _initialValue = 'Other';

  _pickDate() async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2023),
        lastDate: DateTime.now());
    if(pickedDate != null){
      setState(() {
        _date = pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DatabaseProvider>(context ,listen: true);
    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      padding: EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              controller: _title,
              decoration: const InputDecoration(
                labelText: 'Title of expense',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: _amount,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Amount of expense'),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                    child: Text(
                        _date != null ? _date.toString() : 'Select Date ')),
                IconButton(
                    onPressed: () => _pickDate(), icon: const Icon(Icons.calendar_month))
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const Expanded(child: Text('Category')),
                Expanded(child: DropdownButton(
                    items: icons.keys.map((e) => DropdownMenuItem(value: e,child: Text(e),)).toList(),
                    value: _initialValue,
                    onChanged: (newValue){
                      setState(() {
                        _initialValue = newValue!;
                      });
                    },
                )),
              ],
            ),
            const SizedBox(height: 20,),
            ElevatedButton.icon(
                onPressed: (){
                  if(_title.text != '' &&_amount.text != ''){
                    //create an expense
                    final file = Expense(
                      id: 0,
                      title: _title.text,
                      amount: double.parse(_amount.text),
                      date: _date != null ? _date! :DateTime.now(),
                      category:_initialValue,
                    );
                    //and add it to database
                    provider.addExpense(file);
                    //close the bottom sheet
                    Navigator.pop(context);
                  }
                },
                label: Text('Add expense'),
              icon: const Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
