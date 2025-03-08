import '';
import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'consultar_copy_model.dart';
export 'consultar_copy_model.dart';

/// CONSULTAS VEICULARES
///
/// 1.
///
/// Barra de Pesquisa Principal
/// - Campo de entrada para placa/chassi/renavam
/// - Botão de pesquisa
/// - Opção de scanner para placa
///
/// 2. Tipos de Consulta (Cards em Grid)
/// Card 1: Consulta Básica
/// - Ícone: 🚗
/// - Informações:
///   * Dados do veículo
///   * Situação licenciamento
///   * Restrições básicas
///   * Débitos pendentes
///
/// Card 2: Consulta Avançada
/// - Ícone: 🔍
/// - Informações:
///   * Histórico de proprietários
///   * Multas detalhadas
///   * Recall
///   * KM registrado
///   * Histórico de sinistros
///
/// Card 3: Consulta de Leilão
/// - Ícone: 🔨
/// - Informações:
///   * Histórico de leilões
///   * Status atual
///   * Restrições
///   * Documentação
///
/// Card 4: Consulta de Roubo/Furto
/// - Ícone: 🚨
/// - Informações:
///   * Ocorrências policiais
///   * Status atual
///   * Alertas
///
/// 3. Histórico de Consultas
/// - Lista das últimas consultas
/// - Data e hora
/// - Status da consulta
///
/// 4. Filtros Avançados
/// - Por estado
/// - Por tipo de veículo
/// - Por ano
/// - Por situação
///
/// 5. Relatórios
/// - Gerar PDF
/// - Compartilhar
/// - Salvar consulta
///
/// Estilo:
/// - Design limpo e profissional
/// - Cards com sombras suaves
/// - Cores:
///   * Principal: Azul (#1E88E5)
///   * Secundária: Verde (#4CAF50)
///   * Alerta: Vermelho (#F44336)
class ConsultarCopyWidget extends StatefulWidget {
  const ConsultarCopyWidget({
    super.key,
    required this.tipodeconsulta,
    this.url,
  });

  /// tipo de colsulta
  final int? tipodeconsulta;

  final String? url;

  static String routeName = 'ConsultarCopy';
  static String routePath = '/consultarCopy';

  @override
  State<ConsultarCopyWidget> createState() => _ConsultarCopyWidgetState();
}

