import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DoorOpenWidget extends StatefulWidget {
  const DoorOpenWidget({
    Key key,
    this.shop,
  }) : super(key: key);

  final ShopsRecord shop;

  @override
  _DoorOpenWidgetState createState() => _DoorOpenWidgetState();
}

class _DoorOpenWidgetState extends State<DoorOpenWidget> {
  ShopsRecord closed;
  ShopsRecord open;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<ShopsRecord>>(
      stream: queryShopsRecord(
        queryBuilder: (shopsRecord) => shopsRecord.where('location',
            isEqualTo: widget.shop.location.toGeoPoint()),
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50,
              height: 50,
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            ),
          );
        }
        List<ShopsRecord> containerShopsRecordList = snapshot.data;
        // Return an empty Container when the document does not exist.
        if (snapshot.data.isEmpty) {
          return Container();
        }
        final containerShopsRecord = containerShopsRecordList.isNotEmpty
            ? containerShopsRecordList.first
            : null;
        return Container(
          width: MediaQuery.of(context).size.width,
          height: 350,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(0),
              bottomRight: Radius.circular(0),
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 8, 20, 0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Divider(
                            thickness: 3,
                            indent: 150,
                            endIndent: 150,
                            color: Color(0xFFDBE2E7),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 4, 16, 0),
                                  child: Text(
                                    valueOrDefault<String>(
                                      widget.shop.name,
                                      'Shop',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .title1
                                        .override(
                                          fontFamily: 'Lexend Deca',
                                          color: Color(0xFF090F13),
                                          fontSize: 24,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 8, 0, 0),
                                  child: Text(
                                    'Select whether the shops door is open or closed',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Lexend Deca',
                                          color: Color(0xFF57636C),
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal,
                                        ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 24, 0, 44),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                FFButtonWidget(
                                  onPressed: () async {
                                    Navigator.pop(context);
                                    final shopsCreateData = {
                                      'open_boolean': [false],
                                    };
                                    final shopsRecordReference =
                                        ShopsRecord.collection.doc();
                                    await shopsRecordReference
                                        .set(shopsCreateData);
                                    closed = ShopsRecord.getDocumentFromData(
                                        shopsCreateData, shopsRecordReference);

                                    setState(() {});
                                  },
                                  text: 'Closed',
                                  options: FFButtonOptions(
                                    width: 150,
                                    height: 50,
                                    color: Color(0xFFD73737),
                                    textStyle: FlutterFlowTheme.of(context)
                                        .subtitle2
                                        .override(
                                          fontFamily: 'Lexend Deca',
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal,
                                        ),
                                    elevation: 2,
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1,
                                    ),
                                    borderRadius: 40,
                                  ),
                                ),
                                FFButtonWidget(
                                  onPressed: () async {
                                    Navigator.pop(context);
                                    final shopsCreateData = {
                                      'open_boolean': [true],
                                    };
                                    final shopsRecordReference =
                                        ShopsRecord.collection.doc();
                                    await shopsRecordReference
                                        .set(shopsCreateData);
                                    open = ShopsRecord.getDocumentFromData(
                                        shopsCreateData, shopsRecordReference);

                                    setState(() {});
                                  },
                                  text: 'Open',
                                  options: FFButtonOptions(
                                    width: 150,
                                    height: 50,
                                    color: Color(0xFF8BC34A),
                                    textStyle: FlutterFlowTheme.of(context)
                                        .subtitle2
                                        .override(
                                          fontFamily: 'Lexend Deca',
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal,
                                        ),
                                    elevation: 2,
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1,
                                    ),
                                    borderRadius: 40,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
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
