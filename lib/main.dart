// Import Flutter package
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'firebase_options.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(InventoryApp());
}
class InventoryApp extends StatelessWidget {
  @override
Widget build(BuildContext context) {
  return MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Inventory Management App',
    home: Container(
    color:Colors.indigoAccent,
    child: InventoryHomePage(title: 'Inventory Home Page'),
    )
    );
  }
}
class InventoryHomePage extends StatefulWidget {
InventoryHomePage({Key? key, required this.title}) : super(key: key);
final String title;
@override
State<InventoryHomePage> createState() => _InventoryHomePageState();
}
class _InventoryHomePageState extends State<InventoryHomePage> {
final TextEditingController _nameController = TextEditingController();
final TextEditingController _priceController = TextEditingController();
final CollectionReference _products = FirebaseFirestore.instance.collection(
    'product',
  );
  
@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(
title: Text(widget.title),
),
body: Center(
child: Column(
mainAxisAlignment: MainAxisAlignment.center,
children: <Widget>[
Text(
'Inventory Management System',
),
// TODO: Implement inventory list view
],
),
),
floatingActionButton: FloatingActionButton(
onPressed: () {
// TODO: Implement add inventory item
},
tooltip: 'Add Item',
child: Icon(Icons.add),
),
);
}
}