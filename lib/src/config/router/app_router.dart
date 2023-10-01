import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:my_gym_coach/src/domain/models/article.dart';
import 'package:my_gym_coach/src/domain/models/ui/video-card.models.dart';
import 'package:my_gym_coach/src/presentation/views/article_details_view.dart';
import 'package:my_gym_coach/src/presentation/views/breaking_news_view.dart';
import 'package:my_gym_coach/src/presentation/views/dashboard_view.dart';
import 'package:my_gym_coach/src/presentation/views/home_view.dart';
import 'package:my_gym_coach/src/presentation/views/my_training_view.dart';
import 'package:my_gym_coach/src/presentation/views/profile.dart';
import 'package:my_gym_coach/src/presentation/views/saved_articles_view.dart';
import 'package:my_gym_coach/src/presentation/views/sign_in_view.dart';
import 'package:my_gym_coach/src/presentation/views/sign_up_view.dart';
import 'package:my_gym_coach/src/presentation/views/training_detail_view.dart';
import 'package:my_gym_coach/src/presentation/views/video_detail_view.dart';
import 'package:my_gym_coach/src/presentation/views/videos_view.dart';
import 'package:my_gym_coach/src/presentation/views/walkthrough_view.dart';

part 'app_router.gr.dart';

@AdaptiveAutoRouter(
  routes: [
    AutoRoute(page: BreakingNewsView),
    AutoRoute(page: ArticleDetailsView),
    AutoRoute(page: SavedArticlesView),
    AutoRoute(path: '', page: WalkthroughView),
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
    AutoRoute(page: VideoDetailView),
    AutoRoute(page: MyTrainingView),
    AutoRoute(page: TrainingDetailView)
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
