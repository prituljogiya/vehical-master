import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vehical/providers/vehicle_provider.dart';
import 'package:vehical/screen/vehical_home_screen.dart';
import 'package:vehical/screen/vehical_list.dart';

void main() {
  // runApp(ChangeNotifierProvider(
  //   create: (_) => VehicleNumberValidator(),
  //   child: MyApp(),
  // ),);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => VehicleNumberValidator()),
        ChangeNotifierProvider(create: (context) => VehicleProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        // useMaterial3: true,
      ),
      home: const VehicleList(),
    );
  }
}


