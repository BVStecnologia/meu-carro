import '../database.dart';

class ConsultasTable extends SupabaseTable<ConsultasRow> {
  @override
  String get tableName => 'consultas';

  @override
  ConsultasRow createRow(Map<String, dynamic> data) => ConsultasRow(data);
}

class ConsultasRow extends SupabaseDataRow {
  ConsultasRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ConsultasTable();

  int get idConsulta => getField<int>('id_consulta')!;
  set idConsulta(int value) => setField<int>('id_consulta', value);

  int? get idUsuario => getField<int>('id_usuario');
  set idUsuario(int? value) => setField<int>('id_usuario', value);

  String? get placa => getField<String>('placa');
  set placa(String? value) => setField<String>('placa', value);

  DateTime? get dataConsulta => getField<DateTime>('data_consulta');
  set dataConsulta(DateTime? value) =>
      setField<DateTime>('data_consulta', value);

  String? get tipo => getField<String>('tipo');
  set tipo(String? value) => setField<String>('tipo', value);

  String? get fotoDaPlacaBase64 => getField<String>('foto da placa base 64');
  set fotoDaPlacaBase64(String? value) =>
      setField<String>('foto da placa base 64', value);

  String? get url => getField<String>('url');
  set url(String? value) => setField<String>('url', value);

  bool? get erro => getField<bool>('erro');
  set erro(bool? value) => setField<bool>('erro', value);

  String? get avaliacao => getField<String>('avaliacao');
  set avaliacao(String? value) => setField<String>('avaliacao', value);

  String? get dadosCru => getField<String>('dados_cru');
  set dadosCru(String? value) => setField<String>('dados_cru', value);

  int? get status => getField<int>('status');
  set status(int? value) => setField<int>('status', value);

  String? get email => getField<String>('email');
  set email(String? value) => setField<String>('email', value);

  String? get dataField => getField<String>('data');
  set dataField(String? value) => setField<String>('data', value);
}
