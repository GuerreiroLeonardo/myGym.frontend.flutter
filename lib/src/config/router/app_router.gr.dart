// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    BreakingNewsViewRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: const BreakingNewsView(),
      );
    },
    ArticleDetailsViewRoute.name: (routeData) {
      final args = routeData.argsAs<ArticleDetailsViewRouteArgs>();
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: ArticleDetailsView(
          key: args.key,
          article: args.article,
        ),
      );
    },
    SavedArticlesViewRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: const SavedArticlesView(),
      );
    },
    WalkthroughViewRoute.name: (routeData) {
      final args = routeData.argsAs<WalkthroughViewRouteArgs>(
          orElse: () => const WalkthroughViewRouteArgs());
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: WalkthroughView(key: args.key),
      );
    },
    SignInViewRoute.name: (routeData) {
      final args = routeData.argsAs<SignInViewRouteArgs>(
          orElse: () => const SignInViewRouteArgs());
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: SignInView(key: args.key),
      );
    },
    SignUpViewRoute.name: (routeData) {
      final args = routeData.argsAs<SignUpViewRouteArgs>(
          orElse: () => const SignUpViewRouteArgs());
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: SignUpView(key: args.key),
      );
    },
    DashboardViewRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: DashboardView(),
      );
    },
    VideoDetailViewRoute.name: (routeData) {
      final args = routeData.argsAs<VideoDetailViewRouteArgs>();
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: VideoDetailView(
          key: args.key,
          video: args.video,
        ),
      );
    },
    MyTrainingViewRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: const MyTrainingView(),
      );
    },
    TrainingDetailViewRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: const TrainingDetailView(),
      );
    },
    HomeViewRoute.name: (routeData) {
      final args = routeData.argsAs<HomeViewRouteArgs>(
          orElse: () => const HomeViewRouteArgs());
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: HomeView(key: args.key),
      );
    },
    ProfileViewRoute.name: (routeData) {
      final args = routeData.argsAs<ProfileViewRouteArgs>(
          orElse: () => const ProfileViewRouteArgs());
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: ProfileView(key: args.key),
      );
    },
    VideosViewRoute.name: (routeData) {
      final args = routeData.argsAs<VideosViewRouteArgs>(
          orElse: () => const VideosViewRouteArgs());
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: VideosView(
          key: args.key,
          isDirect: args.isDirect,
        ),
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          BreakingNewsViewRoute.name,
          path: '/breaking-news-view',
        ),
        RouteConfig(
          ArticleDetailsViewRoute.name,
          path: '/article-details-view',
        ),
        RouteConfig(
          SavedArticlesViewRoute.name,
          path: '/saved-articles-view',
        ),
        RouteConfig(
          WalkthroughViewRoute.name,
          path: '',
        ),
        RouteConfig(
          SignInViewRoute.name,
          path: '/sign-in-view',
        ),
        RouteConfig(
          SignUpViewRoute.name,
          path: '/sign-up-view',
        ),
        RouteConfig(
          DashboardViewRoute.name,
          path: '/dashboard',
          children: [
            RouteConfig(
              HomeViewRoute.name,
              path: 'home',
              parent: DashboardViewRoute.name,
            ),
            RouteConfig(
              ProfileViewRoute.name,
              path: 'profile',
              parent: DashboardViewRoute.name,
            ),
            RouteConfig(
              VideosViewRoute.name,
              path: 'videos',
              parent: DashboardViewRoute.name,
            ),
          ],
        ),
        RouteConfig(
          VideoDetailViewRoute.name,
          path: '/video-detail-view',
        ),
        RouteConfig(
          MyTrainingViewRoute.name,
          path: '/my-training-view',
        ),
        RouteConfig(
          TrainingDetailViewRoute.name,
          path: '/training-detail-view',
        ),
      ];
}

/// generated route for
/// [BreakingNewsView]
class BreakingNewsViewRoute extends PageRouteInfo<void> {
  const BreakingNewsViewRoute()
      : super(
          BreakingNewsViewRoute.name,
          path: '/breaking-news-view',
        );

  static const String name = 'BreakingNewsViewRoute';
}

/// generated route for
/// [ArticleDetailsView]
class ArticleDetailsViewRoute
    extends PageRouteInfo<ArticleDetailsViewRouteArgs> {
  ArticleDetailsViewRoute({
    Key? key,
    required Article article,
  }) : super(
          ArticleDetailsViewRoute.name,
          path: '/article-details-view',
          args: ArticleDetailsViewRouteArgs(
            key: key,
            article: article,
          ),
        );

  static const String name = 'ArticleDetailsViewRoute';
}

class ArticleDetailsViewRouteArgs {
  const ArticleDetailsViewRouteArgs({
    this.key,
    required this.article,
  });

  final Key? key;

  final Article article;

  @override
  String toString() {
    return 'ArticleDetailsViewRouteArgs{key: $key, article: $article}';
  }
}

/// generated route for
/// [SavedArticlesView]
class SavedArticlesViewRoute extends PageRouteInfo<void> {
  const SavedArticlesViewRoute()
      : super(
          SavedArticlesViewRoute.name,
          path: '/saved-articles-view',
        );

