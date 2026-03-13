import 'package:api_revision/repository/auth_repository.dart';
import 'package:api_revision/utils/RoutesFolder/routes_name.dart';
import 'package:api_revision/utils/utils.dart';
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
    try {
      final response = await _authRepository.loginUser(data);
      setLoading(false);
      // Only happens if NO error is thrown
      Utils.showMySnackBar(context, "Login successfully");
      Navigator.pushReplacementNamed(context, RoutesName.home);
    } catch (e) {
      setLoading(false);
      // This will now catch the Unauthorized/BadRequest exceptions
      Utils.showFlash(context, e.toString());
    }
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
