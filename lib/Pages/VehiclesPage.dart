import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../models/models.dart';
import '../mockdata/mockdata.dart';



class VehiclesPage extends StatefulWidget {
  final Automakers automaker;
  VehiclesPage({ required this.automaker });

  @override
  _VehiclesPageState createState() => _VehiclesPageState();
}

class _VehiclesPageState extends State<VehiclesPage> {

  List<Vehicles> get getVehicles {
    final List<Vehicles> vehiclesList = [];
    vehiclesList.addAll(
      vehicles.where((vehicle) => vehicle.idAutomakers == widget.automaker.id)
    );

    return vehiclesList;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color(0xFFEEEEEE),
      appBar: AppBar(
        title: Text(widget.automaker.name),
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: ListView.builder(
          itemCount: getVehicles.length,
          itemBuilder: (context,index){
            return Card(
              elevation: 3,
              color: Colors.white,
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 16,),
                  Image.network(
                    getVehicles[index].image,
                    width: 300,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 16,),
                  Text(
                    getVehicles[index].name,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 8,),
                  Text(
                    "Valor: R\$ ${getVehicles[index].value}",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),

                  const SizedBox(height: 16,),
                ],
              ),
            );
          },
        ),
      ),
    );

  }

}