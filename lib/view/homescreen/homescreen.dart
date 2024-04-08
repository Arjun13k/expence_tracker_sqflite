import 'package:expence_tracker/controller/records_controller.dart';
import 'package:expence_tracker/view/homescreen/widget/details_list.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});
  late var incomeAmt;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    fetchData();
    super.initState();
  }

  Future<void> fetchData() async {
    await RecordsController.getData();
  }

  @override
  Widget build(BuildContext context) {
    void ateTotal() {
      widget.incomeAmt = RecordsController.calculateTotal();
    }

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: CircleAvatar(
            radius: 10,
            backgroundImage: NetworkImage(
                "https://avatars.githubusercontent.com/u/159136735?s=400&u=f0e6d7ae0a12de745342decb8d59dbee49a714d6&v=4"),
          ),
          title: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hello Arjun",
                style: TextStyle(color: Colors.white),
              ),
              Text("Welcome Back",
                  style: TextStyle(color: Colors.white, fontSize: 15))
            ],
          ),
          actions: [
            Icon(
              Icons.menu,
              color: Colors.white,
            )
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Balance",
                      textAlign: TextAlign.left,
                      style: TextStyle(color: Colors.white, fontSize: 15)),
                  Text("555555",
                      textAlign: TextAlign.left,
                      style: TextStyle(color: Colors.white, fontSize: 35)),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          height: 90,
                          width: 150,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 20),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.green.withOpacity(.4),
                                  child: Icon(Icons.arrow_upward,
                                      color: Colors.green),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  children: [
                                    Text(
                                      "Income",
                                      style: TextStyle(color: Colors.green),
                                    ),
                                    Text("\$6876",
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(fontSize: 20))
                                  ],
                                ),
                              ],
                            ),
                          )),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                          height: 90,
                          width: 150,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 20),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.red.withOpacity(.4),
                                  child: Icon(Icons.arrow_downward,
                                      color: Colors.red),
                                ),
                                Expanded(
                                  child: Column(
                                    children: [
                                      Text(
                                        "Expence",
                                        style: TextStyle(color: Colors.red),
                                      ),
                                      Text("\$6876",
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(fontSize: 20))
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ))
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Recent Transaction",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 350,
                    child: ListView.separated(
                        itemBuilder: (context, index) => DetailsList(
                              amount:
                                  RecordsController.recordItem[index].amount,
                              category:
                                  RecordsController.recordItem[index].category,
                              date: RecordsController.recordItem[index].date,
                              note: RecordsController.recordItem[index].note,
                            ),
                        separatorBuilder: (context, index) => SizedBox(
                              height: 10,
                            ),
                        itemCount: RecordsController.recordItem.length),
                  )
                  // Column(
                  //   children: List.generate(3, (index) => DetailsList()),
                  // )
                ],
              ),
            )
          ],
        ));
  }
}
