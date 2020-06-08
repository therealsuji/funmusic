import 'dart:async';
import 'package:flutter/material.dart';
import 'package:funmusic/Bloc/music_bloc.dart';
import 'package:funmusic/constants/route_constants.dart';
import 'package:funmusic/helper/screen_utils.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  MusicBloc _musicBloc;

  @override
  void didChangeDependencies(){
    ScreenUtils.setScreenSizes(context);
    _musicBloc = Provider.of<MusicBloc>(context);
    _musicBloc.initialize();
    super.didChangeDependencies();
    delayer();
  }
  void delayer(){
   Timer(Duration(seconds: 1), () =>
       Navigator.pushReplacementNamed(context, HomeRoute)
   );
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
