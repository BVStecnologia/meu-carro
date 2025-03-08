import '../database.dart';

class UsuariosTable extends SupabaseTable<UsuariosRow> {
  @override
  String get tableName => 'usuarios';

  @override
  UsuariosRow createRow(Map<String, dynamic> data) => UsuariosRow(data);
}

class UsuariosRow extends SupabaseDataRow {
  UsuariosRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UsuariosTable();

  int get idUsuario => getField<int>('id_usuario')!;
  set idUsuario(int value) => setField<int>('id_usuario', value);

  String get nome => getField<String>('nome')!;
  set nome(String value) => setField<String>('nome', value);

  String get email => getField<String>('email')!;
  set email(String value) => setField<String>('email', value);

  String get telefone => getField<String>('telefone')!;
  set telefone(String value) => setField<String>('telefone', value);

  String get senha => getField<String>('senha')!;
  set senha(String value) => setField<String>('senha', value);

  bool? get google => getField<bool>('google');
  set google(bool? value) => setField<bool>('google', value);
}