  static const String name = 'SavedArticlesViewRoute';
}

/// generated route for
/// [WalkthroughView]
class WalkthroughViewRoute extends PageRouteInfo<WalkthroughViewRouteArgs> {
  WalkthroughViewRoute({Key? key})
      : super(
          WalkthroughViewRoute.name,
          path: '',
          args: WalkthroughViewRouteArgs(key: key),
        );

  static const String name = 'WalkthroughViewRoute';
}

class WalkthroughViewRouteArgs {
  const WalkthroughViewRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'WalkthroughViewRouteArgs{key: $key}';
  }
}

/// generated route for
/// [SignInView]
class SignInViewRoute extends PageRouteInfo<SignInViewRouteArgs> {
  SignInViewRoute({Key? key})
      : super(
          SignInViewRoute.name,
          path: '/sign-in-view',
          args: SignInViewRouteArgs(key: key),
        );

  static const String name = 'SignInViewRoute';
}

class SignInViewRouteArgs {
  const SignInViewRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'SignInViewRouteArgs{key: $key}';
  }
}

/// generated route for
/// [SignUpView]
class SignUpViewRoute extends PageRouteInfo<SignUpViewRouteArgs> {
  SignUpViewRoute({Key? key})
      : super(
          SignUpViewRoute.name,
          path: '/sign-up-view',
          args: SignUpViewRouteArgs(key: key),
        );

  static const String name = 'SignUpViewRoute';
}

class SignUpViewRouteArgs {
  const SignUpViewRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'SignUpViewRouteArgs{key: $key}';
  }
}

/// generated route for
/// [DashboardView]
class DashboardViewRoute extends PageRouteInfo<void> {
  const DashboardViewRoute({List<PageRouteInfo>? children})
      : super(
          DashboardViewRoute.name,
          path: '/dashboard',
          initialChildren: children,
        );

  static const String name = 'DashboardViewRoute';
}

/// generated route for
/// [VideoDetailView]
class VideoDetailViewRoute extends PageRouteInfo<VideoDetailViewRouteArgs> {
  VideoDetailViewRoute({
    Key? key,
    required VideoCardModel video,
  }) : super(
          VideoDetailViewRoute.name,
          path: '/video-detail-view',
          args: VideoDetailViewRouteArgs(
            key: key,
            video: video,
          ),
        );

  static const String name = 'VideoDetailViewRoute';
}

class VideoDetailViewRouteArgs {
  const VideoDetailViewRouteArgs({
    this.key,
    required this.video,
  });

  final Key? key;

  final VideoCardModel video;

  @override
  String toString() {
    return 'VideoDetailViewRouteArgs{key: $key, video: $video}';
  }
}

/// generated route for
/// [MyTrainingView]
class MyTrainingViewRoute extends PageRouteInfo<void> {
  const MyTrainingViewRoute()
      : super(
          MyTrainingViewRoute.name,
          path: '/my-training-view',
        );

  static const String name = 'MyTrainingViewRoute';
}

/// generated route for
/// [TrainingDetailView]
class TrainingDetailViewRoute extends PageRouteInfo<void> {
  const TrainingDetailViewRoute()
      : super(
          TrainingDetailViewRoute.name,
          path: '/training-detail-view',
        );

  static const String name = 'TrainingDetailViewRoute';
}

/// generated route for
/// [HomeView]
class HomeViewRoute extends PageRouteInfo<HomeViewRouteArgs> {
  HomeViewRoute({Key? key})
      : super(
          HomeViewRoute.name,
          path: 'home',
          args: HomeViewRouteArgs(key: key),
        );

  static const String name = 'HomeViewRoute';
}

class HomeViewRouteArgs {
  const HomeViewRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'HomeViewRouteArgs{key: $key}';
  }
}

/// generated route for
/// [ProfileView]
class ProfileViewRoute extends PageRouteInfo<ProfileViewRouteArgs> {
  ProfileViewRoute({Key? key})
      : super(
          ProfileViewRoute.name,
          path: 'profile',
          args: ProfileViewRouteArgs(key: key),
        );

  static const String name = 'ProfileViewRoute';
}

class ProfileViewRouteArgs {
  const ProfileViewRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'ProfileViewRouteArgs{key: $key}';
  }
}

/// generated route for
/// [VideosView]
class VideosViewRoute extends PageRouteInfo<VideosViewRouteArgs> {
  VideosViewRoute({
    Key? key,
    bool isDirect = false,
  }) : super(
          VideosViewRoute.name,
          path: 'videos',
          args: VideosViewRouteArgs(
            key: key,
            isDirect: isDirect,
          ),
        );

  static const String name = 'VideosViewRoute';
}

class VideosViewRouteArgs {
  const VideosViewRouteArgs({
    this.key,
    this.isDirect = false,
  });

  final Key? key;

  final bool isDirect;

  @override
  String toString() {
    return 'VideosViewRouteArgs{key: $key, isDirect: $isDirect}';
  }
}
