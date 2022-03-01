import '../backend/backend.dart';
import '../components/door_open_widget.dart';
import '../flutter_flow/flutter_flow_google_map.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  LatLng googleMapsCenter;
  Completer<GoogleMapController> googleMapsController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<ShopsRecord>>(
      stream: queryShopsRecord(),
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
        List<ShopsRecord> homePageShopsRecordList = snapshot.data;
        return Scaffold(
          key: scaffoldKey,
          resizeToAvoidBottomInset: false,
          backgroundColor: Color(0xFF8BC34A),
          body: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: StreamBuilder<List<ShopsRecord>>(
                stream: queryShopsRecord(
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
                  List<ShopsRecord> googleMapShopsRecordList = snapshot.data;
                  // Return an empty Container when the document does not exist.
                  if (snapshot.data.isEmpty) {
                    return Container();
                  }
                  final googleMapShopsRecord =
                      googleMapShopsRecordList.isNotEmpty
                          ? googleMapShopsRecordList.first
                          : null;
                  return FlutterFlowGoogleMap(
                    controller: googleMapsController,
                    onCameraIdle: (latLng) =>
                        setState(() => googleMapsCenter = latLng),
                    initialLocation: googleMapsCenter ??=
                        LatLng(53.3432, -6.2594),
                    markers: (homePageShopsRecordList ?? [])
                        .map(
                          (homePageShopsRecord) => FlutterFlowMarker(
                            homePageShopsRecord.reference.path,
                            homePageShopsRecord.location,
                            () async {
                              await showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                context: context,
                                builder: (context) {
                                  return Padding(
                                    padding: MediaQuery.of(context).viewInsets,
                                    child: Container(
                                      height: 200,
                                      child: DoorOpenWidget(
                                        shop: googleMapShopsRecord,
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        )
                        .toList(),
                    markerColor: GoogleMarkerColor.red,
                    mapType: MapType.terrain,
                    style: GoogleMapStyle.standard,
                    initialZoom: 15,
                    allowInteraction: true,
                    allowZoom: true,
                    showZoomControls: false,
                    showLocation: true,
                    showCompass: false,
                    showMapToolbar: false,
                    showTraffic: false,
                    centerMapOnMarkerTap: true,
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
