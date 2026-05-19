import 'package:go_router/go_router.dart';
import '../../features/news/models/article.dart';
import '../../features/news/screens/home_screen.dart';
import '../../features/news/screens/article_detail_screen.dart';

class AppRouter {
  AppRouter._();

  static final GoRouter router = GoRouter(
    initialLocation: '/home',
    routes: [
      GoRoute(
        path: '/home',
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: '/article',
        builder: (context, state) {
          final article = state.extra as Article;
          return ArticleDetailScreen(article: article);
        },
      ),
    ],
  );
}