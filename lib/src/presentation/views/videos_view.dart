import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:my_gym_coach/src/config/router/app_router.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../main.dart';
import '../../domain/models/ui/video-card.models.dart';
import '../../locator.dart';
import '../../mocks/DataGenerator.dart';
import '../../utils/constants/app-colors.dart';
import '../../utils/constants/general.dart';
import '../../utils/constants/strings.dart';
import '../../utils/store/app-store.dart';
import '../widgets/AppWidget.dart';

class VideosView extends HookWidget {
  final bool isDirect;
  VideosView({Key? key, this.isDirect = false}) : super(key: key);
  final appStore = locator<AppStore>();
  Widget videoList(BuildContext context, List<VideoCardModel> videos) {
    var width = context.width();

    return ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: videos.length,
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(bottom: 16),
            child: GestureDetector(
              onTap: () {
                appRouter.push(VideoDetailViewRoute(video: videos[index]));
              },
              child: Row(
                children: <Widget>[
                  Container(
                    height: width * 0.32,
                    width: width * 0.32,
                    child: Stack(
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: new BorderRadius.circular(12.0),
                          child: CachedNetworkImage(
                            placeholder: placeholderWidgetFn() as Widget
                                Function(BuildContext, String)?,
                            imageUrl: videos[index].image,
                            fit: BoxFit.fill,
                            height: width * 0.32,
                            width: width * 0.32,
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Container(
                            margin:
                                const EdgeInsets.only(right: 10, bottom: 10),
                            child: Icon(
                              Icons.play_circle_fill,
                              color: context.scaffoldBackgroundColor,
                              size: 40,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        text(videos[index].name,
                            textColor: appStore.textPrimaryColor),
                        text(videos[index].targetMuscles,
                            maxLine: 1,
                            textColor: appStore.textSecondaryColor,
                            fontSize: textSizeSMedium),
                        const SizedBox(height: 2),
                        // Row(
                        //   children: <Widget>[
                        //     // RatingBar(
                        //     //   initialRating: 5,
                        //     //   minRating: 1,
                        //     //   itemSize: 16,
                        //     //   direction: Axis.horizontal,
                        //     //   itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                        //     //   itemBuilder: (context, _) => Icon(
                        //     //     Icons.star,
                        //     //     color: t7colorPrimary,
                        //     //   ),
                        //     //   onRatingUpdate: (rating) {},
                        //     // ),
                        //     // text(videos[index].hotel_review,
                        //     //     textColor: t7textColorSecondary,
                        //     //     fontSize: textSizeSMedium),
                        //   ],
                        // ),
                        text(videos[index].method,
                            textColor: textSecondaryColor,
                            fontSize: textSizeSMedium),
                        text(
                            "${videos[index].equipments} | ${videos[index].trainingCategory}",
                            maxLine: 1,
                            isLongText: true,
                            textColor: textSecondaryColor,
                            fontSize: textSizeSMedium),
                        const SizedBox(height: 8),
                        const Divider(
                            height: 0.5, color: viewLineColor, thickness: 1)
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    var width = context.width();

    final ValueNotifier<List<VideoCardModel>> recentVideos =
        useState(getRecentVideos());
    final ValueNotifier<List<VideoCardModel>> videos = useState(getPending());
    return Scaffold(
      body: Container(
        alignment: Alignment.topLeft,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TopBar(titleName: title_videos, isDirect: isDirect),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
              child: TextFormField(
                style: const TextStyle(
                    fontSize: textSizeLargeMedium, fontFamily: fontRegular),
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search, color: appStore.iconColor),
                  contentPadding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
                  hintText: lbl_search,
                  hintStyle: TextStyle(color: appStore.textPrimaryColor),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: const BorderSide(
                        color: appTextColorSecondary, width: 0.7),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: const BorderSide(
                        color: appTextColorSecondary, width: 0.7),
                  ),
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Container(
                  margin: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      text(title_recently_viewed,
                          textColor: appStore.textPrimaryColor,
                          fontSize: textSizeNormal,
                          fontFamily: fontBold),
                      Container(child: videoList(context, recentVideos.value)),
                      const SizedBox(height: 26),
                      text(title_video_list,
                          textColor: appStore.textPrimaryColor,
                          fontSize: textSizeNormal,
                          fontFamily: fontBold),
                      Container(child: videoList(context, videos.value)),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
