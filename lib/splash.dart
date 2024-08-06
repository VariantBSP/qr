import 'package:flutter/material.dart';
import 'package:qr_code/Model/tree_model.dart';
import 'package:qr_code/Service/tree_database_service.dart';
import 'package:qr_code/loader.dart';

class ListFilter extends StatefulWidget {
  const ListFilter({super.key, required this.name});
  final String name;

  @override
  _ListFilterState createState() => _ListFilterState();
}

class _ListFilterState extends State<ListFilter> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF94BB86),
        body: SafeArea(
        child: StreamBuilder<List<TreeModel>>(
        stream: TreeDatabaseService().ListTree(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Loader();
          }
          final List<TreeModel>? trees = snapshot.data;

          String filterName = '';
          List<TreeModel>? filteredTrees = [];

          filteredTrees = trees;


          // Function to filter products by price
          void filterTrees(String name) {

              filterName = name;
              // Use the 'where' method to
              // filter products by price
              filteredTrees = trees
                  ?.where((tree) =>
                  tree.name.contains(filterName))
                  .toList();

          }

          filterTrees(widget.name);

          return ListView(
            padding: const EdgeInsets.only(top: 20.0),
            children: [
              SizedBox(
                height: 250,
                child: Image(image: NetworkImage(filteredTrees![0].imageLink)),
              ),
              const SizedBox(
                height: 20,
              ),


              Card(
    //            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.0)),
                child: ListTile(
                  splashColor: Colors.blue.withAlpha(30),
                  title: Row (
                    children: [
                    Text('Common Names:', style: const TextStyle(fontSize: 23,)),
                    SizedBox(width:10),
                    Text(filteredTrees![0].name, style: const TextStyle(fontSize: 23,)),
                    ]
                    ),
                  subtitle: Row (
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Botanical Name:', style: const TextStyle(fontSize: 20,)),
                        SizedBox(width:10),
                        Text(filteredTrees![0].botanicalName, style: const TextStyle(fontSize: 20,)),
                      ]
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),


              Card(
//                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.0)),
                child: ListTile(
                  title: const Text('Details', style: const TextStyle(fontSize: 23,)),
                  subtitle: Text(filteredTrees![0].details,
                    style: const TextStyle(fontSize: 20,),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),


              Card(
  //              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.0)),
                child: ListTile(
                  title: const Text('Uses', style: const TextStyle(fontSize: 23,)),
                  subtitle: Text(filteredTrees![0].uses,
                    style: const TextStyle(fontSize: 20,),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),

              Card(
   //              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.0)),
                child: ListTile(
                  title: const Text('Symbolism', style: const TextStyle(fontSize: 23,)),
                  subtitle: Text(filteredTrees![0].symbolism,
                    style: const TextStyle(fontSize: 20,),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),

            ],
          );
        }
    )
        ),
    );
  }

  }


