import 'package:api_revision/data/response/status.dart';
import 'package:api_revision/services/splash_services.dart';
import 'package:api_revision/utils/RoutesFolder/routes_name.dart';
import 'package:api_revision/viewModel/get_api_view_model.dart';
import 'package:api_revision/viewModel/user_token_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
      body: ChangeNotifierProvider<GetApiViewModel>(
        create: (context) => GetApiViewModel()..getApiData(),
        child: Consumer<GetApiViewModel>(
          builder: (context, vm, child) {
            switch (vm.responseData.status) {
              case Status.LOADING:
                return const Center(child: CircularProgressIndicator());
              case Status.ERROR:
                return Center(child: Text(vm.responseData.message.toString()));
              case Status.COMPLETED:
                final dataList = vm.responseData.data!;
                return ListView.builder(
                  itemCount: dataList.length,
                  itemBuilder: (context, index) {
                    final item = dataList[index];
                    return ListTile(
                      title: Text(item.name ?? ""),
                      subtitle: Text(item.email ?? ""),
                    );
                  },
                );
              default:
                return Container(child: Text("Something Error "));
            }
          },
        ),
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
