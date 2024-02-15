import 'package:flutter/material.dart';

class PasswordVisibilty extends ChangeNotifier {
  bool isShowPassword = true;
  bool isShowConfirmPassword = true;
  bool isLoading = false;

  void togglePassword() {
    isShowPassword = !isShowPassword;
    notifyListeners();
  }

  void toggleConfirmPassword() {
    isShowConfirmPassword = !isShowConfirmPassword;
    notifyListeners();
  }
}
