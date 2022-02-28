import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_google_map.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({
    Key key,
    this.shop,
  }) : super(key: key);

  final ShopsRecord shop;

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  LatLng googleMapsCenter;
  Completer<GoogleMapController> googleMapsController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
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
              final googleMapShopsRecord = googleMapShopsRecordList.isNotEmpty
                  ? googleMapShopsRecordList.first
                  : null;
              return FlutterFlowGoogleMap(
                controller: googleMapsController,
                onCameraIdle: (latLng) => googleMapsCenter = latLng,
                initialLocation: googleMapsCenter ??=
                    LatLng(53.342633, -6.259573),
                markers: [
                  if (widget.shop != null)
                    FlutterFlowMarker(
                      widget.shop.reference.path,
                      widget.shop.location,
                    ),
                ],
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
  }
}
