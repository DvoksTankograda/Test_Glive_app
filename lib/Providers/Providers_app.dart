import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';



class PointsManager extends ChangeNotifier { //задача класса управлять списком точек (удаление, создание и тд) и уведомлять слушателей

  List<LatLng> points = [];
  List<Marker> markers = [];

  void retPositionMap(LatLng coordinate) {
    points.add(
        LatLng(coordinate.latitude, coordinate.longitude)
    );
    markers.add(
        Marker(
            point: LatLng(coordinate.latitude, coordinate.longitude),
            builder: (context) => const Icon(Icons.accessibility_new_outlined,)
        )
    );
    notifyListeners();
  }

  void deletePoint(int index) {
    points.removeAt(index);
    markers.removeAt(index);
    notifyListeners();
  }







}



