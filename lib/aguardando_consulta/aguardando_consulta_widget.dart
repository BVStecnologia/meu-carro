import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/index.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'aguardando_consulta_model.dart';
export 'aguardando_consulta_model.dart';

/// # FlutterFlow Vehicle Information Page Specification## Page Layout
/// Requirements### Header Section- Título principal: "Análise Veicular -
/// [MARCA MODELO ANO]"- Container com imagem do veículo (se disponível)  -
/// Usar placeholder quando não houver imagem  - Aspect ratio: 16:9  - Bordas
/// arredondadas: 8px### Content SectionsOrganizar as informações em 4 Cards
/// expansíveis:1.
///
/// **Características Técnicas**   - Lista com dados técnicos confirmados   -
/// Especificações do fabricante   - Informações de motorização   -
/// Capacidades documentadas2. **Status Legal**   - Situação atual   - Lista
/// de restrições   - Status de regularização   - Ocorrências registradas3.
/// **Pontos de Atenção**   - Lista de manutenções preventivas   -
/// Verificações técnicas   - Recalls (se existentes)4. **Dados Técnicos
/// Adicionais**   - Capacidades oficiais   - Especificações de fábrica   -
/// Informações documentais### Footer Section- Botão "Nova Consulta"  -
/// Largura: 100%  - Cor primária do tema  - Padding vertical: 16px  - Texto
/// em branco  - Ao clicar: limpar formulário e retornar à tela inicial##
/// Styles & UI Components### Typography- Título "Meu carro": 20px, branco,
/// peso regular- Título "Consultas Veiculares": 24px, branco, peso semi-bold-
/// Subtítulo descritivo: 16px, branco com transparência- Título "Consulta
/// Básica": 20px, peso semi-bold- Texto descritivo: 14px, cinza médio-
/// Placeholder do campo de busca: 16px, cinza médio### Colors- Header
/// Background: Azul (#2196F3)- Background: Branco (#FFFFFF)- Texto Header:
/// Branco (#FFFFFF)- Texto Secundário Header: Branco com transparência
/// (rgba(255,255,255,0.8))- Campo de Busca: Branco (#FFFFFF)- Ícones: Azul
/// claro (#64B5F6) para ícones informativos- Botão de Scanner: Roxo
/// (#5E35B1)- Sombras: Cinza suave para elevação de cards### Spacing- Padding
/// interno dos Cards: 16px- Margem entre Cards: 12px- Margem das bordas:
/// 16px## Regras de Negócio### Validações- Não exibir campos vazios- Indicar
/// "Informação não disponível" quando necessário- Não mostrar valores
/// monetários- Não exibir previsões ou especulações- Remover qualquer dado
/// subjetivo### Tratamento de Dados- Formatar datas no padrão brasileiro
/// (DD/MM/AAAA)- Converter unidades para o sistema métrico- Validar todos os
/// dados antes de exibir- Manter histórico de consultas em cache local###
/// Responsividade- Adaptar layout para diferentes tamanhos de tela- Manter
/// legibilidade em dispositivos móveis- Ajustar tamanho da imagem
/// proporcionalmente## Fluxo de Navegação1. Entrada na página com dados
/// carregados2. Expansão/retração de cards ao toque3. Botão "Nova Consulta"
/// retorna ao início4. Manter estado durante navegação## Tratamento de Erros-
/// Exibir mensagem amigável em caso de erro- Opção de tentar novamente- Log
/// de erros para depuração- Fallback para dados indisponíveis
class AguardandoConsultaWidget extends StatefulWidget {
  const AguardandoConsultaWidget({
    super.key,
    required this.id,
  });

  final int? id;

  static String routeName = 'Aguardando_consulta';
  static String routePath = '/Aguardando_consulta';

  @override
  State<AguardandoConsultaWidget> createState() =>
      _AguardandoConsultaWidgetState();
}

