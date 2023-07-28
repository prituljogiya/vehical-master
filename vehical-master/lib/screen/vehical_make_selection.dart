import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vehical/api/model.dart';
import 'package:vehical/providers/vehicle_provider.dart';
import 'package:vehical/screen/screen_list.dart';
import 'package:vehical/widget/widget_list.dart';

class MakeSelection extends StatefulWidget {
  const MakeSelection({Key? key}) : super(key: key);

  @override
  State<MakeSelection> createState() => _MakeSelectionState();
}

class _MakeSelectionState extends State<MakeSelection> {
  @override
  Widget build(BuildContext context) {
    final vehicleProvider = Provider.of<VehicleProvider>(context);

    return Scaffold(
      appBar: CustomAppBar(title: " Select Make", onBackTap: (){Navigator.pop(context);}
      , isSearch: false),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: FourWheeler.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(FourWheeler[index]),contentPadding: EdgeInsets.all(10),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      vehicleProvider.setVehicleMake(FourWheeler[index]);
                     Navigator.push(context, MaterialPageRoute(builder: (context) => ModelSelection(),));

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
