import 'package:expence_tracker/controller/records_controller.dart';
import 'package:expence_tracker/model/list_model.dart';
import 'package:expence_tracker/view/homescreen/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Income extends StatefulWidget {
  const Income({super.key});

  @override
  State<Income> createState() => _IncomeState();
}

class _IncomeState extends State<Income> {
  TextEditingController amount = TextEditingController();
  TextEditingController category = TextEditingController();
  TextEditingController date = TextEditingController();
  TextEditingController note = TextEditingController();

  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Material(
          elevation: 7,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Amount"),
                  SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    controller: amount,
                    decoration: InputDecoration(
                        hintText: "Enter Amount",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text("Category"),
                  SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    controller: category,
                    decoration: InputDecoration(
                        hintText: "Select Category",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text("Date"),
                  SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    controller: date,
                    decoration: InputDecoration(
                        hintText: "Select Date",
                        suffixIcon: InkWell(
                            onTap: () async {
                              final selectDate = await showDatePicker(
                                  context: context,
                                  firstDate: DateTime(2024),
                                  lastDate: DateTime(2030));
                              if (selectDate != null) {
                                String formateDate =
                                    DateFormat("dd/MM/yyyy").format(selectDate);
                                date.text = formateDate.toString();
                              }
                              setState(() {});
                            },
                            child: Icon(Icons.calendar_month)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text("Note"),
                  SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    controller: note,
                    decoration: InputDecoration(
                        hintText: "Enter Note",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: InkWell(
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          ListModel model = ListModel(
                            amount: int.parse(amount.text),
                            category: category.text,
                            note: note.text,
                            date: date.text,
                            isIncome: true,
                          );
                          RecordsController.insertData(model);
                          print(model.amount);
                          setState(() {});
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomeScreen(),
                              ));
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(10)),
                        padding:
                            EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                        child: Text(
                          "Add Record",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
