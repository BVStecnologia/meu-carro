// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TabelausuarioStruct extends BaseStruct {
  TabelausuarioStruct({
    TabelausuarioStruct? temuser,
  }) : _temuser = temuser;

  // "temuser" field.
  TabelausuarioStruct? _temuser;
  TabelausuarioStruct get temuser => _temuser ?? TabelausuarioStruct();
  set temuser(TabelausuarioStruct? val) => _temuser = val;

  void updateTemuser(Function(TabelausuarioStruct) updateFn) {
    updateFn(_temuser ??= TabelausuarioStruct());
  }

  bool hasTemuser() => _temuser != null;

  static TabelausuarioStruct fromMap(Map<String, dynamic> data) =>
      TabelausuarioStruct(
        temuser: data['temuser'] is TabelausuarioStruct
            ? data['temuser']
            : TabelausuarioStruct.maybeFromMap(data['temuser']),
      );

  static TabelausuarioStruct? maybeFromMap(dynamic data) => data is Map
      ? TabelausuarioStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'temuser': _temuser?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'temuser': serializeParam(
          _temuser,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static TabelausuarioStruct fromSerializableMap(Map<String, dynamic> data) =>
      TabelausuarioStruct(
        temuser: deserializeStructParam(
          data['temuser'],
          ParamType.DataStruct,
          false,
          structBuilder: TabelausuarioStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'TabelausuarioStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TabelausuarioStruct && temuser == other.temuser;
  }

  @override
  int get hashCode => const ListEquality().hash([temuser]);
}

TabelausuarioStruct createTabelausuarioStruct({
  TabelausuarioStruct? temuser,
}) =>
    TabelausuarioStruct(
      temuser: temuser ?? TabelausuarioStruct(),
    );
