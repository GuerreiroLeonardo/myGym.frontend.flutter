import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:my_gym_coach/src/domain/models/ui/video-card.models.dart';
import 'package:my_gym_coach/src/locator.dart';
import 'package:my_gym_coach/src/presentation/widgets/AppWidget.dart';
import 'package:my_gym_coach/src/utils/constants/general.dart';
import 'package:my_gym_coach/src/utils/constants/strings.dart';
import 'package:my_gym_coach/src/utils/hooks/video.dart';
import 'package:my_gym_coach/src/utils/store/app-store.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:video_player/video_player.dart';

// class DefaultPlayer extends StatefulWidget {
//   DefaultPlayer({Key? key}) : super(key: key);

//   @override
//   _DefaultPlayerState createState() => _DefaultPlayerState();
// }

class VideoDetailView extends HookWidget {
  final VideoCardModel video;

  VideoDetailView({Key? key, required VideoCardModel this.video})
      : super(key: key);
  // @override
  // void initState() {
  //   super.initState();
  //   flickManager = FlickManager(
  //     videoPlayerController: VideoPlayerController.network(
  //       mockData["items"][0]["trailer_url"],
  //       closedCaptionFile: _loadCaptions(),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    var width = context.width();

    final FlickManager flickManager = useFlickManager(
      videoPlayerController: VideoPlayerController.networkUrl(Uri.parse(
          "https://github.com/GeekyAnts/flick-video-player-demo-videos/blob/master/example/rio_from_above_compressed.mp4?raw=true")),
    );
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            TopBar(titleName: title_videos),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: Material(
                                elevation:
                                    4, // Adjust the elevation as needed for your shadow
                                child: Container(
                                  alignment: Alignment.center,
                                  width: width * 0.95,
                                  child: VisibilityDetector(
                                    key: ObjectKey(flickManager),
                                    onVisibilityChanged: (visibility) {
                                      if (visibility.visibleFraction == 0 &&
                                          context.mounted) {
                                        flickManager.flickControlManager
                                            ?.autoPause();
                                      } else if (visibility.visibleFraction ==
                                          1) {
                                        flickManager.flickControlManager
                                            ?.autoResume();
                                      }
                                    },
                                    child: FlickVideoPlayer(
                                      flickManager: flickManager,
                                      preferredDeviceOrientationFullscreen: [
                                        // DeviceOrientation.portraitUp,
                                        DeviceOrientation.landscapeLeft,
                                        DeviceOrientation.landscapeRight,
                                      ],
                                      flickVideoWithControls:
                                          const FlickVideoWithControls(
                                        videoFit: BoxFit.fitWidth,
                                        controls: FlickPortraitControls(),
                                      ),
                                      flickVideoWithControlsFullscreen:
                                          const FlickVideoWithControls(
                                        videoFit: BoxFit.fitWidth,
                                        controls: FlickLandscapeControls(),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 15),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: width * 0.05, right: width * 0.05),
                    alignment: Alignment.topLeft,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: text(
                              video.name,
                              textColor: textPrimaryColor,
                              fontSize: textSizeNormal,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          10.height,
                          text(video.description,
                              textColor: textSecondaryColor,
                              fontSize: textSizeMedium),
                          20.height,
                          Row(
                            children: [
                              text("${target_muscles}: ",
                                  textColor: textPrimaryColor,
                                  fontSize: textSizeMedium,
                                  fontWeight: FontWeight.w900),
                              text("${video.targetMuscles}",
                                  textColor: textSecondaryColor,
                                  fontSize: textSizeMedium),
                            ],
                          ),
                          5.height,
                          Row(
                            children: [
                              text("${method}: ",
                                  textColor: textPrimaryColor,
                                  fontSize: textSizeMedium,
                                  fontWeight: FontWeight.w900),
                              text("${video.method}",
                                  textColor: textSecondaryColor,
                                  fontSize: textSizeMedium),
                            ],
                          ),
                          5.height,
                          Row(
                            children: [
                              text("${equipment}: ",
                                  textColor: textPrimaryColor,
                                  fontSize: textSizeMedium,
                                  fontWeight: FontWeight.w900),
                              text("${video.equipments}",
                                  textColor: textSecondaryColor,
                                  fontSize: textSizeMedium),
                            ],
                          )
                        ]),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
