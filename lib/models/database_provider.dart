import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../core/constants/icons.dart';
import 'expense.dart';
import 'expense_category.dart';

class DatabaseProvider with ChangeNotifier {
  List<ExpenseCategory> _categories = [];
  List<ExpenseCategory> get categories => _categories;

  List<Expense> _expenses = [];
  List<Expense> get expenses => _expenses;
  Database? _database;
  Future<Database> get database async {
    // database directory
    final dbDirectory = await getDatabasesPath();
    // database name
    const dbName = 'expense_tc.db';
    // full path
    final path = join(dbDirectory, dbName);

    _database = await openDatabase(
      path,
      version: 1,
      onCreate: _createDb, // will create this separately
    );

    return _database!;
  }

  static const cTable = 'categoryTable';
  static const eTable = 'expenseTable';

  //Create dbFunction
  Future<void> _createDb(Database db, int version) async {
    // this method runs only once. when the database is being created
    // so create the tables here and if you want to insert some initial values
    // insert it in this function.

    await db.transaction((txn) async {
      // category table
      await txn.execute('''CREATE TABLE $cTable(
        title TEXT,
        entries INTEGER,
        totalAmount TEXT
      )''');
      // expense table
      await txn.execute('''CREATE TABLE $eTable(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT,
        amount TEXT,
        date TEXT,
        category TEXT
      )''');

      // insert the initial categories.
      // this will add all the categories to category table and initialize the 'entries' with 0 and 'totalAmount' to 0.0
      for (int i = 0; i < icons.length; i++) {
        await txn.insert(cTable, {
          'title': icons.keys.toList()[i],
          'entries': 0,
          'totalAmount': (0.0).toString(),
        });
      }
    });
  }

  //Method to fetch categories
  Future<List<ExpenseCategory>> fetchCategories() async {
    // get the database
    final db = await database;
    return await db.transaction((txn) async {
      return await txn.query(cTable).then((data) {
        // 'data' is our fetched value
        // convert it from "Map<String, object>" to "Map<String, dynamic>"
        final converted = List<Map<String, dynamic>>.from(data);
        // create a 'ExpenseCategory'from every 'map' in this 'converted'
        List<ExpenseCategory> nList = List.generate(converted.length,
            (index) => ExpenseCategory.fromString(converted[index]));
        // set the value of 'categories' to 'nList'
        _categories = nList;
        // return the '_categories'
        return _categories;
      });
    });
  }

  Future<void> updateCategory(String category, int nEntries, double nTotalAmount,) async {
    final db = await database;
    await db.transaction((txn) async {
      await txn.update(
        cTable,{
          'entries': nEntries,
          'totalAmount': nTotalAmount.toString(),
        },
        where: 'title == ?', // in table where the title ==
        whereArgs: [category], // this category.
      ).then((_) {
        // after updating in database. update it in our in-app memory too.
        var file = _categories.firstWhere((element) => element.title == category);
        file.entries = nEntries;
        file.totalAmount = nTotalAmount;
        //notify the listeners
        notifyListeners();
      });
    });
  }

  Future<void> addExpense(Expense expense) async {
    final db = await database;
    await db.transaction((txn) async {
      await txn
          .insert(eTable, expense.toMap(),
              conflictAlgorithm: ConflictAlgorithm.replace)
          .then((generatedId) {
        //after inserting in database , we store it in in-app memory with new expense
        final file = Expense(
            id: generatedId,
            title: expense.title,
            amount: expense.amount,
            date: expense.date,
            category: expense.category);
        _expenses.add(file);
        //notify the listeners about the change in value
        notifyListeners();

        var data = calculateEntriesAndAmount(expense.category);
        updateCategory(expense.category, data['entries'], data['totalAmount']);
      });
    });
  }

Map<String ,dynamic>calculateEntriesAndAmount(String category){
    double total = 0.0;
    var list = _expenses.where((element) => element.category == category);
    for(final i in list){
      total += i.amount ;
    }
    return {'entries': list.length,'totalAmount':total };
}
}
