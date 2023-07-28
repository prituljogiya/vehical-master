import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vehical/providers/vehicle_provider.dart';
import 'package:vehical/screen/screen_list.dart';
import 'package:vehical/widget/widget_list.dart';



class VehicalHomeScreen extends StatefulWidget {
  const VehicalHomeScreen({Key? key}) : super(key: key);

  @override
  State<VehicalHomeScreen> createState() => _VehicalHomeScreenState();
}

class _VehicalHomeScreenState extends State<VehicalHomeScreen> {
  @override
  Widget build(BuildContext context) {
    final vehicleNumberValidator = Provider.of<VehicleNumberValidator>(context);
    final vehicleProvider = Provider.of<VehicleProvider>(context);

    return Scaffold(
      appBar: CustomAppBar(
        isSearch: false,
        onBackTap: () {},
        title: "Create new vehical profile",
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("VEHICAL NUMBER"),
            TextFormField(
              textCapitalization: TextCapitalization.characters,
              decoration: InputDecoration(
                  border: const OutlineInputBorder(
                      borderRadius: BorderRadius.zero,
                      borderSide: BorderSide(color: Colors.black)),
                  hintText: "Enter vehical number",
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  errorText: vehicleNumberValidator.errorText),
              onChanged: (value) =>
                  vehicleNumberValidator.setVehicleNumber(value),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.bottomRight,
                child: GestureDetector(
                  onTap: () {
                    if (vehicleNumberValidator.isValid()) {
                      // Handle the data, e.g., save the vehicle number
                      final vehicleNumber =
                          vehicleNumberValidator.vehicleNumber;
                      print('Vehicle Number: $vehicleNumber');

                      // Updating vehicle number in provider
                      vehicleProvider.setVehicleNumber(vehicleNumber);

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MakeSelection()),
                      );
                    }
                  },
                  child: const CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.deepPurple,
                    child: Icon(Icons.arrow_forward_ios, color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class VehicleNumberValidator extends ChangeNotifier {
  String _vehicleNumber = '';
  String _errorText = '';

  String get vehicleNumber => _vehicleNumber;

  String get errorText => _errorText;

  void setVehicleNumber(String value) {
    _vehicleNumber = value;
    _validateVehicleNumber();
    notifyListeners();
  }

  void _validateVehicleNumber() {
    final pattern = r'^[A-Z]{2}\d{2}[A-Z]{1,2}\d{4}$';
    final regExp = RegExp(pattern);
    if (!regExp.hasMatch(_vehicleNumber)) {
      _errorText = 'Enter a valid vehicle number';
    } else {
      _errorText = '';
    }
  }

  bool isValid() {
    return _errorText.isEmpty;
  }
}
