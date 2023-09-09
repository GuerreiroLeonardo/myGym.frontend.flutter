import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

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

  Widget contactList(List<VideoCardModel> mContactList) {
    return ListView.builder(
        itemCount: mContactList.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Column(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(top: 12, bottom: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    CircleAvatar(
                      backgroundImage:
                          CachedNetworkImageProvider(mContactList[index].img),
                      radius: 28,
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          text(mContactList[index].name,
                              textColor: locator<AppStore>().textPrimaryColor,
                              fontSize: textSizeMedium,
                              fontFamily: fontMedium),
                          text(mContactList[index].subject,
                              fontSize: textSizeMedium)
                        ],
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                      ),
                    )
                  ],
                ),
              ),
              const Divider(height: 0.5, color: appTextColorSecondary)
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<List<VideoCardModel>> mRecentContact =
        useState(getRecents());
    final ValueNotifier<List<VideoCardModel>> mOtherContact =
        useState(getRecents());
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
              padding: const EdgeInsets.all(16),
              child: TextFormField(
                style: const TextStyle(
                    fontSize: textSizeLargeMedium, fontFamily: fontRegular),
                decoration: InputDecoration(
                  prefixIcon:
                      Icon(Icons.search, color: locator<AppStore>().iconColor),
                  contentPadding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
                  hintText: lbl_search,
                  hintStyle:
                      TextStyle(color: locator<AppStore>().textPrimaryColor),
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
                          textColor: locator<AppStore>().textPrimaryColor,
                          fontSize: textSizeNormal,
                          fontFamily: fontBold),
                      Container(child: contactList(mRecentContact.value)),
                      const SizedBox(height: 26),
                      text(title_video_list,
                          textColor: locator<AppStore>().textPrimaryColor,
                          fontSize: textSizeNormal,
                          fontFamily: fontBold),
                      Container(child: contactList(mOtherContact.value)),
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
