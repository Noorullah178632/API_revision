import 'package:api_revision/utils/RoutesFolder/routes.dart';
import 'package:api_revision/utils/RoutesFolder/routes_name.dart';
import 'package:api_revision/viewModel/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => AuthViewModel())],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.greenAccent)),
      initialRoute: RoutesName.login,
      onGenerateRoute: Routes.navigationRoute,
    );
  }
}
