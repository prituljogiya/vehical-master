import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vehical/providers/vehicle_provider.dart';
import 'package:vehical/screen/screen_list.dart';
import 'package:vehical/widget/widget_list.dart';


class VehicleList extends StatelessWidget {
  const VehicleList({super.key});

  @override
  Widget build(BuildContext context) {
    final vehicleProvider = Provider.of<VehicleProvider>(context);

    return Scaffold(
      appBar: CustomAppBar(
        isSearch: false,
        onBackTap: () {},
        title: "Vehicles",
      ),
      body: FutureBuilder(
        future: vehicleProvider.getVehicleList(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final vehicleList = snapshot.data!;

            return ListView.builder(
              itemCount: vehicleList.length,
              itemBuilder: (context, index) {
                return VehicleTile(vehicle: vehicleList[index],);
              },
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: AppText(
                text: snapshot.error.toString(),
              ),
            );
          }

          return const CircularProgressIndicator();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => VehicalHomeScreen(),));
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.deepPurple,
      ),
    );
  }
}
