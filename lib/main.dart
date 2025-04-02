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

Future<void> _createOrUpdate([DocumentSnapshot? documentSnapshot]) async {
  String action = 'create';
  if (documentSnapshot != null) {
    action = 'update';
    _nameController.text = documentSnapshot['name'];
    _priceController.text = documentSnapshot['quantity'].toString();
  }
  await showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    builder: (BuildContext ctx) {
      return Padding(
        padding: EdgeInsets.only(
          top: 20, left: 20, right: 20, bottom: MediaQuery.of(ctx).viewInsets.bottom + 20,
        ),
        child: Column(
         mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            TextField(
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              controller: _priceController,
              decoration: const InputDecoration(labelText: 'Quantity'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              child: Text(action == 'create' ? 'Create' : 'Update'),
              onPressed: () async {
                String name = _nameController.text;
                double price = double.parse(_priceController.text);
                if (name.isNotEmpty && price != null) {
                  if (action == 'create') {
                    await _products.add({"name": name, "quantity": price});
                  }
                  if (action == 'update') {
                    await _products.doc(documentSnapshot!.id).update({"name": name, "quantity": price});
                  }
                  _nameController.text = '';
                  _priceController.text = '';
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        ),
      );
    },
  );
}

// Deleting a product by id
  Future<void> _deleteProduct(String productId) async {
    await _products.doc(productId).delete();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('You have successfully deleted a product')),
    );
  }
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