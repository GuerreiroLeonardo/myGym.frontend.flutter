import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_gym_coach/src/domain/models/ui/log.model.dart';
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

class HomeView extends HookWidget {
  DateTime startDate = DateTime.now().subtract(const Duration(days: 2));
  DateTime endDate = DateTime.now().add(const Duration(days: 30));
  DateTime selectedDate = DateTime.now().subtract(const Duration(days: 2));
  List<DateTime> markedDates = [
    DateTime.now().subtract(const Duration(days: 1)),
    DateTime.now().subtract(const Duration(days: 2)),
    DateTime.now().add(const Duration(days: 4))
  ];
  var isSelected = 1;

  HomeView({Key? key}) : super(key: key);

  onSelect(data) {
    print("Selected Date -> $data");
  }

  _monthNameWidget(monthName) {
    return Container(
      child: Text(
        monthName,
        style: const TextStyle(
          fontSize: 16,
          color: Colors.transparent,
        ),
      ),
      padding: const EdgeInsets.only(top: 8, bottom: 0),
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

  dateTileBuilder(
      date, selectedDate, rowIndex, dayName, isDateMarked, isDateOutOfRange) {
    bool isSelectedDate = date.compareTo(selectedDate) == 0;
    TextStyle normalStyle =
        const TextStyle(fontSize: 16, color: t6textColorSecondary);
    TextStyle selectedStyle = const TextStyle(
        fontSize: 17, fontWeight: FontWeight.w800, color: t6white);
    TextStyle dayNameStyle =
        const TextStyle(fontSize: 14.5, color: t6colorPrimary);

    List<Widget> _children = [
      Text(dayName, style: dayNameStyle),
      Text(date.day.toString(),
          style: !isSelectedDate ? normalStyle : selectedStyle),
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

  Widget tabItem(var pos, var icon, var name, {var nextView = false}) {
    return GestureDetector(
      onTap: () {
        isSelected = pos;
        if (nextView is PageRouteInfo) {
          appRouter.push(nextView);
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          alignment: Alignment.center,
          decoration: isSelected == pos
              ? BoxDecoration(
                  color: t6colorPrimary, borderRadius: BorderRadius.circular(8))
              : const BoxDecoration(),
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: Column(
              children: <Widget>[
                SvgPicture.asset(
                  icon,
                  width: 20,
                  height: 20,
                  color: isSelected == pos ? t6white : t6textColorSecondary,
                ),
                text(name,
                    textColor:
                        isSelected == pos ? t6white : t6textColorSecondary,
                    fontSize: textSizeSmall)
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var width = context.width();
    // changeStatusColor(locator<AppStore>().appBarColor!);
    // state
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
                  Container(
                    color: context.scaffoldBackgroundColor,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              text(
                                  "${hi} ${locator<AppStore>().googleUserName != null ? locator<AppStore>().googleUserName.split(' ')[0] : "Student"}",
                                  textColor:
                                      locator<AppStore>().textPrimaryColor),
                              Icon(Icons.notifications_active,
                                  color: locator<AppStore>().iconColor),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  // AppButton(
                  //   elevation: 2,
                  //   width: width * 0.95,
                  //   padding: EdgeInsets.all(18),
                  //   margin: EdgeInsets.only(left: 16, right: 16, bottom: 16),
                  //   child: Row(
                  //     children: [
                  //       Icon(
                  //         Icons.fitness_center_rounded,
                  //         color: Colors.black,
                  //       ),
                  //       SizedBox(
                  //         width: 10,
                  //       ),
                  //       Text(my_training, style: boldTextStyle()),
                  //     ],
                  //   ),
                  //   color: context.cardColor,
                  //   onTap: () {},
                  // ),
                  // OutlinedButton(
                  //   onPressed: null,
                  //   style: ButtonStyle(
                  //       shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  //           borderRadius: BorderRadius.circular(30.0))),
                  //       minimumSize: MaterialStateProperty.all(Size(width, 50)),
                  //       elevation: MaterialStateProperty.all(2),
                  //       backgroundColor:
                  //           MaterialStateProperty.all(Colors.white)),
                  //   child: Row(
                  //     children: [
                  //       const Icon(
                  //         Icons.fitness_center_rounded,
                  //         color: Colors.black,
                  //       ),
                  //       const SizedBox(
                  //         width: 10,
                  //       ),
                  //       Text(my_training, style: boldTextStyle()),
                  //     ],
                  //   ),
                  // ),
                  GestureDetector(
                    onTap: () {
                      appRouter.push(const MyTrainingViewRoute());
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                        gradient: const LinearGradient(
                          colors: [
                            Colors.blue,
                            Color.fromARGB(255, 115, 113, 159)
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: Colors.blueGrey,
                          width: 2,
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 16),
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.fitness_center_rounded,
                            color: Colors.black,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(my_training, style: boldTextStyle()),
                          const Spacer(),
                          const Icon(
                            Icons.arrow_forward,
                            color: Colors.black,
                          ),
                        ],
                      ),
                    ),
                  ),
                  // 20.height,
                  // Container(
                  //   margin: const EdgeInsets.only(left: 16),
                  //   child: text(t6_lbl_your_progress_this_week,
                  //       textColor: t6colorPrimary, fontFamily: fontMedium),
                  // ),
                  // const SizedBox(height: 10),
                  // Container(
                  //   margin: const EdgeInsets.only(left: 16, right: 16),
                  //   child: CustomTheme(
                  //     child: CalendarStrip(
                  //       startDate: startDate,
                  //       endDate: endDate,
                  //       onDateSelected: onSelect,
                  //       dateTileBuilder: dateTileBuilder,
                  //       iconColor: Colors.transparent,
                  //       monthNameWidget: _monthNameWidget,
                  //       containerDecoration: boxDecoration(
                  //           radius: 16,
                  //           showShadow: true,
                  //           bgColor: context.scaffoldBackgroundColor),
                  //       addSwipeGesture: true,
                  //     ),
                  //   ),
                  // ),
                  // const SizedBox(height: 20),
                  // Container(
                  //   margin: const EdgeInsets.only(left: 16, right: 16),
                  //   child: text(t6_lbl_today_s_workout,
                  //       textColor: t6colorPrimary, fontFamily: fontMedium),
                  // ),
                  // const SizedBox(height: 16),
                  // SliderWidget(mSliderList.value),
                  // const SizedBox(height: 16),
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
                  Container(
                    height: 400,
                    child: ListView(
                      shrinkWrap: true,
                      padding: const EdgeInsets.all(8),
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        Container(
                          width: context.width() / 1.3,
                          margin: const EdgeInsets.only(
                              left: 16, top: 16, right: 16),
                          decoration: boxDecoration(
                              radius: 10,
                              showShadow: true,
                              bgColor: t6light_blue),
                          child: (Padding(
                            padding: const EdgeInsets.all(8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                text(t6_lbl_calories,
                                    textColor: t6colorPrimary,
                                    fontFamily: fontMedium),
                                const SizedBox(height: 50),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 10, 10, 0),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Bar(0.3),
                                      Bar(0.5),
                                      Bar(0.7),
                                      Bar(0.5),
                                      Bar(0.5),
                                      Bar(0.7),
                                      Bar(0.98),
                                      Bar(0.54),
                                      Bar(0.99),
                                      Bar(0.99),
                                      Bar(0.94),
                                      Bar(0.94),
                                      Bar(0.54),
                                    ],
                                  ),
                                ),
                                RotationTransition(
                                  turns:
                                      const AlwaysStoppedAnimation(180 / 360),
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 10, 10, 0),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        Bar(0.3),
                                        Bar(0.5),
                                        Bar(0.7),
                                        Bar(0.5),
                                        Bar(0.5),
                                        Bar(0.7),
                                        Bar(0.98),
                                        Bar(0.54),
                                        Bar(0.99),
                                        Bar(0.99),
                                        Bar(0.94),
                                        Bar(0.94),
                                        Bar(0.54),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )),
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                              left: 16, right: 16, top: 16),
                          width: context.width() / 1.3,
                          decoration: boxDecoration(
                              radius: 10,
                              showShadow: true,
                              bgColor: t6light_blue),
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                text(t6_lbl_log_other_activities,
                                    textColor: t6colorPrimary,
                                    fontFamily: fontMedium),
                                const SizedBox(height: 20),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    circleProgressDashboard("70.0g",
                                        t6_lbl_sugar, t6_lbl_sugar, 0.8),
                                    circleProgressDashboard(
                                        "55.0g", t6_lbl_fats, t6_lbl_over, 0.2),
                                  ],
                                ),
                                const SizedBox(height: 20),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    circleProgressDashboard("55.0g",
                                        t6_lbl_carbs, t6_lbl_over, 0.5),
                                    circleProgressDashboard("70.0g",
                                        t6_lbl_protein, t6_lbl_over, 0.7),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16)
                ],
              ),
            ),
          ],
        ),
      ),
      // bottomNavigationBar: Stack(
      //   alignment: Alignment.topCenter,
      //   children: <Widget>[
      //     Container(
      //       //margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      //       height: 70,
      //       decoration: BoxDecoration(
      //         color: context.scaffoldBackgroundColor,
      //         borderRadius: const BorderRadius.all(Radius.circular(10)),
      //         boxShadow: [
      //           BoxShadow(
      //             color: shadowColorGlobal,
      //             blurRadius: 10,
      //             spreadRadius: 2,
      //           ),
      //         ],
      //       ),
      //       child: Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //         children: <Widget>[
      //           Flexible(
      //             child: tabItem(
      //               1,
      //               t6_ic_activity,
      //               "Home",
      //             ),
      //             flex: 1,
      //           ),
      //           Flexible(
      //             child: tabItem(
      //               2,
      //               t6_ic_list,
      //               "Treinos",
      //             ),
      //             flex: 1,
      //           ),
      //           Flexible(
      //             child: tabItem(3, t6_ic_meal, "Vídeos",
      //                 nextView: VideosViewRoute()),
      //             flex: 1,
      //           ),
      //           Flexible(
      //             child: tabItem(4, t6_ic_sleep, "Perfil",
      //                 nextView: ProfileViewRoute()),
      //             flex: 1,
      //           ),
      //         ],
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}

// ignore: must_be_immutable
class Activity extends StatelessWidget {
  late LogModel model;

  Activity(LogModel model, int pos) {
    this.model = model;
  }

  @override
  Widget build(BuildContext context) {
    var w = context.width();

    return Container(
      margin: const EdgeInsets.only(left: 16, right: 4, bottom: 6),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            decoration: boxDecoration(
                radius: 10,
                showShadow: true,
                bgColor: context.scaffoldBackgroundColor),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: SvgPicture.asset(model.Image,
                  height: w * 0.08,
                  width: w * 0.08,
                  color: locator<AppStore>().iconSecondaryColor),
            ),
          ),
          const SizedBox(height: 8),
          text(model.name, textColor: locator<AppStore>().textSecondaryColor)
        ],
      ),
    );
  }
}
