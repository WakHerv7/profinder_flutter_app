import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:profinder/shared/routing/app_router.gr.dart';

@RoutePage()
class AppInitScreen extends StatefulWidget {
  const AppInitScreen({super.key});

  @override
  State<AppInitScreen> createState() => _AppInitScreenState();
}

class _AppInitScreenState extends State<AppInitScreen> {
  @override
  void initState() {
    super.initState();
    handleNextRoute();
  }

  void handleNextRoute() async {
    await Future.delayed(const Duration(seconds: 3), () {
      context.router.pushAndPopUntil(
        const RegisterRoute(),
        predicate: (router) => false,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CupertinoActivityIndicator(),
      ),
    );
  }
}
