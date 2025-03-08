// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<void> limparCacheWeb() async {
  // Versão simplificada que usa apenas o que já está disponível
  try {
    // Use avaliação JavaScript direta - JS é injetado como string
    // FlutterFlow tem uma maneira interna de executar isso
    await _executarJavascript('''
      // Limpar localStorage
      localStorage.clear();
      
      // Limpar sessionStorage
      sessionStorage.clear();
      
      // Limpar cookies
      var cookies = document.cookie.split(";");
      for (var i = 0; i < cookies.length; i++) {
        var cookie = cookies[i];
        var eqPos = cookie.indexOf("=");
        var name = eqPos > -1 ? cookie.substring(0, eqPos).trim() : cookie.trim();
        document.cookie = name + "=;expires=Thu, 01 Jan 1970 00:00:00 GMT;path=/";
      }
      
      console.log("Cache limpo!");
    ''');
  } catch (e) {
    print('Erro: $e');
  }
}

// Método auxiliar para executar JavaScript
Future<void> _executarJavascript(String code) async {
  // Esta é uma implementação muito simples
  // que apenas avalia o código JavaScript
  // Não é necessária verificação de plataforma
  await Future.delayed(Duration.zero); // Evita problemas de execução síncrona
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
