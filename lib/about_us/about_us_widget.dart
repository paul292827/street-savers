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
                                  EdgeInsetsDirectional.fromSTEB(5, 10, 5, 4),
                              child: Text(
                                'This research focusses on computational sustainability, a relatively new term which involves the use of computers and technologies to improve sustainable efforts. Heating in the industry sector accounts for 34% of national heat consumption in Ireland  and retailers having the door closed can save up to 50% of energy, therefore reducing the amount of energy consumed for heating purposes.\nThe goal of the project is to raise awareness in order to educate the public on the issue of energy being wasted from doors being left open and making them more aware of the impacts of energy waste. It is important to raise awareness for this issue because its generating unnecessary carbon emissions, especially in Ireland with its cold climate.\n\tThis goal will be achieved through the development of a mobile application. The app will rely on the engagement of users to gather observable data on shops leaving their door open, to which this data will be displayed publicly to raise awareness of the issue. The presentation of the data collected will lead to the completion of the goal to raise awareness of the issue. Educating the public of this issue and the implications of energy waste works towards creating a more sustainable future.\n',
                                textAlign: TextAlign.start,
                                style: GoogleFonts.getFont(
                                  'Poppins',
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
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
