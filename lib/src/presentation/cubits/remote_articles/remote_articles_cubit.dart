import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import 'package:my_gym_coach/src/domain/models/article.dart';
import 'package:my_gym_coach/src/domain/models/requests/breaking_news.request.dart';
import 'package:my_gym_coach/src/domain/repositories/api_repository.dart';
import 'package:my_gym_coach/src/utils/constants/nums.dart';
import 'package:my_gym_coach/src/utils/resources/data_state.dart';
import '../base/base_cubit.dart';

part 'remote_articles_state.dart';

class RemoteArticlesCubit
    extends BaseCubit<RemoteArticlesState, List<Article>> {
  final ApiRepository _apiRepository;

  RemoteArticlesCubit(this._apiRepository)
      : super(const RemoteArticlesLoading(), []);

  int _page = 1;

  Future<void> getBreakingNewsArticles() async {
    if (isBusy) return;

    await run(() async {
      final response = await _apiRepository.getBreakingNewsArticles(
        request: BreakingNewsRequest(page: _page),
      );

      if (response is DataSuccess) {
        final articles = response.data!.articles;
        final noMoreData = articles.length < defaultPageSize;

        data.addAll(articles);
        _page++;

        emit(RemoteArticlesSuccess(articles: data, noMoreData: noMoreData));
      } else if (response is DataFailed) {
        emit(RemoteArticlesFailed(error: response.error));
      }
    });
  }
}
