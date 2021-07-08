import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/automakers.dart';

import '../util/env.dart';

class AutomakersController extends ChangeNotifier {
  AutomakersController() {
    index();
  }

  List<Automakers> automakers = [];

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> index() async {
    isLoading = true;
    automakers.clear();

    try {
      var url = Uri.https(Env.FIREBASE_URL, '/automakers.json');

      var resp = await http.get(url);

      print(resp.body);

      Map<String, dynamic> data =
          new Map<String, dynamic>.from(json.decode(resp.body));

      data.forEach((key, value) {
        automakers.add(Automakers(id: key, name: value['name']));
      });

      isLoading = false;
    } catch (error) {
      throw error;
    }
  }

  Future<void> create(String? automakerName) async {
    print(automakerName);
    var url = Uri.https(Env.FIREBASE_URL, '/automakers.json');

    await http.post(url, body: jsonEncode({ 'name': automakerName }));

    index();
    notifyListeners();
  }
}