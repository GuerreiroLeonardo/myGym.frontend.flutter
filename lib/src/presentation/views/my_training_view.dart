// import 'package:flutter/material.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';

// class MyTrainingView extends HookWidget {
//   const MyTrainingView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     // changeStatusColor(locator<AppStore>().appBarColor!);
//     // state
//     final ValueNotifier<int> selectedPos = useState(1);
//     final ValueNotifier<List<SliderModel>> mSliderList = useState(getSliders());
//     final ValueNotifier<List<dynamic>> mActivity = useState(getData());
//     return Scaffold(
//       backgroundColor: context.scaffoldBackgroundColor,
//       body: SafeArea(
//         child: Stack(
//           children: <Widget>[
//             SingleChildScrollView(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   Container(
//                     color: context.scaffoldBackgroundColor,
//                     child: Padding(
//                       padding: const EdgeInsets.all(20.0),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: <Widget>[
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: <Widget>[
//                               text(t6_lbl_hi_carnegie,
//                                   textColor:
//                                       locator<AppStore>().textPrimaryColor),
//                               Icon(Icons.notifications_active,
//                                   color: locator<AppStore>().iconColor),
//                             ],
//                           ),
//                           text(t6_lbl_how_was_your_day,
//                               textColor: locator<AppStore>().textPrimaryColor,
//                               fontFamily: fontMedium)
//                         ],
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   Container(
//                     margin: const EdgeInsets.only(left: 16),
//                     child: text(t6_lbl_your_progress_this_week,
//                         textColor: t6colorPrimary, fontFamily: fontMedium),
//                   ),
//                   const SizedBox(height: 10),
//                   Container(
//                     margin: const EdgeInsets.only(left: 16, right: 16),
//                     child: CustomTheme(
//                       child: CalendarStrip(
//                         startDate: startDate,
//                         endDate: endDate,
//                         onDateSelected: onSelect,
//                         dateTileBuilder: dateTileBuilder,
//                         iconColor: Colors.transparent,
//                         monthNameWidget: _monthNameWidget,
//                         containerDecoration: boxDecoration(
//                             radius: 16,
//                             showShadow: true,
//                             bgColor: context.scaffoldBackgroundColor),
//                         addSwipeGesture: true,
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   Container(
//                     margin: const EdgeInsets.only(left: 16, right: 16),
//                     child: text(t6_lbl_today_s_workout,
//                         textColor: t6colorPrimary, fontFamily: fontMedium),
//                   ),
//                   const SizedBox(height: 16),
//                   SliderWidget(mSliderList.value),
//                   const SizedBox(height: 16),
//                   Container(
//                     margin: const EdgeInsets.only(left: 16),
//                     child: text(t6_lbl_log_other_activities,
//                         textColor: t6colorPrimary, fontFamily: fontMedium),
//                   ),
//                   const SizedBox(height: 16),
//                   SizedBox(
//                     height: context.width() * 0.32,
//                     child: ListView.builder(
//                         padding: const EdgeInsets.all(8),
//                         scrollDirection: Axis.horizontal,
//                         itemCount: mActivity!.value.length,
//                         shrinkWrap: true,
//                         itemBuilder: (context, index) {
//                           return Activity(mActivity!.value[index], index);
//                         }),
//                   ),
//                   Container(
//                     height: 400,
//                     child: ListView(
//                       shrinkWrap: true,
//                       padding: const EdgeInsets.all(8),
//                       scrollDirection: Axis.horizontal,
//                       children: <Widget>[
//                         Container(
//                           width: context.width() / 1.3,
//                           margin: const EdgeInsets.only(
//                               left: 16, top: 16, right: 16),
//                           decoration: boxDecoration(
//                               radius: 10,
//                               showShadow: true,
//                               bgColor: t6light_blue),
//                           child: (Padding(
//                             padding: const EdgeInsets.all(8),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: <Widget>[
//                                 text(t6_lbl_calories,
//                                     textColor: t6colorPrimary,
//                                     fontFamily: fontMedium),
//                                 const SizedBox(height: 50),
//                                 Padding(
//                                   padding:
//                                       const EdgeInsets.fromLTRB(0, 10, 10, 0),
//                                   child: Row(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.center,
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceEvenly,
//                                     children: <Widget>[
//                                       Bar(0.3),
//                                       Bar(0.5),
//                                       Bar(0.7),
//                                       Bar(0.5),
//                                       Bar(0.5),
//                                       Bar(0.7),
//                                       Bar(0.98),
//                                       Bar(0.54),
//                                       Bar(0.99),
//                                       Bar(0.99),
//                                       Bar(0.94),
//                                       Bar(0.94),
//                                       Bar(0.54),
//                                     ],
//                                   ),
//                                 ),
//                                 RotationTransition(
//                                   turns:
//                                       const AlwaysStoppedAnimation(180 / 360),
//                                   child: Padding(
//                                     padding:
//                                         const EdgeInsets.fromLTRB(0, 10, 10, 0),
//                                     child: Row(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.center,
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceEvenly,
//                                       children: <Widget>[
//                                         Bar(0.3),
//                                         Bar(0.5),
//                                         Bar(0.7),
//                                         Bar(0.5),
//                                         Bar(0.5),
//                                         Bar(0.7),
//                                         Bar(0.98),
//                                         Bar(0.54),
//                                         Bar(0.99),
//                                         Bar(0.99),
//                                         Bar(0.94),
//                                         Bar(0.94),
//                                         Bar(0.54),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           )),
//                         ),
//                         Container(
//                           margin: const EdgeInsets.only(
//                               left: 16, right: 16, top: 16),
//                           width: context.width() / 1.3,
//                           decoration: boxDecoration(
//                               radius: 10,
//                               showShadow: true,
//                               bgColor: t6light_blue),
//                           child: Padding(
//                             padding: const EdgeInsets.all(16),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: <Widget>[
//                                 text(t6_lbl_log_other_activities,
//                                     textColor: t6colorPrimary,
//                                     fontFamily: fontMedium),
//                                 const SizedBox(height: 20),
//                                 Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: <Widget>[
//                                     circleProgressDashboard("70.0g",
//                                         t6_lbl_sugar, t6_lbl_sugar, 0.8),
//                                     circleProgressDashboard(
//                                         "55.0g", t6_lbl_fats, t6_lbl_over, 0.2),
//                                   ],
//                                 ),
//                                 const SizedBox(height: 20),
//                                 Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: <Widget>[
//                                     circleProgressDashboard("55.0g",
//                                         t6_lbl_carbs, t6_lbl_over, 0.5),
//                                     circleProgressDashboard("70.0g",
//                                         t6_lbl_protein, t6_lbl_over, 0.7),
//                                   ],
//                                 )
//                               ],
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   const SizedBox(height: 16)
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: Stack(
//         alignment: Alignment.topCenter,
//         children: <Widget>[
//           Container(
//             //margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
//             height: 70,
//             decoration: BoxDecoration(
//               color: context.scaffoldBackgroundColor,
//               borderRadius: const BorderRadius.all(Radius.circular(10)),
//               boxShadow: [
//                 BoxShadow(
//                   color: shadowColorGlobal,
//                   blurRadius: 10,
//                   spreadRadius: 2,
//                 ),
//               ],
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: <Widget>[
//                 Flexible(
//                   child: tabItem(
//                     1,
//                     t6_ic_activity,
//                     "Home",
//                   ),
//                   flex: 1,
//                 ),
//                 Flexible(
//                   child: tabItem(
//                     2,
//                     t6_ic_list,
//                     "Treinos",
//                   ),
//                   flex: 1,
//                 ),
//                 Flexible(
//                   child: tabItem(3, t6_ic_meal, "Vídeos",
//                       nextView: VideosViewRoute()),
//                   flex: 1,
//                 ),
//                 Flexible(
//                   child: tabItem(4, t6_ic_sleep, "Perfil",
//                       nextView: ProfileViewRoute()),
//                   flex: 1,
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
