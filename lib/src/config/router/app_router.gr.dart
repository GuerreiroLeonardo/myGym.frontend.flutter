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
          path: '/',
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
          path: '/',
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
