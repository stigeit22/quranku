import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<Position> _getCurrentLocation() async {
  bool serviceEnabled;
  LocationPermission permission;

  // Check if location services are enabled
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    // Location services are not enabled, ask user to enable it
    return Future.error('Location services are disabled.');
  }

  // Check if the app has permission to access location data
  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    // Request location permission
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      // Location permission is not granted, ask user to grant it
      return Future.error('Location permission is denied.');
    }
  }

  // Get current location
  return await Geolocator.getCurrentPosition();
}

Future<Map<String, dynamic>> _fetchPrayerTimesForLocation(
    Position position) async {
  final latitude = position.latitude;
  final longitude = position.longitude;
  final url =
      'https://api.equran.id/jadwal-sholat?latitude=$latitude&longitude=$longitude';
  final response = await http.get(Uri.parse(url));
  final jsonResponse = json.decode(response.body);
  final data = jsonResponse['jadwal'];
  return data;
}
