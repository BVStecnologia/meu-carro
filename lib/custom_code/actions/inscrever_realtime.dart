// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:supabase_flutter/supabase_flutter.dart';

Future inscreverRealtime(String tabela,
    Future Function(dynamic novoDado, dynamic velhoDado) acaoCallback) async {
  // Add your function code here!
  final supabase = SupaFlow.client;

  await supabase.channel('public:$tabela').unsubscribe();

  supabase
      .channel('public:$tabela')
      .onPostgresChanges(
          event: PostgresChangeEvent.all,
          schema: 'public',
          table: tabela,
          callback: (payload) {
            acaoCallback(payload.newRecord, payload.oldRecord);
          })
      .subscribe();
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
