import 'package:equatable/equatable.dart';
import '../models/article.dart';

abstract class NewsState extends Equatable {
  const NewsState();

  @override
  List<Object> get props => [];
}

// initial state — nothing happened yet
class NewsInitial extends NewsState {}

// loading state — show spinner
class NewsLoading extends NewsState {}

// loaded state — show articles
class NewsLoaded extends NewsState {
  final List<Article> articles;
  final String category;

  const NewsLoaded({
    required this.articles,
    required this.category,
  });

  @override
  List<Object> get props => [articles, category];
}

// error state — show error message
class NewsError extends NewsState {
  final String message;

  const NewsError(this.message);

  @override
  List<Object> get props => [message];
}