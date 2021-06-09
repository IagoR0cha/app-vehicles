import 'package:flutter/material.dart';

import '../mockdata/mockdata.dart';
import './VehiclesPage.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color(0xFFEEEEEE),
      appBar: AppBar(title: Text('Montadoras'), elevation: 0),
      body: Container(
        padding: EdgeInsets.all(24),
        child: ListView.builder(
          itemCount: automakers.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => VehiclesPage(automaker: automakers[index]),
                  )
                );
              },

              child: Card(
                elevation: 3,
                color: Colors.white,
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                child: Container(
                  height: 100,
                  child: Row(children: [
                    const SizedBox(width: 15),
                    Image.network(
                      automakers[index].image,
                      fit: BoxFit.cover,
                      height: 60,
                    ),
                    const SizedBox(width: 15),
                    Expanded(child: Text(
                      automakers[index].name,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        letterSpacing: 2
                      ),
                    ))
                  ],),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}