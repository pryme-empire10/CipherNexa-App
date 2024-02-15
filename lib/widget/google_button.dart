import 'package:ciphernexa/conts/color.dart';
import 'package:ciphernexa/conts/styles.dart';
import 'package:ciphernexa/screen/home_screen.dart';
import 'package:ciphernexa/services/auth_service.dart';
import 'package:flutter/material.dart';

class GoogleButton extends StatefulWidget {
  const GoogleButton({
    super.key,
  });

  @override
  State<GoogleButton> createState() => _GoogleButtonState();
}

class _GoogleButtonState extends State<GoogleButton> {
  bool loadingVisibilty = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        setState(() {
          loadingVisibilty = true;
        });
        try {
          await AuthService().signInWithGoogle().then((value) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const HomeScreen(),
              ),
            );
          }).then((value) {
            setState(() {
              loadingVisibilty = false;
            });
          });
        } catch (e) {
          print(e);
        }
      },
      child: Container(
        decoration: BoxDecoration(
            color: Colors.black, borderRadius: BorderRadius.circular(10)),
        height: 55,
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/googlelogo.png', height: 25),
            Text(
              'Google',
              style:
                  AppStyles.kSignIn.copyWith(color: AppColors.kSecondaryColor),
            ),
          ],
        ),
      ),
    );
  }
}
