import 'package:ciphernexa/conts/color.dart';
import 'package:ciphernexa/conts/styles.dart';
import 'package:ciphernexa/provider/password_visibility.dart';
import 'package:ciphernexa/provider/handle_authentication.dart';

import 'package:ciphernexa/screen/sign_up_screen.dart';

import 'package:ciphernexa/utils/size_box.dart';
import 'package:ciphernexa/widget/button.dart';
import 'package:ciphernexa/widget/registration_info_row.dart';
import 'package:ciphernexa/widget/google_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widget/entry_formfield.dart';
import '../widget/header_text_container.dart';
import '../widget/row_divider.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();
  // final HandleAuthentication _signIn = HandleAuthentication();
  final FocusNode _passwordFocusNode = FocusNode();

  // bool isShowError = false;
  // bool isSpinnerLoading = false;
  // bool isShowPassword = true;
  bool _isHidden = false;

  final String message = 'The email or password you have entered is incorrect.';

  showVisibilityIcon() {
    if (_passwordController.text.isEmpty) {
      setState(() {
        _isHidden = false;
      });
    } else {
      setState(() {
        _isHidden = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final authProvider =
          Provider.of<HandleAuthentication>(context, listen: false);
      String email = '';
      String password = '';
      if (email.isNotEmpty && password.isNotEmpty) {
        authProvider.userSignIn(email, password, context);
      }
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final pass = Provider.of<HandleAuthentication>(context);
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
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
                  margin: const EdgeInsets.only(top: 50),
                  decoration: BoxDecoration(
                    color: AppColors.kSecondaryColor,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 30, top: 40, right: 30),
                      child: Form(
                        key: pass.signInFormKey,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Sign In',
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
                              onSaved: (value) {
                                _emailController.text = value!;
                              },
                              validator: (value) {
                                RegExp regExp = RegExp(
                                  '^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+[a-zA-Z]',
                                );
                                if (value == null || value.isEmpty) {
                                  return 'Email must not be empty';
                                }
                                if (!regExp.hasMatch(value)) {
                                  return 'Invalid Email format';
                                }
                                return null;
                              },
                              hintText: 'Enter your email address',
                            ),
                            buildSizeBox(30, 0),
                            Text(
                              'Password',
                              style: AppStyles.kEmailPassword,
                            ),
                            Consumer<PasswordVisibilty>(
                              builder: (context, passwordVisibilty, child) {
                                return EntryFormField(
                                  controller: _passwordController,
                                  focusNode: _passwordFocusNode,
                                  obscureText: passwordVisibilty.isShowPassword,
                                  validator: (value) {
                                    if (_emailController.text.isNotEmpty &&
                                        _passwordController.text.isNotEmpty) {
                                      RegExp regex = RegExp(r'^.{6,}$');
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter a valid password';
                                      }
                                      if (!regex.hasMatch(value)) {
                                        return 'Please enter a valid password(min. 6 characters)';
                                      }
                                    }
                                    return null;
                                  },
                                  suffixIcon: Visibility(
                                    visible: _isHidden,
                                    child: IconButton(
                                      onPressed: () {
                                        passwordVisibilty.togglePassword();
                                      },
                                      icon: Icon(
                                        passwordVisibilty.isShowPassword
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                      ),
                                    ),
                                  ),
                                  onSaved: (value) {
                                    _passwordController.text = value!;
                                  },
                                  onChanged: (value) {
                                    showVisibilityIcon();
                                  },
                                  hintText: 'Enter your password',
                                );
                              },
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                'Forgot password ?',
                                style: AppStyles.kEmailPassword.copyWith(
                                  color: AppColors.kPrimaryColor,
                                ),
                              ),
                            ),
                            buildSizeBox(30, 0),
                            Button(
                              child: pass.isLoading
                                  ? const SizedBox(
                                      height: 25,
                                      width: 25,
                                      child: CircularProgressIndicator(
                                        color: Colors.white,
                                      ),
                                    )
                                  : Text(
                                      'Sign In',
                                      style: AppStyles.kSignInButtonText,
                                    ),
                              onPressed: () async {
                                await pass.userSignIn(
                                  _emailController.text,
                                  _passwordController.text,
                                  context,
                                );

                                Future.delayed(const Duration(seconds: 2), () {
                                  _emailController.clear();
                                  _passwordController.clear();
                                });
                              },
                            ),
                            buildSizeBox(20, 0),
                            RegistrationInfo(
                              accountText: 'Don\'t have an account?',
                              text: 'Sign Up',
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const SignUpScreen(),
                                  ),
                                );
                              },
                            ),
                            buildSizeBox(30, 0),
                            const RowDivider(),
                            buildSizeBox(20, 0),
                            const GoogleButton()
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
