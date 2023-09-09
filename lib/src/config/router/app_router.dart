import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:my_gym_coach/src/presentation/views/sign_in_view.dart';
import 'package:my_gym_coach/src/presentation/views/sign_up_view.dart';
import 'package:my_gym_coach/src/presentation/views/walkthrough_view.dart';

import '../../domain/models/article.dart';
import '../../presentation/views/article_details_view.dart';
import '../../presentation/views/breaking_news_view.dart';
import '../../presentation/views/dashboard_view.dart';
import '../../presentation/views/home_view.dart';
import '../../presentation/views/profile.dart';
import '../../presentation/views/saved_articles_view.dart';
import '../../presentation/views/videos_view.dart';

part 'app_router.gr.dart';

@AdaptiveAutoRouter(
  routes: [
    AutoRoute(page: BreakingNewsView),
    AutoRoute(page: ArticleDetailsView),
    AutoRoute(page: SavedArticlesView),
    AutoRoute(page: WalkthroughView, initial: true),
    AutoRoute(page: SignInView),
    AutoRoute(page: SignUpView),
    AutoRoute(
      page: DashboardView,
      path: '/dashboard',
      children: [
        AutoRoute(path: 'home', page: HomeView),
        AutoRoute(path: 'profile', page: ProfileView),
        AutoRoute(path: 'videos', page: VideosView),
      ],
    ),
    // AutoRoute(
    //   page: HomeView,
    //   children: [
    //     AutoRoute(page: ProfileView),
    //     AutoRoute(page: VideosView),
    //   ],
    // ),
  ],
)
class AppRouter extends _$AppRouter {}

final appRouter = AppRouter();