class _ConsultarCopyWidgetState extends State<ConsultarCopyWidget> {
  late ConsultarCopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ConsultarCopyModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.emailuser = await UsuariosTable().queryRows(
        queryFn: (q) => q
            .eqOrNull(
              'email',
              currentUserEmail,
            )
            .not(
              'telefone',
              'is',
              true,
            ),
      );
      if ((_model.emailuser != null && (_model.emailuser)!.isNotEmpty) ==
          false) {
        context.pushNamed(NomeFoneWidget.routeName);

        return;
      } else {
        return;
      }
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: AlignmentDirectional(0.0, -1.0),
                  child: Material(
                    color: Colors.transparent,
                    elevation: 2.0,
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: 200.0,
                      decoration: BoxDecoration(
                        color: Color(0xFF1E88E5),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 24.0, 24.0, 24.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 22.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 20.0, 0.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          context.pushNamed(
                                              ConsultaWidget.routeName);
                                        },
                                        child: Icon(
                                          Icons.arrow_back,
                                          color: Colors.white,
                                          size: 50.0,
                                        ),
                                      ),
                                    ),
                                    FaIcon(
                                      FontAwesomeIcons.car,
                                      color: Colors.white,
                                      size: 50.0,
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        'Meu carro',
                                        style: FlutterFlowTheme.of(context)
                                            .headlineMedium
                                            .override(
                                              fontFamily: 'Inter Tight',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .info,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Text(
                              'Consultas Veiculares',
                              style: FlutterFlowTheme.of(context)
                                  .headlineMedium
                                  .override(
                                    fontFamily: 'Inter Tight',
                                    color: FlutterFlowTheme.of(context).info,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                            Text(
                              'Pesquise informações detalhadas sobre qualquer veículo',
                              style: FlutterFlowTheme.of(context)
                                  .bodyLarge
                                  .override(
                                    fontFamily: 'Inter',
                                    color: Color(0xFFE0E0E0),
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                if (widget!.tipodeconsulta == 1)
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.pushNamed(
                        ConsultarCopyWidget.routeName,
                        queryParameters: {
                          'tipodeconsulta': serializeParam(
                            1,
                            ParamType.int,
                          ),
                        }.withoutNulls,
                      );
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 60.0,
                          height: 60.0,
                          decoration: BoxDecoration(
                            color: Color(0xFFE3F2FD),
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          child: Icon(
                            Icons.directions_car,
                            color: Color(0xFF1E88E5),
                            size: 30.0,
                          ),
                        ),
                        Text(
                          'Consulta Básica',
                          textAlign: TextAlign.center,
                          style:
                              FlutterFlowTheme.of(context).bodyLarge.override(
                                    fontFamily: 'Inter',
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Text(
                            'Dados do veículo, licenciamento e débitos',
                            textAlign: TextAlign.center,
                            style:
                                FlutterFlowTheme.of(context).bodySmall.override(
                                      fontFamily: 'Inter',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      fontSize: 14.0,
                                      letterSpacing: 0.0,
                                    ),
                          ),
                        ),
                      ].divide(SizedBox(height: 9.0)),
                    ),
                  ),
                if (widget!.tipodeconsulta == 2)
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.pushNamed(
                        ConsultarCopyWidget.routeName,
                        queryParameters: {
                          'tipodeconsulta': serializeParam(
                            2,
                            ParamType.int,
                          ),
                        }.withoutNulls,
                      );
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 60.0,
                          height: 60.0,
                          decoration: BoxDecoration(
                            color: Color(0xFFE8F5E9),
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          child: Icon(
                            Icons.search,
                            color: Colors.green,
                            size: 30.0,
                          ),
                        ),
                        Text(
                          'Restrições',
                          textAlign: TextAlign.center,
                          style:
                              FlutterFlowTheme.of(context).bodyLarge.override(
                                    fontFamily: 'Inter',
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                        Text(
                          'Histórico completo e detalhes',
                          textAlign: TextAlign.center,
                          style: FlutterFlowTheme.of(context)
                              .bodySmall
                              .override(
                                fontFamily: 'Inter',
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                fontSize: 14.0,
                                letterSpacing: 0.0,
                              ),
                        ),
                      ].divide(SizedBox(height: 9.0)),
                    ),
                  ),
                if (widget!.tipodeconsulta == 3)
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.pushNamed(
                        ConsultarCopyWidget.routeName,
                        queryParameters: {
                          'tipodeconsulta': serializeParam(
                            3,
                            ParamType.int,
                          ),
                        }.withoutNulls,
                      );
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 60.0,
                          height: 60.0,
                          decoration: BoxDecoration(
                            color: Color(0xFFFFF3E0),
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          child: Icon(
                            Icons.gavel,
                            color: Color(0xFFFF6F00),
                            size: 30.0,
                          ),
                        ),
                        Text(
                          'Consulta Leilão',
                          style:
                              FlutterFlowTheme.of(context).bodyLarge.override(
                                    fontFamily: 'Inter',
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                        Text(
                          'Histórico de leilões e status',
                          textAlign: TextAlign.center,
                          style: FlutterFlowTheme.of(context)
                              .bodySmall
                              .override(
                                fontFamily: 'Inter',
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                fontSize: 14.0,
                                letterSpacing: 0.0,
                              ),
                        ),
                      ].divide(SizedBox(height: 9.0)),
                    ),
                  ),
                if (widget!.tipodeconsulta == 4)
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.pushNamed(
                        ConsultarCopyWidget.routeName,
                        queryParameters: {
                          'tipodeconsulta': serializeParam(
                            4,
                            ParamType.int,
                          ),
                        }.withoutNulls,
                      );
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 60.0,
                          height: 60.0,
                          decoration: BoxDecoration(
                            color: Color(0xFFFFEBEE),
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          child: Icon(
                            Icons.warning,
                            color: Colors.red,
                            size: 30.0,
                          ),
                        ),
                        Text(
                          'Roubo/Furto',
                          style:
                              FlutterFlowTheme.of(context).bodyLarge.override(
                                    fontFamily: 'Inter',
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                        Text(
                          'Ocorrências e alertas',
                          textAlign: TextAlign.center,
                          style: FlutterFlowTheme.of(context)
                              .bodySmall
                              .override(
                                fontFamily: 'Inter',
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                fontSize: 14.0,
                                letterSpacing: 0.0,
                              ),
                        ),
                      ].divide(SizedBox(height: 9.0)),
                    ),
                  ),
                if (_model.uploadedFileUrl != null &&
                    _model.uploadedFileUrl != '')
                  Container(
                    width: 269.92,
                    height: 363.1,
                    decoration: BoxDecoration(
                      color: Color(0xFFE9E9E9),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(9.0),
                        bottomRight: Radius.circular(9.0),
                        topLeft: Radius.circular(9.0),
                        topRight: Radius.circular(9.0),
                      ),
                      shape: BoxShape.rectangle,
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          10.0, 10.0, 10.0, 10.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(50.0),
                              bottomRight: Radius.circular(50.0),
                              topLeft: Radius.circular(50.0),
                              topRight: Radius.circular(50.0),
                            ),
                            child: Image.network(
                              _model.uploadedFileUrl,
                              width: 189.7,
                              height: 201.2,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Text(
                            'A imagem precisa ter claramente os dados da placa',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                          FlutterFlowIconButton(
                            borderRadius: 8.0,
                            buttonSize: 40.0,
                            fillColor: FlutterFlowTheme.of(context).tertiary,
                            icon: Icon(
                              Icons.delete_outlined,
                              color: FlutterFlowTheme.of(context).info,
                              size: 24.0,
                            ),
                            onPressed: () async {
                              safeSetState(() {
                                _model.isDataUploading = false;
                                _model.uploadedLocalFile = FFUploadedFile(
                                    bytes: Uint8List.fromList([]));
                                _model.uploadedFileUrl = '';
                              });
                            },
                          ),
                        ]
                            .divide(SizedBox(height: 18.0))
                            .addToStart(SizedBox(height: 10.0)),
                      ),
                    ),
                  ),
                if (_model.uploadedFileUrl == null ||
                    _model.uploadedFileUrl == '')
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                      child: Material(
                        color: Colors.transparent,
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 0.9,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 20.0, 20.0, 20.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.all(12.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: TextFormField(
                                                  controller:
                                                      _model.textController,
                                                  focusNode:
                                                      _model.textFieldFocusNode,
                                                  autofocus: false,
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    hintText:
                                                        'Placa, Chassi ou Renavam',
                                                    hintStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                        ),
                                                    enabledBorder:
                                                        InputBorder.none,
                                                    focusedBorder:
                                                        InputBorder.none,
                                                    errorBorder:
                                                        InputBorder.none,
                                                    focusedErrorBorder:
                                                        InputBorder.none,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        letterSpacing: 0.0,
                                                      ),
                                                  minLines: 1,
                                                  validator: _model
                                                      .textControllerValidator
                                                      .asValidator(context),
                                                ),
                                              ),
                                            ].divide(SizedBox(width: 12.0)),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          12.0, 0.0, 12.0, 12.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          _model.cons23s =
                                              await ConsultasTable().insert({
                                            'tipo': widget!.tipodeconsulta
                                                ?.toString(),
                                            'status': 2,
                                            'email': currentUserEmail,
                                            'placa': _model.textController.text,
                                          });
                                          if (Navigator.of(context).canPop()) {
                                            context.pop();
                                          }
                                          context.pushNamed(
                                            AguardandoConsultaWidget.routeName,
                                            queryParameters: {
                                              'id': serializeParam(
                                                _model.cons23s?.idConsulta,
                                                ParamType.int,
                                              ),
                                            }.withoutNulls,
                                          );

                                          safeSetState(() {});
                                        },
                                        child: Icon(
                                          Icons.search,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 39.0,
                                        ),
                                      ),
                                    ),
                                    if (_model.textController.text == null ||
                                        _model.textController.text == '')
                                      FlutterFlowIconButton(
                                        borderRadius: 25.0,
                                        buttonSize: 50.0,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .primary,
                                        icon: Icon(
                                          Icons.qr_code_scanner,
                                          color:
                                              FlutterFlowTheme.of(context).info,
                                          size: 24.0,
                                        ),
                                        onPressed: () async {
                                          final selectedMedia =
                                              await selectMediaWithSourceBottomSheet(
                                            context: context,
                                            storageFolderPath: 'placa',
                                            allowPhoto: true,
                                          );
                                          if (selectedMedia != null &&
                                              selectedMedia.every((m) =>
                                                  validateFileFormat(
                                                      m.storagePath,
                                                      context))) {
                                            safeSetState(() =>
                                                _model.isDataUploading = true);
                                            var selectedUploadedFiles =
                                                <FFUploadedFile>[];

                                            var downloadUrls = <String>[];
                                            try {
                                              showUploadMessage(
                                                context,
                                                'Uploading file...',
                                                showLoading: true,
                                              );
                                              selectedUploadedFiles =
                                                  selectedMedia
                                                      .map(
                                                          (m) => FFUploadedFile(
                                                                name: m
                                                                    .storagePath
                                                                    .split('/')
                                                                    .last,
                                                                bytes: m.bytes,
                                                                height: m
                                                                    .dimensions
                                                                    ?.height,
                                                                width: m
                                                                    .dimensions
                                                                    ?.width,
                                                                blurHash:
                                                                    m.blurHash,
                                                              ))
                                                      .toList();

                                              downloadUrls =
                                                  await uploadSupabaseStorageFiles(
                                                bucketName: 'placa',
                                                selectedFiles: selectedMedia,
                                              );
                                            } finally {
                                              ScaffoldMessenger.of(context)
                                                  .hideCurrentSnackBar();
                                              _model.isDataUploading = false;
                                            }
                                            if (selectedUploadedFiles.length ==
                                                    selectedMedia.length &&
                                                downloadUrls.length ==
                                                    selectedMedia.length) {
                                              safeSetState(() {
                                                _model.uploadedLocalFile =
                                                    selectedUploadedFiles.first;
                                                _model.uploadedFileUrl =
                                                    downloadUrls.first;
                                              });
                                              showUploadMessage(
                                                  context, 'Success!');
                                            } else {
                                              safeSetState(() {});
                                              showUploadMessage(context,
                                                  'Failed to upload data');
                                              return;
                                            }
                                          }
                                        },
                                      ),
                                  ].divide(SizedBox(width: 12.0)),
                                ),
                              ].divide(SizedBox(height: 16.0)),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                if (_model.uploadedFileUrl != null &&
                    _model.uploadedFileUrl != '')
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        _model.cons23h = await ConsultasTable().insert({
                          'tipo': widget!.tipodeconsulta?.toString(),
                          'url': _model.uploadedFileUrl,
                          'status': 1,
                          'email': currentUserEmail,
                        });
                        await showDialog(
                          context: context,
                          builder: (alertDialogContext) {
                            return AlertDialog(
                              content: Text('Imagem enviada'),
                              actions: [
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(alertDialogContext),
                                  child: Text('Ok'),
                                ),
                              ],
                            );
                          },
                        );

                        safeSetState(() {});
                        if (Navigator.of(context).canPop()) {
                          context.pop();
                        }
                        context.pushNamed(
                          AguardandoConsultaWidget.routeName,
                          queryParameters: {
                            'id': serializeParam(
                              _model.cons23h?.idConsulta,
                              ParamType.int,
                            ),
                          }.withoutNulls,
                        );

                        safeSetState(() {});
                      },
                      text: 'Enviar Placa',
                      options: FFButtonOptions(
                        width: 226.0,
                        height: 45.5,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Inter Tight',
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                ),
                        elevation: 0.0,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                Container(
                  width: 600.0,
                ),
              ].divide(SizedBox(height: 15.0)),
            ),
          ),
        ),
      ),
    );
  }
}
