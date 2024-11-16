import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'src/blocs/friend/friend_bloc.dart';
import 'src/blocs/model/model_bloc.dart';
import 'src/core/router.dart';
import 'src/core/themes.dart';
import 'src/blocs/button/button_bloc.dart';
import 'src/blocs/navbar/navbar_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const Application());
}

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ModelBloc()),
        BlocProvider(create: (context) => FriendBloc()),
        BlocProvider(create: (context) => NavbarBloc()),
        BlocProvider(create: (context) => ButtonBloc()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: theme,
        routerConfig: routerConfig,
      ),
    );
  }
}
