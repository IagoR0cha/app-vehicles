import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:veiculos/controllers/AutomakersController.dart';

// import '../mockdata/mockdata.dart';
import './VehiclesPage.dart';

class HomePage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  String? _automakerNameCurrent;

  @override
  Widget build(BuildContext context) {

    return Consumer<AutomakersController>(
      builder: (_, automakersController, __) {
        return Scaffold(
      backgroundColor: Color(0xFFEEEEEE),
      appBar: AppBar(title: Text('Montadoras'), elevation: 0),
      body: Container(
        padding: EdgeInsets.all(24),
        child: ListView.builder(
          itemCount: automakersController.automakers.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => VehiclesPage(automaker: automakersController.automakers[index]),
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
                    Expanded(child: Text(
                      automakersController.automakers[index].name,
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
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                actions: [
                  Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Cadastrar Montadora",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: TextFormField(
                            decoration: InputDecoration(labelText: 'Name'),
                            onSaved: (value) {
                              _automakerNameCurrent = value;
                            },
                          )
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: ElevatedButton(
                            onPressed: () async {
                              _formKey.currentState!.save();
                              await automakersController.create(_automakerNameCurrent);
                              ScaffoldMessenger.of(context)
                                .showSnackBar(SnackBar(
                                  content: Text(
                                    'Salvo com sucesso!'
                                  ),
                                ),
                              );
                            },
                            child: Text('Cadastrar Montadora'),
                          ),
                        )
                      ]
                    ),
                  )
                ],
              );
            }
          );
        },
        ),
    );
      },
    );
  }
}