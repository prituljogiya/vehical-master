import 'package:flutter/material.dart';
import 'package:vehical/api/vehicle_model.dart';
import 'package:vehical/widget/apptext.dart';
import 'package:vehical/widget/custom_appbar.dart';

class VehicalProflie extends StatelessWidget {
  const VehicalProflie({Key? key, required this.vehicle}) : super(key: key);

  final Vehicle vehicle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        onBackTap: () {
          Navigator.pop(context);
        },
        title: '',
        isSearch: false,
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            width: MediaQuery.of(context).size.width,
            height: 300,
            color: Colors.deepPurple,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(text: '${vehicle.model} ${vehicle.fuelType}', color: Colors.white,),
                AppText(text: vehicle.number, fontweight: FontWeight.normal, size: 16, color: Colors.white,),
              ],
            ),
          ),
          const SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  _buildData(label: 'MAKE', data: vehicle.make),
                  const SizedBox(height: 20,),
                  _buildData(label: 'FUEL TYPE', data: vehicle.fuelType),
                ],
              ),
              Column(
                children: [
                  _buildData(label: 'MODEL', data: vehicle.model),
                  const SizedBox(height: 20,),
                  _buildData(label: 'TRANSMISSION', data: vehicle.transmission),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildData({required String label, required String data}) {
    return Column(
      children: [
        AppText(text: label, fontweight: FontWeight.normal, size: 18,),
        AppText(text: data, size: 24,),
      ],
    );
  }
}
