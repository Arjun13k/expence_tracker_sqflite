import 'package:expence_tracker/view/add_screen/widget/expense.dart';
import 'package:expence_tracker/view/add_screen/widget/income.dart';
import 'package:flutter/material.dart';

class AddScreen extends StatefulWidget {
  AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  var tabcontrollerIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: Icon(
            Icons.arrow_back,
            size: 30,
          ),
          title: Text(
            "Add Records",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          bottom: TabBar(
            padding: EdgeInsets.symmetric(horizontal: 30),
            onTap: (value) {
              setState(() {
                tabcontrollerIndex = value;
              });
            },
            labelColor: Colors.white,
            unselectedLabelColor: Colors.black.withOpacity(.4),
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 5),
            dividerHeight: 0,
            indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                shape: BoxShape.rectangle,
                color: Colors.black),
            tabs: [
              Tab(
                text: "Expense",
              ),
              Tab(
                text: "Income",
              )
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [tabcontrollerIndex == 0 ? Expense() : Income()],
            ),
          ),
        ),
        //
      ),
    );
  }
}
