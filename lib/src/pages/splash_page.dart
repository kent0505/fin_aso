import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../blocs/friend/friend_bloc.dart';
import '../blocs/model/model_bloc.dart';
import '../core/database.dart';
import '../widgets/loading.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  void init() async {
    await initAll().then(
      (value) {
        Future.delayed(
          const Duration(seconds: 2),
          () {
            if (mounted) {
              context.read<ModelBloc>().add(GetModels());
              context.read<FriendBloc>().add(GetFriends());
              if (onboard) {
                context.go('/onboard');
              } else {
                context.go('/home');
              }
            }
          },
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Loading(),
    );
  }
}
