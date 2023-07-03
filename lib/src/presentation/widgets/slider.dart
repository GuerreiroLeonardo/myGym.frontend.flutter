// ignore: must_be_immutable
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
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

  SliderWidget(this.mSliderList);

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
            return Container(
              decoration: boxDecoration(
                  radius: 16,
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
                      child: CachedNetworkImage(
                          placeholder: placeholderWidgetFn() as Widget Function(
                              BuildContext, String)?,
                          imageUrl: slider.Image,
                          height: 180,
                          width: width,
                          fit: BoxFit.cover),
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
                                textColor: locator<AppStore>().textPrimaryColor,
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
                        text(slider.info),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
