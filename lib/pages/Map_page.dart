import 'package:app_15_1_24/Providers/Providers_app.dart';
import 'package:app_15_1_24/pages/ListPoints/List_points.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';



class MapPage extends StatefulWidget {
  const MapPage({ super.key });

  @override
  State<MapPage> createState() => MapPageState();
}

class MapPageState extends State<MapPage> {
  final _mapController = MapController();




  @override
  void dispose() {
    _mapController.dispose();
    super.dispose();
  }

  void _list() {
    final  navigator = Navigator.of(context);
    navigator.push(
        MaterialPageRoute<void>(builder: (context) => const ListPoints()));
  }


  @override
  Widget build(BuildContext context) {
    final provider = context.watch<PointsManager>();


    return Scaffold(
      appBar: AppBar(
        title: const Text('Map Screen'),
        centerTitle: true,
      ),
      body: FlutterMap(
        mapController: _mapController,
        options: MapOptions(
            center: LatLng(56.8519, 60.6122),
            zoom: 10,
            onTap: (position, latLng) => provider.retPositionMap(latLng),
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'com.example.flutter_map_example',
          ),
          CurrentLocationLayer(),
          MarkerLayer(
            markers: provider.markers
          )
        ]
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: _list,
        child: const Icon(Icons.list_alt_outlined),
      ),
    );
  }
}

