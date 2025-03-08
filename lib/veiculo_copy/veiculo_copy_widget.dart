import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'veiculo_copy_model.dart';
export 'veiculo_copy_model.dart';

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
class VeiculoCopyWidget extends StatefulWidget {
  const VeiculoCopyWidget({
    super.key,
    required this.id,
  });

  final int? id;

  static String routeName = 'veiculoCopy';
  static String routePath = '/veiculoCopy';

  @override
  State<VeiculoCopyWidget> createState() => _VeiculoCopyWidgetState();
}

class _VeiculoCopyWidgetState extends State<VeiculoCopyWidget> {
  late VeiculoCopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VeiculoCopyModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<ConsultasRow>>(
      stream: _model.veiculoCopySupabaseStream ??= SupaFlow.client
          .from("consultas")
          .stream(primaryKey: ['id_consulta'])
          .eqOrNull(
            'id_consulta',
            widget!.id,
          )
          .map((list) => list.map((item) => ConsultasRow(item)).toList()),
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
        List<ConsultasRow> veiculoCopyConsultasRowList = snapshot.data!;

        final veiculoCopyConsultasRow = veiculoCopyConsultasRowList.isNotEmpty
            ? veiculoCopyConsultasRowList.first
            : null;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: WillPopScope(
            onWillPop: () async => false,
            child: Scaffold(
              key: scaffoldKey,
              backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
              body: Align(
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
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 20.0, 0.0, 20.0),
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
                                                style:
                                                    FlutterFlowTheme.of(context)
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
                                          if (veiculoCopyConsultasRow
                                                      ?.avaliacao !=
                                                  null &&
                                              veiculoCopyConsultasRow
                                                      ?.avaliacao !=
                                                  '')
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      10.0, 0.0, 0.0, 30.0),
                                              child: Text(
                                                valueOrDefault<String>(
                                                  veiculoCopyConsultasRow
                                                      ?.placa,
                                                  'mjl5592',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: Colors.white,
                                                          fontSize: 19.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                              ),
                                            ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (veiculoCopyConsultasRow?.avaliacao != null &&
                          veiculoCopyConsultasRow?.avaliacao != '')
                        Expanded(
                          child: Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Container(
                              width: 400.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                            ),
                          ),
                        ),
                      Expanded(
                        child: Container(
                          width: 400.0,
                          decoration: BoxDecoration(
                            color: Color(0xFFEAEAEA),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(15.0),
                              bottomRight: Radius.circular(15.0),
                              topLeft: Radius.circular(15.0),
                              topRight: Radius.circular(15.0),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 45.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                if (veiculoCopyConsultasRow?.url != null &&
                                    veiculoCopyConsultasRow?.url != '')
                                  Align(
                                    alignment: AlignmentDirectional(0.0, -1.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 20.0, 0.0, 1.0),
                                      child: Material(
                                        color: Colors.transparent,
                                        elevation: 8.0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(20.0),
                                            bottomRight: Radius.circular(20.0),
                                            topLeft: Radius.circular(20.0),
                                            topRight: Radius.circular(20.0),
                                          ),
                                        ),
                                        child: Container(
                                          width: 178.1,
                                          height: 250.0,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFEAEAEA),
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: Image.network(
                                                valueOrDefault<String>(
                                                  veiculoCopyConsultasRow?.url,
                                                  'https://axsznxtakjbekbnewcev.supabase.co/storage/v1/object/public/placa/placa/1739633128640000.jpeg',
                                                ),
                                              ).image,
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                blurRadius: 4.0,
                                                color: Color(0x33000000),
                                                offset: Offset(
                                                  0.0,
                                                  2.0,
                                                ),
                                              )
                                            ],
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(20.0),
                                              bottomRight:
                                                  Radius.circular(20.0),
                                              topLeft: Radius.circular(20.0),
                                              topRight: Radius.circular(20.0),
                                            ),
                                            shape: BoxShape.rectangle,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        5.0, 25.0, 5.0, 25.0),
                                    child: StreamBuilder<List<VeiculosRow>>(
                                      stream: _model.row11SupabaseStream ??=
                                          SupaFlow.client
                                              .from("veiculos")
                                              .stream(
                                                  primaryKey: ['id_veiculo'])
                                              .eqOrNull(
                                                'consultas',
                                                widget!.id,
                                              )
                                              .map((list) => list
                                                  .map((item) =>
                                                      VeiculosRow(item))
                                                  .toList()),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50.0,
                                              height: 50.0,
                                              child: CircularProgressIndicator(
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                        List<VeiculosRow> row11VeiculosRowList =
                                            snapshot.data!;

                                        final row11VeiculosRow =
                                            row11VeiculosRowList.isNotEmpty
                                                ? row11VeiculosRowList.first
                                                : null;

                                        return Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        9.0, 0.0, 0.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Text(
                                                      'Modelo:',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'Inter',
                                                            fontSize: 15.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  2.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        valueOrDefault<String>(
                                                          row11VeiculosRow
                                                              ?.modelo,
                                                          'Gol',
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  fontSize:
                                                                      18.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(6.0, 0.0, 0.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Text(
                                                    'Marca:',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          fontSize: 15.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(2.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      valueOrDefault<String>(
                                                        row11VeiculosRow?.marca,
                                                        'VW',
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'Inter',
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            fontSize: 18.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(6.0, 0.0, 9.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Text(
                                                    'Fab:',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          fontSize: 15.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(2.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      valueOrDefault<String>(
                                                        row11VeiculosRow?.ano
                                                            ?.toString(),
                                                        '1999',
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'Inter',
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            fontSize: 18.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20.0, 20.0, 20.0, 20.0),
                                    child: Text(
                                      valueOrDefault<String>(
                                        veiculoCopyConsultasRow?.avaliacao,
                                        'Aguardando...',
                                      ),
                                      textAlign: TextAlign.start,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            fontSize: 17.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      FFButtonWidget(
                        onPressed: () async {
                          if (Navigator.of(context).canPop()) {
                            context.pop();
                          }
                          context.pushNamed(ConsultaWidget.routeName);
                        },
                        text: 'Nova consulta',
                        options: FFButtonOptions(
                          width: 400.0,
                          height: 50.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: Color(0xFF4C54ED),
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
                    ]
                        .divide(SizedBox(height: 0.0))
                        .addToEnd(SizedBox(height: 40.0)),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
