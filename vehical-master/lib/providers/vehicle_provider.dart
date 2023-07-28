import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vehical/api/vehicle_model.dart';

class VehicleProvider extends ChangeNotifier {
  Vehicle _vehicle = const Vehicle(
    number: '',
    make: '',
    model: '',
    fuelType: '',
    transmission: '',
  );

  Vehicle get vehicle => _vehicle;

  Future<List<Vehicle>> getVehicleList() async {
    final prefs = await SharedPreferences.getInstance();
    final vehicleList = prefs.getStringList('vehicles') ?? [];
    return vehicleList
        .map((vehicleData) => Vehicle.fromMap(jsonDecode(vehicleData)))
        .toList();
  }

  Future<List<String>> getVehicleStringList() async {
    final prefs = await SharedPreferences.getInstance();
    final vehicleList = prefs.getStringList('vehicles') ?? [];
    return vehicleList;
  }

  Future<void> storeVehicle() async {
    final prefs = await SharedPreferences.getInstance();
    final vehicleList = await getVehicleStringList();
    prefs.setStringList(
      'vehicles',
      vehicleList..add(jsonEncode(_vehicle.toMap())),
    ).then(
      (value) {
        if (value) {
          print('Vehicle stored successfully!');
          notifyListeners();
        }else {
          print('Some error occurred!');
        }
      },
    );
  }

  void setVehicleNumber(String number) {
    _vehicle = _vehicle.copyWith(number: number);
    notifyListeners();
  }

  void setVehicleMake(String make) {
    _vehicle = _vehicle.copyWith(make: make);
    notifyListeners();
  }

  void setVehicleModel(String model) {
    _vehicle = _vehicle.copyWith(model: model);
    notifyListeners();
  }

  void setVehicleFuelType(String fuelType) {
    _vehicle = _vehicle.copyWith(fuelType: fuelType);
    notifyListeners();
  }

  void setTransmission(String transmission) {
    _vehicle = _vehicle.copyWith(transmission: transmission);
    notifyListeners();
  }
}
