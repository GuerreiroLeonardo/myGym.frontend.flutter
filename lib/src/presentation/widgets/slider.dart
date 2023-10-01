// ignore: must_be_immutable
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:my_gym_coach/src/config/router/app_router.dart';
import 'package:my_gym_coach/src/presentation/widgets/AppWidget.dart';
import 'package:my_gym_coach/src/presentation/widgets/carousel-slider.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../domain/models/ui/slider.model.dart';
import '../../locator.dart';
import '../../utils/constants/app-colors.dart';
import '../../utils/constants/general.dart';
import '../../utils/store/app-store.dart';

class SliderWidget extends StatelessWidget {
  List<SliderModel>? mSliderList;
  PageRouteInfo<dynamic>? nextPage;

  SliderWidget(this.mSliderList, this.nextPage);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    width = width - 50;

    return MyGymCarouselSlider(
      viewportFraction: 0.9,
      enlargeCenterPage: true,
      scrollDirection: Axis.horizontal,
      items: mSliderList!.map((slider) {
        return Builder(
          builder: (BuildContext context) {
            return GestureDetector(
              onTap: () {
                if (nextPage != null) {
                  appRouter.push(this.nextPage!);
                }
              },
              child: Container(
                decoration: boxDecoration(
                    radius: 20,
                    showShadow: true,
                    bgColor: context.scaffoldBackgroundColor),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(16.0),
                          topRight: Radius.circular(16.0),
                        ),
                        child: Stack(
                          children: [
                            CachedNetworkImage(
                                placeholder: placeholderWidgetFn() as Widget
                                    Function(BuildContext, String)?,
                                imageUrl: slider.Image,
                                height: 180,
                                width: width,
                                fit: BoxFit.cover),
                            // ! TODO: put this outside of this widget.
                            Align(
                              alignment: Alignment.topRight,
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Container(
                                  alignment: Alignment.center,
                                  width: 40,
                                  height: 40,
                                  decoration: boxDecoration(
                                      bgColor: Colors.white,
                                      radius: 50,
                                      color: Colors.red),
                                  child: text("A",
                                      isCentered: true,
                                      fontWeight: FontWeight.w800),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(16, 0, 16, 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              text(slider.name,
                                  textColor:
                                      locator<AppStore>().textPrimaryColor,
                                  fontSize: textSizeLargeMedium,
                                  fontFamily: fontMedium),
                              RichText(
                                text: TextSpan(
                                  style: Theme.of(context).textTheme.bodyText2,
                                  children: [
                                    const WidgetSpan(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 4.0),
                                        child: Icon(
                                          Icons.access_time,
                                          color: t6icon_color,
                                          size: 16,
                                        ),
                                      ),
                                    ),
                                    TextSpan(
                                        text: slider.duration,
                                        style: const TextStyle(
                                            fontSize: textSizeSMedium,
                                            color: t6textColorSecondary)),
                                  ],
                                ),
                              )
                            ],
                          ),
                          text(slider.info, fontSize: textSizeSMedium),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
