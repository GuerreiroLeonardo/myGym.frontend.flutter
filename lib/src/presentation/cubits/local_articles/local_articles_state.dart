part of 'local_articles_cubit.dart';

// SEMELHANTE AO ChangeNotifier NO PROVIDER
abstract class LocalArticlesState extends Equatable {
  final List<Article> articles;

  const LocalArticlesState({
    this.articles = const [],
  });

  @override
  List<Object> get props => [articles];
}

class LocalArticlesLoading extends LocalArticlesState {
  const LocalArticlesLoading();
}

class LocalArticlesSuccess extends LocalArticlesState {
  const LocalArticlesSuccess({super.articles});
}
