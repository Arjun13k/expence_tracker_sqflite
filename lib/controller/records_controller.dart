import 'dart:developer';

import 'package:expence_tracker/model/list_model.dart';
import 'package:sqflite/sqflite.dart';

class RecordsController {
  static List<Map<String, Object?>> items = [];
  static List<ListModel> recordItem = [];
  static late Database database;
  static String? incomeAmt;
  static Future<void> initDb() async {
    // open the database
    database = await openDatabase("ExpenseGeneterDB", version: 1,
        onCreate: (Database db, int version) async {
      // When creating the db, create the table
      await db.execute(
          'CREATE TABLE Records (id INTEGER PRIMARY KEY, category TEXT, amount INTEGER, date TEXT, note TEXT,isIncome BIT)');
    });
  }

  static Future<void> insertData(ListModel model) async {
    await database.rawInsert(
        'INSERT INTO Records(category, amount, date, note ,isIncome) VALUES(?, ?, ?, ?,?)',
        [model.category, model.amount, model.date, model.note, model.isIncome]);
    log("message");
  }

  static Future<void> getData() async {
    items = await database.rawQuery('SELECT * FROM Records');
    recordItem = items
        .map((e) => ListModel(
            amount: int.parse(e['amount'].toString()),
            category: e['category'].toString(),
            note: e['note'].toString(),
            date: e['date'].toString(),
            isIncome: (e['isIncome'].toString() == '1') ? true : false))
        .toList();
  }

  static deleteData(var id) async {
    await database.rawDelete('DELETE FROM Records WHERE id = ?', [id]);
    await getData();
  }

  static Future calculateTotal() async {
    var data = await database.rawQuery(
        "SELECT SUM(amount) as Total FROM Records WHERE isIncome = 1");

    log(data.toString());
  }
}
