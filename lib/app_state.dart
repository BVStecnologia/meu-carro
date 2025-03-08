import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import '/backend/api_requests/api_manager.dart';
import 'backend/supabase/supabase.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  String _image =
      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/meu-carro-ai-8tpwug/assets/vzdlzfi2cxaq/3d534e95-e9af-4b0b-90d7-5b9fc16208d1.jpg';
  String get image => _image;
  set image(String value) {
    _image = value;
  }
}
