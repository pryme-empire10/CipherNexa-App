import 'package:ciphernexa/provider/handle_authentication.dart';
import 'package:ciphernexa/provider/password_visibility.dart';

import 'package:ciphernexa/widget/button.dart';

import 'package:ciphernexa/widget/entry_formfield.dart';
import 'package:ciphernexa/widget/header_text_container.dart';
import 'package:ciphernexa/widget/registration_info_row.dart';
import 'package:ciphernexa/widget/row_divider.dart';
import 'package:ciphernexa/widget/google_button.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../conts/color.dart';
import '../conts/styles.dart';
import '../utils/size_box.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool _isPasswordMatch = false;
  final bool _isEmailEmpty = false;
  late String errorMessage;
  late String errorEmailMessage;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final passwordVisible = Provider.of<PasswordVisibilty>(context);
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: AppColors.kPrimaryColor,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HeaderTextContainer(),
              Expanded(
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.only(top: 20),
                  decoration: BoxDecoration(
                    color: AppColors.kSecondaryColor,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                  child: Consumer<HandleAuthentication>(
                    builder: (context, handleAuthentication, child) {
                      return SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 30, top: 40, right: 30),
                          child: Form(
                            key: handleAuthentication.signUpFormKey,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Sign Up',
                                  style: AppStyles.kSignIn,
                                ),
                                buildSizeBox(30, 0),
                                Text(
                                  'Email',
                                  style: AppStyles.kEmailPassword,
                                ),
                                EntryFormField(
                                  controller: _emailController,
                                  keyboardType: TextInputType.emailAddress,
                                  onSaved: (newValue) {
                                    _emailController.text = newValue!;
                                  },
                                  validator: (value) {
                                    RegExp regExp = RegExp(
                                      r'^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+[a-zA-Z]',
                                    );
                                    if (value!.isEmpty) {
                                      return null;
                                    }
                                    if (!regExp.hasMatch(value)) {
                                      return 'Invalid Email format';
                                    }
                                    return null;
                                  },
                                  hintText: 'Enter your email',
                                ),
                                _isEmailEmpty
                                    ? Text(
                                        errorEmailMessage,
                                        style: GoogleFonts.poppins(
                                          fontSize: 13,
                                          color: Colors.red,
                                        ),
                                      )
                                    : const SizedBox(),
                                buildSizeBox(30, 0),
                                Text(
                                  'Password',
                                  style: AppStyles.kEmailPassword,
                                ),
                                EntryFormField(
                                  controller: _passwordController,
                                  obscureText: passwordVisible.isShowPassword,
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      passwordVisible.togglePassword();
                                    },
                                    icon: Icon(
                                      passwordVisible.isShowPassword
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                    ),
                                  ),
                                  onSaved: (newValue) {
                                    _passwordController.text = newValue!;
                                  },
                                  validator: (value) {
                                    if (_emailController.text.isNotEmpty &&
                                        _passwordController.text.isNotEmpty) {
                                      RegExp regExp = RegExp(r'^.{6,}$');
                                      if (value!.isEmpty) {
                                        return 'Please enter a valid password';
                                      }
                                      if (!regExp.hasMatch(value)) {
                                        return 'Please enter a valid password(min. 6 characters)';
                                      }
                                    }

                                    return null;
                                  },
                                  hintText: 'Enter your password',
                                ),
                                buildSizeBox(30, 0),
                                Text(
                                  'Confirm Password',
                                  style: AppStyles.kEmailPassword,
                                ),
                                EntryFormField(
                                  controller: _confirmPasswordController,
                                  obscureText:
                                      passwordVisible.isShowConfirmPassword,
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      passwordVisible.toggleConfirmPassword();
                                    },
                                    icon: Icon(
                                      passwordVisible.isShowConfirmPassword
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                    ),
                                  ),
                                  onSaved: (newValue) {
                                    _confirmPasswordController.text = newValue!;
                                  },
                                  onChanged: (value) {
                                    setState(() {
                                      _isPasswordMatch = false;
                                    });
                                  },
                                  validator: (value) {
                                    if (_emailController.text.isNotEmpty &&
                                        _confirmPasswordController
                                            .text.isNotEmpty) {
                                      RegExp regExp = RegExp(r'^.{6,}$');
                                      if (value!.isEmpty) {
                                        return 'Please enter a valid password';
                                      }
                                      if (!regExp.hasMatch(value)) {
                                        return 'Please enter a valid password(min. 6 characters)';
                                      }
                                    }
                                    return null;
                                  },
                                  hintText: 'Enter your password',
                                ),
                                _isPasswordMatch
                                    ? Text(
                                        errorMessage,
                                        style: GoogleFonts.poppins(
                                          fontSize: 13,
                                          color: Colors.red,
                                        ),
                                      )
                                    : const SizedBox(),
                                buildSizeBox(30, 0),
                                Button(
                                  child: handleAuthentication.isLoading
                                      ? const SizedBox(
                                          height: 30,
                                          width: 30,
                                          child: CircularProgressIndicator(
                                            color: Colors.white,
                                          ),
                                        )
                                      : Text(
                                          'Sign Up',
                                          style: AppStyles.kSignInButtonText,
                                        ),
                                  onPressed: () async {
                                    if (_passwordController.text ==
                                        _confirmPasswordController.text) {
                                      await handleAuthentication.userSignUp(
                                        context,
                                        _emailController.text,
                                        _passwordController.text,
                                      );
                                      _emailController.clear();
                                      _passwordController.clear();
                                      _confirmPasswordController.clear();
                                    } else {
                                      handleAuthentication.spinnerLoading();

                                      Future.delayed(const Duration(seconds: 2),
                                          () {
                                        setState(() {
                                          _isPasswordMatch = true;
                                          errorMessage =
                                              'Password does not match';
                                        });
                                        handleAuthentication.isLoading = false;
                                      });
                                    }
                                  },
                                ),
                                buildSizeBox(20, 0),
                                RegistrationInfo(
                                  accountText: 'Already have an account?',
                                  text: 'Sign In',
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                ),
                                buildSizeBox(20, 0),
                                const RowDivider(),
                                buildSizeBox(20, 0),
                                const GoogleButton(),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
