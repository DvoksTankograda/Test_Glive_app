import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';
import '../../Providers/Providers_app.dart';




class ListPoints extends StatefulWidget {
  const ListPoints({super.key});

  @override
  State<ListPoints> createState() => _listPointsState();
}

class _listPointsState extends State<ListPoints> {



  @override
  Widget build(BuildContext context) {
    final provider = context.watch<PointsManager>();
    final listPoints1 = provider.points;



     return Scaffold(
       backgroundColor: Colors.blueGrey,
       appBar: AppBar (
         title: const Text('List Points'),
         centerTitle: true,),
       body: ListView.builder (
         itemCount: listPoints1.length,
         itemBuilder: (BuildContext context , index) {
           return Dismissible(
             key: ValueKey <LatLng> (listPoints1[index]),
             child: Card(
               child: ListTile(title: Text(listPoints1[index].toString()),
                 trailing: IconButton(
                   icon: const Icon(
                     Icons.delete_sweep_outlined,
                     color: Colors.red,
                   ),
                   onPressed: () {
                     provider.deletePoint(index);
                     },
                  ),
                ),
              ),
              onDismissed: (direction) {
                provider.deletePoint(index);
                },
           );
           },
       ),
     );
   }
}









