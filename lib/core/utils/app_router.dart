import 'package:book_app/features/home/presentation/views/home_view.dart';
import 'package:book_app/features/home/presentation/views/widgets/book_details_view_body.dart';
import 'package:go_router/go_router.dart';

import '../../features/splash/presentation/views/splash_view.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView';
    static const kDetailsScreen = '/detailsScreen';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: ((context, state) => const SplashView()),
      ),
      GoRoute(
        path: kHomeView,
        builder: ((context, state) => const HomeView()),
      ),
      GoRoute(
        path: kDetailsScreen,
        builder: ((context, state) => const BookDetailsViewBody()),
      ),
    ],
  );
}