class _AguardandoConsultaWidgetState extends State<AguardandoConsultaWidget> {
  late AguardandoConsultaModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AguardandoConsultaModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await actions.inscreverRealtime(
        'consultas',
        (novoDado, velhoDado) async {
          var _shouldSetState = false;
          safeSetState(() => _model.requestCompleter = null);
          await _model.waitForRequestCompleted();
          _model.www = await ConsultasTable().queryRows(
            queryFn: (q) => q
                .eqOrNull(
                  'id_consulta',
                  widget!.id,
                )
                .eqOrNull(
                  'erro',
                  false,
                ),
          );
          _shouldSetState = true;
          if (!(_model.www != null && (_model.www)!.isNotEmpty)) {
            return;
          }

          context.pushNamed(
            VeiculoCopyWidget.routeName,
            queryParameters: {
              'id': serializeParam(
                widget!.id,
                ParamType.int,
              ),
            }.withoutNulls,
          );
        },
      );
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ConsultasRow>>(
      future: (_model.requestCompleter ??= Completer<List<ConsultasRow>>()
            ..complete(ConsultasTable().querySingleRow(
              queryFn: (q) => q.eqOrNull(
                'id_consulta',
                widget!.id,
              ),
            )))
          .future,
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        List<ConsultasRow> aguardandoConsultaConsultasRowList = snapshot.data!;

        final aguardandoConsultaConsultasRow =
            aguardandoConsultaConsultasRowList.isNotEmpty
                ? aguardandoConsultaConsultasRowList.first
                : null;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Align(
                  alignment: AlignmentDirectional(0.0, -1.0),
                  child: SingleChildScrollView(
                    primary: false,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Expanded(
                                child: Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Color(0xFF3969EF),
                                    ),
                                    alignment: AlignmentDirectional(0.0, -1.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 45.0, 0.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Align(
                                            alignment:
                                                AlignmentDirectional(-1.0, 0.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      15.0, 0.0, 0.0, 0.0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  context.safePop();
                                                },
                                                child: Icon(
                                                  Icons.arrow_back,
                                                  color: Colors.white,
                                                  size: 50.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      50.0, 20.0, 0.0, 20.0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  context.pushNamed(
                                                      ConsultaWidget.routeName);
                                                },
                                                child: Text(
                                                  'Meu Carro',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .headlineMedium
                                                      .override(
                                                        fontFamily:
                                                            'Inter Tight',
                                                        color: Colors.white,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        if (aguardandoConsultaConsultasRow?.erro == null)
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 70.0, 0.0, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 25.0, 0.0, 0.0),
                                            child: Text(
                                              valueOrDefault<String>(
                                                aguardandoConsultaConsultasRow
                                                    ?.placa,
                                                'Extraindo a placa',
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Inter',
                                                    color: Color(0xFF292626),
                                                    fontSize: 16.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Expanded(
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Container(
                                                      decoration:
                                                          BoxDecoration(),
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Container(
                                                        width: 190.0,
                                                        height: 190.0,
                                                        child: custom_widgets
                                                            .NewCustomWidget(
                                                          width: 190.0,
                                                          height: 190.0,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        if (aguardandoConsultaConsultasRow?.erro == true)
                          Container(
                            width: 362.3,
                            height: 247.7,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0.0, -1.0),
                                  child: Text(
                                    'Houve um erro ao processar a placa, isso pode acontecer por estar ilegivel',
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          fontSize: 18.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                ),
                                FFButtonWidget(
                                  onPressed: () async {
                                    context.safePop();
                                  },
                                  text: 'Tentar novamente',
                                  options: FFButtonOptions(
                                    width: 199.1,
                                    height: 43.1,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 0.0),
                                    iconAlignment: IconAlignment.start,
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context).primary,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Inter Tight',
                                          color: Colors.white,
                                          letterSpacing: 0.0,
                                        ),
                                    elevation: 0.0,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ],
                            ),
                          ),
                      ]
                          .divide(SizedBox(height: 45.0))
                          .addToEnd(SizedBox(height: 40.0)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
