import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vehical/api/model.dart';
import 'package:vehical/widget/widget_list.dart';
import 'package:vehical/providers/vehicle_provider.dart';
import 'package:vehical/screen/screen_list.dart';


class ModelSelection extends StatefulWidget {
  const ModelSelection({Key? key}) : super(key: key);

  @override
  State<ModelSelection> createState() => _ModelSelectionState();
}

class _ModelSelectionState extends State<ModelSelection> {
  @override
  Widget build(BuildContext context) {
    final vehicleProvider = Provider.of<VehicleProvider>(context);

    return Scaffold(
      appBar: CustomAppBar(
          title: "Select Model",
          onBackTap: () {
            Navigator.pop(context);
          },
          isSearch: false),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: TwoWheelerHondaVehical.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(TwoWheelerHondaVehical[index]),
                    contentPadding: EdgeInsets.all(10),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      // Do something when the list item is tapped
                      print('Item ${TwoWheelerHondaVehical[index]} tapped');

                      vehicleProvider.setVehicleModel(TwoWheelerHondaVehical[index]);

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FuelTypeSelection(),
                        ),
                      );
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
