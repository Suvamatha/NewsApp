import 'package:equatable/equatable.dart';

// base class — all events extend this
abstract class NewsEvent extends Equatable {
  const NewsEvent();

  @override
  List<Object> get props => [];
}

// fetch news by category
class FetchNewsEvent extends NewsEvent {
  final String category;

  const FetchNewsEvent({this.category = 'general'});

  @override
  List<Object> get props => [category];
}

// search news
class SearchNewsEvent extends NewsEvent {
  final String query;

  const SearchNewsEvent(this.query);

  @override
  List<Object> get props => [query];
}