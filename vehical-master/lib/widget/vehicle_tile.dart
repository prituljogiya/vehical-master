import 'package:flutter/material.dart';
import 'package:vehical/api/vehicle_model.dart';
import 'package:vehical/screen/vehical_profile.dart';
import 'package:vehical/widget/apptext.dart';

class VehicleTile extends StatelessWidget {
  const VehicleTile({super.key, required this.vehicle});

  final Vehicle vehicle;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            text: vehicle.number,
            size: 16,
          ),
          AppText(
            text: vehicle.model,
            fontweight: FontWeight.normal,
            size: 16,
          ),
        ],
      ),
      trailing: Icon(Icons.arrow_forward_ios),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => VehicalProflie(
              vehicle: vehicle,
            ),
          ),
        );
      },
    );
  }
}
