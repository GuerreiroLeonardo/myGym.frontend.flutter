import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../constants/app-colors.dart';
import '../constants/general.dart';
import '../locale/AppLocalizations.dart';
import '../locale/Languages.dart';

class AppStore {
  bool isGoogleSignedIn = false;
  String googleUserName = '';
  String googleUserEmail = '';
  String googleUserPhotoUrl = '';
  bool isDarkModeOn = false;
  bool isHover = false;
  // List<ProTheme> webListingList = [];
  Color? scaffoldBackground;
  Color? backgroundColor;
  Color? backgroundSecondaryColor;
  Color? textPrimaryColor;
  Color? appColorPrimaryLightColor;
  Color? textSecondaryColor;
  Color? appBarColor;
  Color? iconColor;
  Color? iconSecondaryColor;
  String selectedLanguageCode = defaultLanguage;

  var selectedDrawerItem = -1;

  set language(BaseLanguage language) {}

  Future<void> toggleDarkMode({bool? value}) async {
    isDarkModeOn = value ?? !isDarkModeOn;

    if (isDarkModeOn) {
      scaffoldBackground = appBackgroundColorDark;

      appBarColor = appBackgroundColorDark;
      backgroundColor = Colors.white;
      backgroundSecondaryColor = Colors.white;
      appColorPrimaryLightColor = cardBackgroundBlackDark;

      iconColor = iconColorPrimary;
      iconSecondaryColor = iconColorSecondary;

      textPrimaryColor = whiteColor;
      textSecondaryColor = Colors.white54;

      textPrimaryColorGlobal = whiteColor;
      textSecondaryColorGlobal = Colors.white54;
      shadowColorGlobal = appShadowColorDark;
    } else {
      scaffoldBackground = whiteColor;

      appBarColor = Colors.white;
      backgroundColor = Colors.black;
      backgroundSecondaryColor = appSecondaryBackgroundColor;
      appColorPrimaryLightColor = appColorPrimaryLight;

      iconColor = iconColorPrimaryDark;
      iconSecondaryColor = iconColorSecondaryDark;

      textPrimaryColor = appTextColorPrimary;
      textSecondaryColor = appTextColorSecondary;

      textPrimaryColorGlobal = appTextColorPrimary;
      textSecondaryColorGlobal = appTextColorSecondary;
      shadowColorGlobal = appShadowColor;
    }
    setStatusBarColor(scaffoldBackground!);

    setValue(isDarkModeOnPref, isDarkModeOn);
  }

  void toggleHover({bool value = false}) => isHover = value;

  Future<void> setLanguage(String val, {BuildContext? context}) async {
    selectedLanguageCode = val;

    await setValue(SELECTED_LANGUAGE_CODE, selectedLanguageCode);
    selectedLanguageDataModel = getSelectedLanguageModel();

    if (context != null) language = BaseLanguage.of(context);
    language = await AppLocalizations().load(Locale(selectedLanguageCode));
  }

  // Future setWebListing(List<ProTheme> data) async {
  //   webListingList = data;
  // }

  // Future clearWebListing() async {
  //   webListingList.clear();
  // }

  void setDrawerItemIndex(int aIndex) {
    selectedDrawerItem = aIndex;
  }

  Future<void> setValueGoogleSignIn({bool? val}) async {
    isGoogleSignedIn = val ?? !isGoogleSignedIn;

    setValue(isGoogleSignedInOnPref, isGoogleSignedIn);
  }

  Future<void> setGoogleUserName({String? name}) async {
    googleUserName = name!;

    setValue(USER_NAME, googleUserName);
  }

  Future<void> setGoogleUserEmail({String? email}) async {
    googleUserEmail = email!;

    setValue(USER_EMAIL, googleUserEmail);
  }

  Future<void> setGoogleUserPhotoUrl({String? photoUrl}) async {
    googleUserPhotoUrl = photoUrl!;

    setValue(USER_IMAGE, googleUserPhotoUrl);
  }
}
