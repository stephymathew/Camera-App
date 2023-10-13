import 'package:flutter/material.dart';
import 'package:ui_designs/db/functions/db_functions.dart';
import 'package:ui_designs/screens/open.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await createDataBase();

  runApp(const Myapp());
}
class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
   
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:OpenScreen()
    );
    
  }
}





