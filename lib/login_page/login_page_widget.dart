import '../auth/auth_util.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../main.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPageWidget extends StatefulWidget {
  const LoginPageWidget({Key key}) : super(key: key);

  @override
  _LoginPageWidgetState createState() => _LoginPageWidgetState();
}

class _LoginPageWidgetState extends State<LoginPageWidget> {
  TextEditingController emailTextController;
  TextEditingController passwordTextController;
  bool passwordVisibility;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    emailTextController = TextEditingController();
    passwordTextController = TextEditingController();
    passwordVisibility = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFF8BC34A),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: [
              Stack(
                children: [
                  Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          color: Color(0xFF8BC34A),
                        ),
                        child: Stack(
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0.05, -0.63),
                              child: Image.asset(
                                'assets/images/Another_Logo.png',
                                width: 280,
                                height: 250,
                                fit: BoxFit.contain,
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0, 0.67),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 30),
                                    child: Container(
                                      width: 285,
                                      height: 40,
                                      child: Stack(
                                        children: [
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0, 0),
                                            child: TextFormField(
                                              controller: emailTextController,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                hintText: 'Email',
                                                enabledBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0xFF2E7D32),
                                                    width: 2,
                                                  ),
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(4.0),
                                                    topRight:
                                                        Radius.circular(4.0),
                                                  ),
                                                ),
                                                focusedBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0xFF2E7D32),
                                                    width: 2,
                                                  ),
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(4.0),
                                                    topRight:
                                                        Radius.circular(4.0),
                                                  ),
                                                ),
                                              ),
                                              style: GoogleFonts.getFont(
                                                'Lato',
                                                color: Colors.white,
                                                fontSize: 18,
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0.95, 0.5),
                                            child: Icon(
                                              Icons.person,
                                              color: Colors.white,
                                              size: 24,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 30),
                                    child: Container(
                                      width: 285,
                                      height: 40,
                                      child: Stack(
                                        children: [
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0, 0),
                                            child: TextFormField(
                                              controller:
                                                  passwordTextController,
                                              obscureText: !passwordVisibility,
                                              decoration: InputDecoration(
                                                hintText: 'Password',
                                                enabledBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0xFF2E7D32),
                                                    width: 2,
                                                  ),
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(4.0),
                                                    topRight:
                                                        Radius.circular(4.0),
                                                  ),
                                                ),
                                                focusedBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0xFF2E7D32),
                                                    width: 2,
                                                  ),
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(4.0),
                                                    topRight:
                                                        Radius.circular(4.0),
                                                  ),
                                                ),
                                                suffixIcon: InkWell(
                                                  onTap: () => setState(
                                                    () => passwordVisibility =
                                                        !passwordVisibility,
                                                  ),
                                                  child: Icon(
                                                    passwordVisibility
                                                        ? Icons
                                                            .visibility_outlined
                                                        : Icons
                                                            .visibility_off_outlined,
                                                    size: 22,
                                                  ),
                                                ),
                                              ),
                                              style: GoogleFonts.getFont(
                                                'Lato',
                                                color: Colors.white,
                                                fontSize: 18,
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0.95, 0.5),
                                            child: Icon(
                                              Icons.lock_open,
                                              color: Colors.white,
                                              size: 24,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 40),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        FFButtonWidget(
                                          onPressed: () async {
                                            final user =
                                                await createAccountWithEmail(
                                              context,
                                              emailTextController.text,
                                              passwordTextController.text,
                                            );
                                            if (user == null) {
                                              return;
                                            }

                                            await Navigator.pushAndRemoveUntil(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    NavBarPage(
                                                        initialPage:
                                                            'HomePage'),
                                              ),
                                              (r) => false,
                                            );
                                          },
                                          text: 'Sign up',
                                          options: FFButtonOptions(
                                            width: 125,
                                            height: 40,
                                            color: Color(0x00FFFFFF),
                                            textStyle: GoogleFonts.getFont(
                                              'Lato',
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15,
                                            ),
                                            borderSide: BorderSide(
                                              color: Color(0xFF2E7D32),
                                              width: 2,
                                            ),
                                            borderRadius: 0,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  35, 0, 0, 0),
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              final user =
                                                  await signInWithEmail(
                                                context,
                                                emailTextController.text,
                                                passwordTextController.text,
                                              );
                                              if (user == null) {
                                                return;
                                              }

                                              await Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      NavBarPage(
                                                          initialPage:
                                                              'HomePage'),
                                                ),
                                              );
                                            },
                                            text: 'Sign in',
                                            options: FFButtonOptions(
                                              width: 125,
                                              height: 40,
                                              color: Color(0x00FFFFFF),
                                              textStyle: GoogleFonts.getFont(
                                                'Lato',
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15,
                                              ),
                                              borderSide: BorderSide(
                                                color: Color(0xFF2E7D32),
                                                width: 2,
                                              ),
                                              borderRadius: 0,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Align(
                                        alignment: AlignmentDirectional(0, 0),
                                        child: Container(
                                          width: 250,
                                          height: 44,
                                          child: Stack(
                                            children: [
                                              Align(
                                                alignment:
                                                    AlignmentDirectional(0, 0),
                                                child: FFButtonWidget(
                                                  onPressed: () {
                                                    print('Button pressed ...');
                                                  },
                                                  text: 'Sign in with Facebook',
                                                  icon: Icon(
                                                    Icons.add,
                                                    color: Colors.transparent,
                                                    size: 20,
                                                  ),
                                                  options: FFButtonOptions(
                                                    width: 250,
                                                    height: 40,
                                                    color: Color(0xFFB0D97F),
                                                    textStyle:
                                                        GoogleFonts.getFont(
                                                      'Roboto',
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 17,
                                                    ),
                                                    elevation: 4,
                                                    borderSide: BorderSide(
                                                      color: Colors.transparent,
                                                      width: 0,
                                                    ),
                                                    borderRadius: 12,
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    -0.83, 0),
                                                child: Container(
                                                  width: 22,
                                                  height: 22,
                                                  clipBehavior: Clip.antiAlias,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: Image.network(
                                                    'https://facebookbrand.com/wp-content/uploads/2019/04/f_logo_RGB-Hex-Blue_512.png?w=512&h=512',
                                                    fit: BoxFit.contain,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 10, 0, 10),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        isAndroid
                                            ? Container()
                                            : Align(
                                                alignment:
                                                    AlignmentDirectional(0, 0),
                                                child: FFButtonWidget(
                                                  onPressed: () async {
                                                    final user =
                                                        await signInWithApple(
                                                            context);
                                                    if (user == null) {
                                                      return;
                                                    }
                                                    await Navigator
                                                        .pushAndRemoveUntil(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            NavBarPage(
                                                                initialPage:
                                                                    'HomePage'),
                                                      ),
                                                      (r) => false,
                                                    );
                                                  },
                                                  text: 'Sign in with Apple',
                                                  icon: FaIcon(
                                                    FontAwesomeIcons.apple,
                                                    size: 20,
                                                  ),
                                                  options: FFButtonOptions(
                                                    width: 230,
                                                    height: 40,
                                                    color: Color(0xFFB0D97F),
                                                    textStyle:
                                                        GoogleFonts.getFont(
                                                      'Roboto',
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 17,
                                                    ),
                                                    elevation: 4,
                                                    borderSide: BorderSide(
                                                      color: Colors.transparent,
                                                      width: 0,
                                                    ),
                                                    borderRadius: 12,
                                                  ),
                                                ),
                                              ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Align(
                                        alignment: AlignmentDirectional(0, 0),
                                        child: Container(
                                          width: 230,
                                          height: 44,
                                          child: Stack(
                                            children: [
                                              Align(
                                                alignment:
                                                    AlignmentDirectional(0, 0),
                                                child: FFButtonWidget(
                                                  onPressed: () async {
                                                    final user =
                                                        await signInWithGoogle(
                                                            context);
                                                    if (user == null) {
                                                      return;
                                                    }
                                                    await Navigator
                                                        .pushAndRemoveUntil(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            NavBarPage(
                                                                initialPage:
                                                                    'HomePage'),
                                                      ),
                                                      (r) => false,
                                                    );
                                                  },
                                                  text: 'Sign in with Google',
                                                  icon: Icon(
                                                    Icons.add,
                                                    color: Colors.transparent,
                                                    size: 20,
                                                  ),
                                                  options: FFButtonOptions(
                                                    width: 230,
                                                    height: 40,
                                                    color: Color(0xFFB0D97F),
                                                    textStyle:
                                                        GoogleFonts.getFont(
                                                      'Roboto',
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 17,
                                                    ),
                                                    elevation: 4,
                                                    borderSide: BorderSide(
                                                      color: Colors.transparent,
                                                      width: 0,
                                                    ),
                                                    borderRadius: 12,
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    -0.83, 0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(8, 0, 0, 0),
                                                  child: Container(
                                                    width: 22,
                                                    height: 22,
                                                    clipBehavior:
                                                        Clip.antiAlias,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: Image.network(
                                                      'https://i0.wp.com/nanophorm.com/wp-content/uploads/2018/04/google-logo-icon-PNG-Transparent-Background.png?w=1000&ssl=1',
                                                      fit: BoxFit.contain,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
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
            ],
          ),
        ),
      ),
    );
  }
}
