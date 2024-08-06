import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
/*
class FireTree extends StatelessWidget {
  const FireTree({super.key});

  @override
  Widget build(BuildContext context) {
    return new StreamBuilder(
      stream: FirebaseFirestore.instance.collection('Trees').doc('Hildegardia').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return new Text("Loading...");
        }
        var treeDoc = snapshot.data;
        return new Text(treeDoc?['Botanical name']);
      }
    );
  }
}
*/

class Details extends StatelessWidget {
  const Details({super.key});
/*
  const getTree
  final ref = FirebaseFirestore.instance.ref();
  final snapshot = await ref.child('Trees/Hildergardia').get();
  if (snapshot.exists) {
    print(snapshot.value);
  } else {
    print ('no data available')
  }
*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tree Details')),
      body: SingleChildScrollView(
          child: Stack(children: [
      Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(
              height: 90,
              child: Image(image: AssetImage('images/neem.jpg')),
            ),
            const SizedBox(
              height: 20,
            ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Dongoyaro', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                Text('Botanical Name: Azadirachta indica', style: TextStyle(fontSize: 20,)),Text("ddd"),
                Text('Common Names: Neem tree, Margosa tree, Dogoyaro Tree', style: TextStyle(fontSize: 20,)),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Details', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                Text('Neem trees can reach 15–30 metres. and have attractive rounded crowns and thick furrowed bark. The compound leaves have toothed leaflets and are typically evergreen but do drop during periods of extreme drought. The small fragrant white flowers are bisexual and are borne in clusters in the axils of the leaves. The fruit is a smooth yellow-green drupe and has a sweet-flavoured pulp.', style: TextStyle(fontSize: 18,))
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Uses', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                Text('Nearly all parts of the neem tree are useful, and many of its medicinal and cosmetic uses are based on its antibacterial and antifungal properties. Neem is commonly used in shampoos for treating dandruff and in soaps or creams for skin conditions like acne. its young twigs are used directly as crude toothbrushes in rural areas.', style: TextStyle(fontSize: 18,))
              ],
            ),
          ],
        ),
      ),
    ])));
  }
}
