import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
// import 'package:my_gym_coach/Screens/LearnerAchievement.dart';
// import 'package:my_gym_coach/Screens/LearnerFavourites.dart';
// import 'package:my_gym_coach/Screens/LearnerMyFriends.dart';
import 'package:my_gym_coach/main.dart';
// import 'package:my_gym_coach/utils/AppWidget.dart';
// import 'package:my_gym_coach/utils/LearnerColors.dart';
// import 'package:my_gym_coach/utils/LearnerConstant.dart';
// import 'package:my_gym_coach/utils/LearnerImages.dart';
// import 'package:my_gym_coach/utils/LearnerStrings.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../config/router/app_router.dart';
import '../../locator.dart';
import '../../utils/constants/app-colors.dart';
import '../../utils/constants/general.dart';
import '../../utils/constants/images.dart';
import '../../utils/constants/strings.dart';
import '../../utils/store/app-store.dart';
import '../widgets/AppWidget.dart';

class ProfileView extends HookWidget {
  ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final remoteArticlesCubit = BlocProvider.of<RemoteArticlesCubit>(context);
    var width = context.width();
    var height = context.height();
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(top: 16, left: 16, right: 16),
                child: Row(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border:
                              Border.all(color: iconColorPrimary, width: 4)),
                      child: CircleAvatar(
                          backgroundImage: const CachedNetworkImageProvider(
                              learner_ic_Profile),
                          radius: width / 8.5),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        text("Nimasha Perara",
                            fontFamily: fontSemibold,
                            textColor: appTextColorPrimary),
                        text(lbl_390_290_points,
                            textColor: appTextColorPrimary),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: <Widget>[
                            learnerAward(ic_medal, appColorPrimary),
                            learnerAward(ic_crown, appDark_parrot_green),
                            learnerAward(ic_cup, appIconTintDarkCherry),
                            learnerAward(ic_flag, appLightRed),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 30, left: 16),
                child: text(lbl_general,
                    fontFamily: fontBold,
                    textAllCaps: true,
                    textColor: appTextColorPrimary),
              ),
              8.height,
              Container(
                decoration: boxDecoration(
                    bgColor: context.cardColor, showShadow: true, radius: 0),
                child: Column(
                  children: <Widget>[
                    // learnerOption(ic_heart, lbl_favourite_courses).onTap(() {
                    //   LearnerFavourites().launch(context);
                    // }),
                    // learnerOption(ic_user, lbl_my_friends).onTap(() {
                    //   LearnerMyFriends().launch(context);
                    // }),
                    learnerOption(ic_achievements, lbl_achievements).onTap(() {
                      // LearnerAchievements().launch(context);
                      appRouter.push(HomeViewRoute());
                    }),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 25, left: 16),
                child: text(lbl_settings,
                    fontFamily: fontBold,
                    textAllCaps: true,
                    textColor: appTextColorPrimary),
              ),
              8.height,
              Container(
                decoration: boxDecoration(
                    bgColor: context.cardColor, showShadow: true, radius: 0),
                child: Column(
                  children: <Widget>[
                    learnerOption(ic_key, lbl_edit_login_details),
                    learnerOption(ic_correct, lbl_update_interests),
                    learnerOption(ic_block, lbl_blocked_users),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 10, 16, 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Container(
                                decoration: boxDecoration(
                                    bgColor: locator<AppStore>().isDarkModeOn
                                        ? black
                                        : white,
                                    radius: 8,
                                    showShadow: true),
                                width: 40,
                                height: 40,
                                padding: const EdgeInsets.all(10),
                                child: Image.asset('images/ic_theme.png',
                                    color: appColorPrimary),
                              ),
                              16.width,
                              text('DarkMode',
                                  textColor: appTextColorPrimary,
                                  fontFamily: fontSemibold),
                            ],
                          ),
                          Switch(
                            value: locator<AppStore>().isDarkModeOn,
                            activeColor: appColorPrimary,
                            onChanged: (s) {
                              locator<AppStore>().toggleDarkMode(value: s);
                            },
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget learnerAward(var icon, var bgColor) {
  return Container(
    margin: const EdgeInsets.only(right: 10),
    width: 35,
    height: 35,
    decoration: BoxDecoration(shape: BoxShape.circle, color: bgColor),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Image.asset(
        icon,
      ),
    ),
  );
}

Widget learnerOption(var icon, var heading) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(16, 10, 16, 8),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              decoration: boxDecoration(
                  bgColor: locator<AppStore>().isDarkModeOn ? black : white,
                  radius: 8,
                  showShadow: true),
              width: 40,
              height: 40,
              padding: const EdgeInsets.all(10),
              child: SvgPicture.asset(icon),
            ),
            16.width,
            text(heading,
                textColor: appTextColorPrimary, fontFamily: fontSemibold),
          ],
        ),
        const Icon(
          Icons.keyboard_arrow_right,
          color: appTextColorSecondary,
        ),
      ],
    ),
  );
}
