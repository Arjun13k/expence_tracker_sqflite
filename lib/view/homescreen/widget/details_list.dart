import 'package:expence_tracker/controller/records_controller.dart';
import 'package:flutter/material.dart';

class DetailsList extends StatelessWidget {
  const DetailsList(
      {super.key,
      required this.amount,
      required this.category,
      required this.date,
      required this.note});
  final String category;
  final int amount;
  final String date;
  final String note;
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.green.withOpacity(.4),
            child: Icon(Icons.arrow_upward, color: Colors.green),
          ),
          title: Text(category),
          subtitle: Text(note),
          trailing: Column(
            children: [
              Text(
                amount.toString(),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              Text(date)
            ],
          ),
        ),
        // child: Row(
        //   children: [

        //     SizedBox(
        //       width: 10,
        //     ),
        //     Column(
        //       children: [,],
        //     )
        //   ],
        // ),
      ),
    );
  }
}
