import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../main.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutUsWidget extends StatefulWidget {
  const AboutUsWidget({Key key}) : super(key: key);

  @override
  _AboutUsWidgetState createState() => _AboutUsWidgetState();
}

class _AboutUsWidgetState extends State<AboutUsWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFF8BC34A),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Stack(
                      children: [
                        Align(
                          alignment: AlignmentDirectional(-0.98, 8),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 40, 0, 0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                await Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        NavBarPage(initialPage: 'Account'),
                                  ),
                                  (r) => false,
                                );
                              },
                              text: '<   Back',
                              options: FFButtonOptions(
                                width: 100,
                                height: 30,
                                color: Color(0xFF6E983B),
                                textStyle: FlutterFlowTheme.of(context)
                                    .subtitle2
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: Colors.white,
                                    ),
                                borderSide: BorderSide(
                                  color: Color(0x00FFFFFF),
                                  width: 1,
                                ),
                                borderRadius: 12,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(15, 65, 15, 0),
                          child: Image.asset(
                            'assets/images/Another_Logo.png',
                            width: 350,
                            height: 150,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.87,
                      height: 1,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(12, 0, 12, 4),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 4, 0, 4),
                              child: Text(
                                'Drag-and-drop builder and no-code configuration make it easy to add chat to your app. Professionally designed templates and custom styling will take your app to the next level.Drag-and-drop builder and no-code configuration make it easy to add chat to your app. Professionally designed templates and custom styling will take your app to the next level.Drag-and-drop builder and no-code configuration make it easy to add chat to your app. Professionally designed templates and custom styling will take your app to the next level.',
                                textAlign: TextAlign.start,
                                style: GoogleFonts.getFont(
                                  'Lexend Deca',
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
