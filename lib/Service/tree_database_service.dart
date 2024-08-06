import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:qr_code/Model/tree_model.dart';

class TreeDatabaseService{
  CollectionReference treeCollection =
    FirebaseFirestore.instance.collection("Trees");

    Stream <List<TreeModel>> ListTree(){
      return treeCollection.snapshots().map(treeFromFirestore);
    }

    List<TreeModel> treeFromFirestore(QuerySnapshot snapshot){
      return snapshot.docs.map((e) {
        Map<String, dynamic>? data = e.data()
            as Map<String,dynamic>?;

        return TreeModel(
            name: e.id,
            imageLink: data?['imageLink']??'',
            botanicalName: data?['botanicalName']??'',
            localName: data?['localName']??'',
            family: data?['family']??'',
            origin: data?['origin']??'',
            symbolism: data?['symbolism']??'',
            details: data?['details']??'',
            uses: data?['uses']??''
        );
      }).toList();
    }

}