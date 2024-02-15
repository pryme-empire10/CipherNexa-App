import 'package:ciphernexa/conts/color.dart';
import 'package:ciphernexa/conts/styles.dart';
import 'package:ciphernexa/services/auth_service.dart';

import 'package:ciphernexa/utils/size_box.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/handle_authentication.dart';

class HomeScreen extends StatefulWidget {
  final VoidCallback? onSignOut;
  const HomeScreen({super.key, this.onSignOut});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late String text;

  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    getEmail();
  }

  void getEmail() {
    final currentEmail =
        Provider.of<HandleAuthentication>(context, listen: false);
    text = currentEmail.auth.currentUser!.email!;
  }

  @override
  Widget build(BuildContext context) {
    final signAuth = Provider.of<HandleAuthentication>(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.pink,
        title: Text(
          'Home Screen',
          style: AppStyles.kHeader.copyWith(fontSize: 20),
        ),
      ),
      body: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Logged in as:',
            ),
            Text(text),
            buildSizeBox(20, 0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.kPrimaryColor,
                  minimumSize: const Size(100, 50)),
              onPressed: () {
                setState(() {
                  isLoading = true;
                });
        
                Future.delayed(const Duration(seconds: 2), () {
                  signAuth.signOut(context);
                  AuthService().signOutWithGoogle();
                  setState(() {
                    isLoading = false;
                  });
                });
                signAuth.signInFormKey.currentState!.reset();
              },
              child: isLoading
                  ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    )
                  : Text(
                      'Sign Out',
                      style: AppStyles.kSignUpText.copyWith(
                        color: AppColors.kSecondaryColor,
                      ),
                    ),
            )
          ],
        ),
      ),
    );
  }
}
