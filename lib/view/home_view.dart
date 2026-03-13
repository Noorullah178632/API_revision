import 'package:api_revision/services/splash_services.dart';
import 'package:api_revision/utils/RoutesFolder/routes_name.dart';
import 'package:api_revision/utils/utils.dart';
import 'package:api_revision/viewModel/user_token_services.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  SplashServices splashServices = SplashServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Home Page"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: .center,
        children: [
          GestureDetector(
            onTap: () {
              Utils.showFlash(context, "Error Message while uploading ");
            },
            child: Center(child: Text("Show Flash ")),
          ),
          SizedBox(height: 10),
          GestureDetector(
            onTap: () {
              Utils.toastMessage("this is toast message");
            },
            child: Center(child: Text("Show Toast ")),
          ),
          SizedBox(height: 10),
          GestureDetector(
            onTap: () {
              Utils.showMySnackBar(context, "Snack bar message");
            },
            child: Center(child: Text("Show SnackBar ")),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          UserTokenViewModel().clearUsers().then((value) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              RoutesName.login,
              (route) => false,
            );
          });
        },
        child: Icon(Icons.logout),
      ),
    );
  }
}
