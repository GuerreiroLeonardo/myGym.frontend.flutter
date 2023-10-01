import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_gym_coach/src/config/router/app_router.dart';
import 'package:my_gym_coach/src/presentation/cubits/firebase_authentication/firebase_authentication_cubit.dart';
import 'package:my_gym_coach/src/presentation/widgets/buttons.dart';
import 'package:my_gym_coach/src/utils/constants/app-colors.dart';
import 'package:my_gym_coach/src/utils/constants/general.dart';
import 'package:my_gym_coach/src/utils/constants/images.dart';
import 'package:my_gym_coach/src/utils/constants/strings.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:nb_utils/nb_utils.dart';

import '../widgets/AppWidget.dart';
import '../widgets/dots_indicator/dots_indicator.dart';

class WalkthroughView extends HookWidget {
  WalkthroughView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pageController = usePageController();

    final currentIndexPage = useState(0);
    final pageLength = useState(2);
    return Scaffold(
        body: SafeArea(
      child: Stack(
        children: <Widget>[
          Container(
            alignment: Alignment.topRight,
            child: GestureDetector(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: text("Skip",
                    textAllCaps: true,
                    textColor: t6colorPrimary,
                    fontFamily: fontMedium),
              ),
              onTap: () {
                appRouter.push(SignInViewRoute());
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20),
            width: context.width(),
            height: context.height(),
            child: PageView(
              controller: pageController,
              children: <Widget>[
                WalkThrough(textContent: t6_ic_walk1, title: walkThroghText1),
                WalkThrough(textContent: t6_ic_walk2, title: walkThroghText2),
              ],
              onPageChanged: (value) {
                currentIndexPage.value = value;
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Align(
                  child: DotsIndicator(
                      dotsCount: pageLength.value,
                      position: currentIndexPage.value,
                      decorator: const DotsDecorator(
                        color: t6view_color,
                        activeColor: t6colorPrimary,
                      )),
                ),
                const SizedBox(
                  height: 25,
                ),
                MainButton(
                  textContent: currentIndexPage.value == pageLength.value - 1
                      ? walkThroughButtonText
                      : "Próximo",
                  onPressed: () {
                    if (currentIndexPage.value == pageLength.value - 1) {
                      appRouter.push(SignInViewRoute());
                      return;
                    }
                    currentIndexPage.value += 1;
                    pageController.animateToPage(
                      1,
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.easeInOut,
                    );
                  },
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }
}

class WalkThrough extends StatelessWidget {
  final String textContent;
  final String title;

  WalkThrough({Key? key, required this.textContent, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var h = context.height();

    return Container(
      width: context.width(),
      alignment: Alignment.topCenter,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: CachedNetworkImage(
              placeholder: placeholderWidgetFn() as Widget Function(
                  BuildContext, String)?,
              imageUrl: textContent,
              height: (context.height()) / 2.5,
            ),
          ),
          SizedBox(
            height: h * 0.08,
          ),
          Container(
            margin: const EdgeInsets.only(left: 30, right: 30),
            child: Center(
                child: Text(
              title,
              style: const TextStyle(
                  fontSize: textSizeLargeMedium, color: t6textColorSecondary),
              textAlign: TextAlign.center,
            )),
          ),
        ],
      ),
    );
  }
}
