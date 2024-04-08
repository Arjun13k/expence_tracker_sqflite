import 'package:expence_tracker/controller/records_controller.dart';
import 'package:expence_tracker/view/bottomsheet_screen/bottomsheet.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await RecordsController.initDb();
  runApp(ExpenceTracker());
}

class ExpenceTracker extends StatelessWidget {
  const ExpenceTracker({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BottomTabSheet(),
    );
  }
}
