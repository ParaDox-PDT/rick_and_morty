import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rick_and_morty/src/data/source/local_source.dart';
import 'package:rick_and_morty/src/injector_container_part.dart';
import 'package:rick_and_morty/src/presentation/bloc/main_bloc/main_bloc.dart';
import 'package:rick_and_morty/src/presentation/bloc/splash_bloc/splash_bloc.dart';
import 'package:rick_and_morty/src/presentation/pages/main/main_page_part.dart';
import 'package:rick_and_morty/src/presentation/pages/splash/splash_page_part.dart';


part 'name_routes.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();

final localSource = sl<LocalSource>();

final GoRouter router = GoRouter(
  navigatorKey: rootNavigatorKey,
  initialLocation: Routes.initial,
  routes: <RouteBase>[
    GoRoute(
      path: Routes.initial,
      name: Routes.initial,
      builder: (_, __) => BlocProvider(
        create: (_) => sl<SplashBloc>(),
        child: const SplashPage(),
      ),
    ),

    ///home
    GoRoute(
      name: Routes.home,
      path: Routes.home,
      pageBuilder: (_, state) => CustomTransitionPage(
        transitionDuration: const Duration(milliseconds: 1200),
        child: MultiBlocProvider(
          providers: [
            BlocProvider<MainBloc>(create: (_) => sl<MainBloc>()),
          ],
          child: const MainPage(),
        ),
        transitionsBuilder: (_, animation, __, child) => FadeTransition(
          opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
          child: child,
        ),
      ),
    ),

  ],
);

class FadePageRoute<T> extends PageRouteBuilder<T> {
  FadePageRoute({required this.builder})
      : super(
          pageBuilder: (
            context,
            animation,
            secondaryAnimation,
          ) =>
              builder(context),
          transitionsBuilder: (
            context,
            animation,
            secondaryAnimation,
            child,
          ) =>
              FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
  final WidgetBuilder builder;

  @override
  bool get maintainState => true;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 1000);
}
