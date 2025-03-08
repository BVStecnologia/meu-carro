import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'veiculo_copy_widget.dart' show VeiculoCopyWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class VeiculoCopyModel extends FlutterFlowModel<VeiculoCopyWidget> {
  ///  State fields for stateful widgets in this page.

  Stream<List<ConsultasRow>>? veiculoCopySupabaseStream;
  Stream<List<VeiculosRow>>? row11SupabaseStream;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
