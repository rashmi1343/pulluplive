import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapScreen extends StatefulWidget {
  double lat;
  double long;

  @override
  GoogleMapScreenState createState() => GoogleMapScreenState();

  GoogleMapScreen({
    required this.lat,
    required this.long,
  });
}

class GoogleMapScreenState extends State<GoogleMapScreen> {
  Completer<GoogleMapController> _controller = Completer();

  //final Set<Marker> _markers = {};

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  Set<Marker> markers = Set(); //markers for google map

  int numDeltas = 50; //number of delta to devide total distance
  int delay = 50; //milliseconds of delay to pass each delta
  var i = 0;
  double? deltaLat;
  double? deltaLng;
  var position; //position variable while moving marker

  @override
  void initState() {
    position = [
      LatLng(widget.lat, widget.long).latitude,
      LatLng(widget.lat, widget.long).longitude
    ]; //initial position of moving marker
    addMarkers();
    super.initState();
  }

  addMarkers() async {
    markers.add(
      Marker(
        onTap: () {
          print('Tapped');
        },
        draggable: true,
        markerId: MarkerId(LatLng(widget.lat, widget.long).toString()),
        position: LatLng(widget.lat, widget.long),
        icon: BitmapDescriptor.defaultMarker,
        onDragEnd: ((newPosition) {
          print("New Lat:${newPosition.latitude}");
          print("New Long:${newPosition.longitude}");
        }),
      ),
    );

    setState(() {
      //refresh UI
    });
  }

  transition(result) {
    i = 0;
    deltaLat = (result[0] - position[0]) / numDeltas;
    deltaLng = (result[1] - position[1]) / numDeltas;
    moveMarker();
  }

  moveMarker() {
    position[0] += deltaLat;
    position[1] += deltaLng;
    var latlng = LatLng(position[0], position[1]);

    markers = {
      Marker(
        markerId: MarkerId("movingmarker"),
        position: latlng,
        icon: BitmapDescriptor.defaultMarker,
      )
    };

    setState(() {
      //refresh UI
    });

    if (i != numDeltas) {
      i++;
      Future.delayed(Duration(milliseconds: delay), () {
        moveMarker();
      });
    }
  }

  // void initState() {
  //   super.initState();
  //   _markers.add(Marker(
  //     // This marker id can be anything that uniquely identifies each marker.
  //     markerId: MarkerId(LatLng(widget.lat, widget.long).toString()),
  //     position: LatLng(widget.lat, widget.long),
  //     infoWindow: InfoWindow(
  //       title: 'Really cool place',
  //       snippet: '5 Star Rating',
  //     ),
  //     icon: BitmapDescriptor.defaultMarker,
  //   ));
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              color: Color(0xff00000029),
              offset: Offset(0, 0.0),
              blurRadius: 6.0,
            )
          ]),
          child: AppBar(
            elevation: 4,
            shadowColor: Color(0xff00000029),
            toolbarHeight: 53,
            leading: IconButton(
              iconSize: 25,
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () {
                //  Navigator.of(context).pushNamed('/dashboard');
              },
            ),
            centerTitle: true,
            title: Container(
              height: 28.47,
              width: 97,
              child: Image.asset("assets/images/pull-logo-2.png"),
            ),
            actions: [
              Container(
                child: SvgPicture.asset(
                  "assets/images/dots.svg",
                  color: Colors.black,
                ),
              )
            ],
          ),
        ),
        preferredSize: Size.fromHeight(kToolbarHeight),
      ),
      body: GoogleMap(
        zoomGesturesEnabled: true,
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: LatLng(widget.lat, widget.long),
          zoom: 11.0,
        ),
        mapType: MapType.normal,
        markers: markers,
      ),
    );
  }
}
