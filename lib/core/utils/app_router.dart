import 'package:bookly_app/Feautures/Search/data/repos/search_repo_impl.dart';
import 'package:bookly_app/Feautures/Search/presentation/manager/search_books_cubit/search_books_cubit.dart';
import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:bookly_app/Feautures/Home/data/repos/home_repo_impl.dart';
import 'package:bookly_app/Feautures/Home/presentation/manager/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly_app/Feautures/Home/presentation/views/book_details_view.dart';
import 'package:bookly_app/Feautures/Home/presentation/views/home_view.dart';
import 'package:bookly_app/Feautures/Search/presentation/view/search_view.dart';
import 'package:bookly_app/Feautures/Splash/presentation/views/splash_view.dart';
import 'package:bookly_app/core/utils/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: kBookDetailsView,
        builder: (context, state) => BlocProvider(
          create: (context) => SimilarBooksCubit(
            getIt.get<HomeRepoImpl>(),
          ),
          child: BookDetailsView(
            bookModel: state.extra as BookModel,
          ),
        ),
      ),
      GoRoute(
        path: kSearchView,
        builder: (context, state) => BlocProvider(
          create: (context) => SearchBooksCubit(
            getIt.get<SearchRepoImpl>(),
          ),
          child: const SearchView(),
        ),
      ),
    ],
  );
}
