import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_gym_coach/src/domain/models/ui/log.model.dart';
import 'package:my_gym_coach/src/presentation/views/home_view.dart';
import 'package:my_gym_coach/src/presentation/views/profile.dart';
import 'package:my_gym_coach/src/utils/constants/app-colors.dart';
import 'package:my_gym_coach/src/utils/store/app-store.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../config/router/app_router.dart';
import '../../domain/models/ui/slider.model.dart';
import '../../locator.dart';
import '../../utils/constants/general.dart';
import '../../utils/constants/images.dart';
import '../../utils/constants/strings.dart';
import '../../utils/temp/DataGenerator.dart';
import '../widgets/AppWidget.dart';
import '../widgets/bar.dart';
import '../widgets/calendar_strip.dart';
import '../widgets/circle_progress.dart';
import '../widgets/slider.dart';

class MyTrainingView extends HookWidget {
  const MyTrainingView({super.key});

  onSelect(data) {
    print("Selected Date -> $data");
  }

  _monthNameWidget(monthName) {
    return Container(
      child: Text(
        monthName,
        style: const TextStyle(
          fontSize: 16,
          color: t6colorPrimary,
        ),
      ),
      padding: const EdgeInsets.only(top: 5, bottom: 5),
    );
  }

  dateTileBuilder(
      date, selectedDate, rowIndex, dayName, isDateMarked, isDateOutOfRange) {
    bool isSelectedDate = date.compareTo(selectedDate) == 0;
    TextStyle normalStyle =
        const TextStyle(fontSize: 16, color: t6textColorSecondary);
    TextStyle selectedStyle = const TextStyle(
        fontSize: 16, fontWeight: FontWeight.w800, color: t6white);
    TextStyle dayNameStyle =
        const TextStyle(fontSize: 14.5, color: t6colorPrimary);

    List<Widget> _children = [
      Text(dayName, style: dayNameStyle),
      Text(date.day.toString(),
          style: !isSelectedDate ? normalStyle : selectedStyle),
      Container(
          alignment: Alignment.center,
          child:
              Text("A", style: !isSelectedDate ? normalStyle : selectedStyle)),
    ];

    if (isDateMarked == true) {
      _children.add(getMarkedIndicatorWidget());
    }

    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: !isSelectedDate ? Colors.transparent : t6view_color,
        borderRadius: const BorderRadius.all(Radius.circular(60)),
      ),
      child: Column(
        children: _children,
      ),
    );
  }

  getMarkedIndicatorWidget() {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(
        margin: const EdgeInsets.only(left: 1, right: 1),
        width: 7,
        height: 7,
        decoration:
            const BoxDecoration(shape: BoxShape.circle, color: Colors.red),
      ),
      Container(
        width: 7,
        height: 7,
        decoration:
            const BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
      )
    ]);
  }

  @override
  Widget build(BuildContext context) {
    DateTime startDate = DateTime.now().subtract(const Duration(days: 5));
    DateTime endDate = DateTime.now().add(const Duration(days: 30));
    DateTime selectedDate = DateTime.now().subtract(const Duration(days: 2));
    final ValueNotifier<int> selectedPos = useState(1);
    final ValueNotifier<List<SliderModel>> mSliderList = useState(getSliders());
    final ValueNotifier<List<dynamic>> mActivity = useState(getData());
    return Scaffold(
      backgroundColor: context.scaffoldBackgroundColor,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TopBar(titleName: my_training),
                  const SizedBox(height: 10),

                  Container(
                    margin: const EdgeInsets.only(left: 0, right: 0),
                    child: CustomTheme(
                      child: CalendarStrip(
                        containerHeight: 115,
                        startDate: startDate,
                        endDate: endDate,
                        onDateSelected: onSelect,
                        dateTileBuilder: dateTileBuilder,
                        iconColor: t6colorPrimary,
                        monthNameWidget: _monthNameWidget,
                        containerDecoration: boxDecoration(
                          radius: 0,
                          showShadow: true,
                          bgColor: context.scaffoldBackgroundColor,
                        ),
                        addSwipeGesture: true,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    margin: const EdgeInsets.only(left: 16, right: 16),
                    child: text(t6_lbl_today_s_workout,
                        textColor: t6colorPrimary, fontFamily: fontMedium),
                  ),
                  const SizedBox(height: 16),
                  SliderWidget(
                    mSliderList.value,
                    const TrainingDetailViewRoute(),
                  ),
                  const SizedBox(height: 16),
                  // Container(
                  //   margin: const EdgeInsets.only(left: 16),
                  //   child: text(t6_lbl_log_other_activities,
                  //       textColor: t6colorPrimary, fontFamily: fontMedium),
                  // ),
                  // const SizedBox(height: 16),
                  // SizedBox(
                  //   height: context.width() * 0.32,
                  //   child: ListView.builder(
                  //       padding: const EdgeInsets.all(8),
                  //       scrollDirection: Axis.horizontal,
                  //       itemCount: mActivity!.value.length,
                  //       shrinkWrap: true,
                  //       itemBuilder: (context, index) {
                  //         return Activity(mActivity!.value[index], index);
                  //       }),
                  // ),
                  // Container(
                  //   height: 400,
                  //   child: ListView(
                  //     shrinkWrap: true,
                  //     padding: const EdgeInsets.all(8),
                  //     scrollDirection: Axis.horizontal,
                  //     children: <Widget>[
                  //       Container(
                  //         width: context.width() / 1.3,
                  //         margin: const EdgeInsets.only(
                  //             left: 16, top: 16, right: 16),
                  //         decoration: boxDecoration(
                  //             radius: 10,
                  //             showShadow: true,
                  //             bgColor: t6light_blue),
                  //         child: (Padding(
                  //           padding: const EdgeInsets.all(8),
                  //           child: Column(
                  //             crossAxisAlignment: CrossAxisAlignment.start,
                  //             children: <Widget>[
                  //               text(t6_lbl_calories,
                  //                   textColor: t6colorPrimary,
                  //                   fontFamily: fontMedium),
                  //               const SizedBox(height: 50),
                  //               Padding(
                  //                 padding:
                  //                     const EdgeInsets.fromLTRB(0, 10, 10, 0),
                  //                 child: Row(
                  //                   crossAxisAlignment:
                  //                       CrossAxisAlignment.center,
                  //                   mainAxisAlignment:
                  //                       MainAxisAlignment.spaceEvenly,
                  //                   children: <Widget>[
                  //                     Bar(0.3),
                  //                     Bar(0.5),
                  //                     Bar(0.7),
                  //                     Bar(0.5),
                  //                     Bar(0.5),
                  //                     Bar(0.7),
                  //                     Bar(0.98),
                  //                     Bar(0.54),
                  //                     Bar(0.99),
                  //                     Bar(0.99),
                  //                     Bar(0.94),
                  //                     Bar(0.94),
                  //                     Bar(0.54),
                  //                   ],
                  //                 ),
                  //               ),
                  //               RotationTransition(
                  //                 turns:
                  //                     const AlwaysStoppedAnimation(180 / 360),
                  //                 child: Padding(
                  //                   padding:
                  //                       const EdgeInsets.fromLTRB(0, 10, 10, 0),
                  //                   child: Row(
                  //                     crossAxisAlignment:
                  //                         CrossAxisAlignment.center,
                  //                     mainAxisAlignment:
                  //                         MainAxisAlignment.spaceEvenly,
                  //                     children: <Widget>[
                  //                       Bar(0.3),
                  //                       Bar(0.5),
                  //                       Bar(0.7),
                  //                       Bar(0.5),
                  //                       Bar(0.5),
                  //                       Bar(0.7),
                  //                       Bar(0.98),
                  //                       Bar(0.54),
                  //                       Bar(0.99),
                  //                       Bar(0.99),
                  //                       Bar(0.94),
                  //                       Bar(0.94),
                  //                       Bar(0.54),
                  //                     ],
                  //                   ),
                  //                 ),
                  //               ),
                  //             ],
                  //           ),
                  //         )),
                  //       ),
                  //       Container(
                  //         margin: const EdgeInsets.only(
                  //             left: 16, right: 16, top: 16),
                  //         width: context.width() / 1.3,
                  //         decoration: boxDecoration(
                  //             radius: 10,
                  //             showShadow: true,
                  //             bgColor: t6light_blue),
                  //         child: Padding(
                  //           padding: const EdgeInsets.all(16),
                  //           child: Column(
                  //             crossAxisAlignment: CrossAxisAlignment.start,
                  //             children: <Widget>[
                  //               text(t6_lbl_log_other_activities,
                  //                   textColor: t6colorPrimary,
                  //                   fontFamily: fontMedium),
                  //               const SizedBox(height: 20),
                  //               Row(
                  //                 mainAxisAlignment:
                  //                     MainAxisAlignment.spaceBetween,
                  //                 children: <Widget>[
                  //                   circleProgressDashboard("70.0g",
                  //                       t6_lbl_sugar, t6_lbl_sugar, 0.8),
                  //                   circleProgressDashboard(
                  //                       "55.0g", t6_lbl_fats, t6_lbl_over, 0.2),
                  //                 ],
                  //               ),
                  //               const SizedBox(height: 20),
                  //               Row(
                  //                 mainAxisAlignment:
                  //                     MainAxisAlignment.spaceBetween,
                  //                 children: <Widget>[
                  //                   circleProgressDashboard("55.0g",
                  //                       t6_lbl_carbs, t6_lbl_over, 0.5),
                  //                   circleProgressDashboard("70.0g",
                  //                       t6_lbl_protein, t6_lbl_over, 0.7),
                  //                 ],
                  //               )
                  //             ],
                  //           ),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  const SizedBox(height: 16)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
