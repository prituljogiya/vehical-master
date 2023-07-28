import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vehical/providers/vehicle_provider.dart';
import 'package:vehical/screen/vehical_list.dart';
import 'package:vehical/screen/vehical_model_selection.dart';
import 'package:vehical/screen/vehical_profile.dart';

import '../api/model.dart';
import '../widget/custom_appbar.dart';

class TransmissionSelect extends StatefulWidget {
  const TransmissionSelect({Key? key}) : super(key: key);

  @override
  State<TransmissionSelect> createState() => _TransmissionSelectState();
}

class _TransmissionSelectState extends State<TransmissionSelect> {
  @override
  Widget build(BuildContext context) {
    final vehicleProvider = Provider.of<VehicleProvider>(context);

    return Scaffold(
      appBar: CustomAppBar(
          title: " Select Transmission",
          onBackTap: () {
            Navigator.pop(context);
          },
          isSearch: false),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: Transmission.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(Transmission[index]),
                    contentPadding: EdgeInsets.all(10),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () async {
                      vehicleProvider.setTransmission(Transmission[index]);

                      // Now store it locally
                      vehicleProvider.storeVehicle();

                      Navigator.popUntil(context, (route) => false);
                      Navigator.push(context, MaterialPageRoute(builder: (context) => VehicleList(),));
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
