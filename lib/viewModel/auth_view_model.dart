import 'package:api_revision/repository/auth_repository.dart';
import 'package:api_revision/utils/RoutesFolder/routes_name.dart';
import 'package:api_revision/utils/utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AuthViewModel extends ChangeNotifier {
  final AuthRepository _authRepository = AuthRepository();
  bool _isloading = false;
  bool get isLoading => _isloading;
  void setLoading(bool value) {
    _isloading = value;
    notifyListeners();
  }

  Future<dynamic> loginUser(dynamic data, BuildContext context) async {
    setLoading(true);
    _authRepository
        .loginUser(data)
        .then((value) {
          setLoading(false);
          Utils.showFlash(context, "Login successfully");
        })
        .onError((error, stackError) {
          setLoading(false);
          Utils.showFlash(context, error.toString());
        });
  }

  Future<dynamic> registerUser(dynamic data, BuildContext context) async {
    setLoading(true);
    try {
      await _authRepository.registerUser(data);
      if (context.mounted) {
        Utils.showMySnackBar(context, "Successfully Login");
        Navigator.pushNamed(context, RoutesName.home);
      }
    } catch (e) {
      if (context.mounted) {
        Utils.showFlash(context, e.toString());
      }
    } finally {
      setLoading(false);
    }
  }
}
