import 'package:api_revision/services/splash_services.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  SplashServices splashServices = SplashServices();
  @override
  void initState() {
    super.initState();
    splashServices.currentUserAuthentication(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text("Splah Screen")));
  }
}
