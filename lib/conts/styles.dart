import 'package:ciphernexa/conts/color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyles {
  static TextStyle kHeader = GoogleFonts.lato(
    fontSize: 40,
    fontWeight: FontWeight.w700,
    color: AppColors.kSecondaryColor,
  );

  static TextStyle kSignIn = GoogleFonts.lato(
    fontSize: 20,
    fontWeight: FontWeight.w700,
  );
  static TextStyle kEmailPassword = GoogleFonts.lato(
    fontSize: 15,
    fontWeight: FontWeight.w600,
  );
  static TextStyle kHintTextStyle = GoogleFonts.lato(
    fontSize: 15,
    fontWeight: FontWeight.w500,
    color: AppColors.kGreyColor,
  );
  static TextStyle kSignInButtonText = GoogleFonts.lato(
    fontSize: 17,
    fontWeight: FontWeight.w500,
    color: AppColors.kSecondaryColor,
  );
  static TextStyle kSignUpText = GoogleFonts.lato(
    fontSize: 15,
    fontWeight: FontWeight.w500,
    color: AppColors.kPrimaryColor,
  );
  static TextStyle kCreateAccount = GoogleFonts.lato(
    fontSize: 15,
    fontWeight: FontWeight.w400,
  );
}
