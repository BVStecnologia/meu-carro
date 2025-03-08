import '../database.dart';

class VeiculosTable extends SupabaseTable<VeiculosRow> {
  @override
  String get tableName => 'veiculos';

  @override
  VeiculosRow createRow(Map<String, dynamic> data) => VeiculosRow(data);
}

class VeiculosRow extends SupabaseDataRow {
  VeiculosRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => VeiculosTable();

  int get idVeiculo => getField<int>('id_veiculo')!;
  set idVeiculo(int value) => setField<int>('id_veiculo', value);

  String get placa => getField<String>('placa')!;
  set placa(String value) => setField<String>('placa', value);

  String get chassi => getField<String>('chassi')!;
  set chassi(String value) => setField<String>('chassi', value);

  String get marca => getField<String>('marca')!;
  set marca(String value) => setField<String>('marca', value);

  String get modelo => getField<String>('modelo')!;
  set modelo(String value) => setField<String>('modelo', value);

  int get ano => getField<int>('ano')!;
  set ano(int value) => setField<int>('ano', value);

  int? get consultas => getField<int>('consultas');
  set consultas(int? value) => setField<int>('consultas', value);
}
