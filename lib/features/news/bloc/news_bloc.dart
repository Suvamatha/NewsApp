import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/article.dart';           // 👈 added!
import '../repository/news_repository.dart';
import 'news_event.dart';
import 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final NewsRepository _repository;

  NewsBloc(this._repository) : super(NewsInitial()) {
    on<FetchNewsEvent>(_onFetchNews);
    on<SearchNewsEvent>(_onSearchNews);
  }

  Future<void> _onFetchNews(
    FetchNewsEvent event,
    Emitter<NewsState> emit,
  ) async {
    emit(NewsLoading());
    try {
      final articles = await _repository.getTopHeadlines(
        category: event.category,
      );
      emit(NewsLoaded(articles: articles, category: event.category));
    } catch (e) {
      emit(NewsError(e.toString()));
    }
  }

  Future<void> _onSearchNews(
    SearchNewsEvent event,
    Emitter<NewsState> emit,
  ) async {
    emit(NewsLoading());
    try {
      final articles = await _repository.getTopHeadlines();
      final List<Article> filtered = articles  // 👈 typed!
          .where((a) => a.title
              .toLowerCase()
              .contains(event.query.toLowerCase()))
          .toList();
      emit(NewsLoaded(articles: filtered, category: 'search'));
    } catch (e) {
      emit(NewsError(e.toString()));
    }
  }
}