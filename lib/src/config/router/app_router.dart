import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/src/presentation/views/walkthrough_view.dart';

import '../../domain/models/article.dart';
import '../../presentation/views/article_details_view.dart';
import '../../presentation/views/breaking_news_view.dart';
import '../../presentation/views/saved_articles_view.dart';

part 'app_router.gr.dart';

@AdaptiveAutoRouter(
  routes: [
    AutoRoute(page: BreakingNewsView),
    AutoRoute(page: ArticleDetailsView),
    AutoRoute(page: SavedArticlesView),
    AutoRoute(page: WalkthroughView, initial: true),
  ],
)
class AppRouter extends _$AppRouter {}

final appRouter = AppRouter();
