import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:scooter_app/features/add_data/data/data_model/data_model.dart';

import '../../features/add_data/presentation/view/add_data_view.dart';
import '../../features/best_products/presentation/view/best_products_view.dart';
import '../../features/edit_data/view/edit_data_view.dart';
import '../../features/help_yourself/presentation/view/help_yourself_view.dart';
import '../../features/home/presentation/view/home_view.dart';
import '../../features/onboarding/presentation/view/onboarding_view.dart';
import '../../features/splash/presentation/view/splash_view.dart';
import '../../features/trusted_places/presentation/view/trusted_places_view.dart';
class RouterPath{
  static const splashView = "/";
  static const onboardingView = "/onboardingView";
  static const homeView = "/homeView";
  static const addDataView = "/addDataView";
  static const editDataView = "/editDataView";
  static const trustedPlacesView = "/trustedPlacesView";
  static const bestProductsView = "/bestProductsView";
  static const helpYourselfView = "/helpYourselfView";
}
final GoRouter router = GoRouter(
    routes: [
    //************* SplashScreen *************
    GoRoute(
    path: RouterPath.splashView,
    builder: (BuildContext context, GoRouterState state) =>
    const SplashView()),
      GoRoute(
    path: RouterPath.homeView,
    builder: (BuildContext context, GoRouterState state) =>
    const HomeView()),
      GoRoute(
    path: RouterPath.onboardingView,
    builder: (BuildContext context, GoRouterState state) =>
    const OnBoardingView()),
      GoRoute(
    path: RouterPath.addDataView,
    builder: (BuildContext context, GoRouterState state) =>
    const AddDataView()),
      GoRoute(
    path: RouterPath.editDataView,
    builder: (BuildContext context, GoRouterState state) => EditDataView(dataModel: state.extra as Data),
      ),
      GoRoute(
    path: RouterPath.trustedPlacesView,
    builder: (BuildContext context, GoRouterState state) => const TrustedPlacesView(),
      ),
      GoRoute(
    path: RouterPath.bestProductsView,
    builder: (BuildContext context, GoRouterState state) => const BestProductsView(),
      ),
      GoRoute(
    path: RouterPath.helpYourselfView,
    builder: (BuildContext context, GoRouterState state) => const HelpYourselfView(),
      ),
    ]
);