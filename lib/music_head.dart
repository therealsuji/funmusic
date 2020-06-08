import 'package:flutter/material.dart';
import 'package:funmusic/Bloc/music_bloc.dart';
import 'package:funmusic/routes.dart';
import 'package:provider/provider.dart';

import 'constants/route_constants.dart';

class MusicHead extends StatelessWidget {
  static MusicBloc musicBloc = new MusicBloc();


  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        Provider(
          create: (context) => musicBloc,
          dispose: (_, bloc) => bloc.dispose(),
        )
      ],
      child: MaterialApp(
          onGenerateRoute: MyRoutes.generateRoute,
          initialRoute: SplashScreenRoute),
    );
  }
}
