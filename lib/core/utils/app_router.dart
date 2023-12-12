import 'package:bookly_app/core/utils/service_locator.dart';
import 'package:bookly_app/features/Home/data/repos/home_repo_impl.dart';
import 'package:bookly_app/features/Home/presentation/cubits/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly_app/features/Home/presentation/cubits/newest_books_cubit/newest_books_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/Home/presentation/views/book_details_view.dart';
import '../../features/Home/presentation/views/home_view.dart';
import '../../features/Search/presentation/views/search_view.dart';
import '../../features/Splash/presentation/views/splash_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView';
  static const kBookDetailsView = '/bookDetailsView';
  static const kSearchView = '/searchView';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => MultiBlocProvider(providers: [
          BlocProvider(
            create: (context) => FeaturedBooksCubit(
              getIt.get<HomeRepoImpl>()
            )..fetchFeaturedBooks(),
          ),
          BlocProvider(
            create: (context) => NewestBooksCubit(
              getIt.get<HomeRepoImpl>(),
            )..fetchNewestBooks(),
          ),
        ], child: const HomeView()),
      ),
      GoRoute(
        path: kBookDetailsView,
        builder: (context, state) => const BookDetailsView(),
      ),
      GoRoute(
        path: kSearchView,
        builder: (context, state) => const SearchView(),
      ),
    ],
  );
}
