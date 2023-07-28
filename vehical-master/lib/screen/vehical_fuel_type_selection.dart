import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vehical/api/model.dart';
import 'package:vehical/providers/vehicle_provider.dart';
import 'package:vehical/screen/screen_list.dart';
import 'package:vehical/widget/widget_list.dart';


class FuelTypeSelection extends StatefulWidget {
  const FuelTypeSelection({Key? key}) : super(key: key);

  @override
  State<FuelTypeSelection> createState() => _FuelTypeSelectionState();
}

class _FuelTypeSelectionState extends State<FuelTypeSelection> {
  @override
  Widget build(BuildContext context) {
    final vehicleProvider = Provider.of<VehicleProvider>(context);

    return Scaffold(
      appBar: CustomAppBar(title: " Select Fuel Type", onBackTap: (){Navigator.pop(context);}
          , isSearch: false),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: fueltype.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(fueltype[index]),contentPadding: EdgeInsets.all(10),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {

                      vehicleProvider.setVehicleFuelType(fueltype[index]);

                      Navigator.push(context, MaterialPageRoute(builder: (context) => TransmissionSelect(),));

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
