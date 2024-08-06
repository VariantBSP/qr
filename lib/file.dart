import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

class Firepage extends StatelessWidget {
  const Firepage({super.key});

  @override
  
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

     return Scaffold(

        appBar: AppBar(
          backgroundColor: const Color(0xFF2E6F11),
          title: const Text('QR Code',  style:TextStyle(color: Colors.white)),
        ),
        body: Center(
        child: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('Trees').snapshots(),
        builder: (context,snapshot){
          List<Row> treeWidgets = [
            Row(
              children: [
                Text("vast")
              ],
            )
          ];
          if(snapshot.hasData)
          {
            final trees = snapshot.data?.docs.reversed.toList();

            for(var tree in trees!)
            {
              final treeWidget = Row(
                children: [
                  Text(tree?['name']??'',),
              //    Text(tree['details']),
              //    Text(tree['uses']),
                ],
              );
              treeWidgets.add(treeWidget);
            }
          }

          return Expanded(
            child: ListView(
              children: treeWidgets,
            ),
          );
        })
    ));
  }
}
