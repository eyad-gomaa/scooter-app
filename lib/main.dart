import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:scooter_app/core/utils/bloc_observer.dart';
import 'package:scooter_app/features/home/presentation/manager/fetch_data_cubit/fetch_data_cubit.dart';
import 'package:scooter_app/features/home/presentation/manager/theme_cubit/theme_cubit.dart';
import 'package:scooter_app/features/trusted_places/presentation/manager/trusted_places_cubit/trusted_places_cubit.dart';
import 'core/shared/constants.dart';
import 'core/theme/dark_theme.dart';
import 'core/theme/light_theme.dart';
import 'core/utils/app_router.dart';
import 'core/utils/service_locator.dart';
import 'features/add_data/data/data_model/data_model.dart';
import 'features/home/data/repo/home_repo.dart';
import 'features/home/presentation/manager/theme_cubit/theme_state.dart';
import 'features/trusted_places/data/repo/trustes_places_repo.dart';
import 'firebase_options.dart';

void main() async {
  // Firebase Impl
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // Hive Impl
  await Hive.initFlutter();
  Hive.registerAdapter(DataAdapter());
  await Hive.openBox<Data>(dataBox);
  //Bloc observer Impl
  Bloc.observer = AppBlocObserver();

  setupServiceLocator();
    runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (context) => ThemeCubit(),),
      BlocProvider(create: (context) => FetchDataCubit(getIt<HomeRepo>())..fetchData(),),
      BlocProvider(create: (context) => TrustedPlacesCubit(getIt<TrustedPlacesRepo>())),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, AppThemeState>(
      builder: (context, state) {
        return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            theme: lightTheme(),
            darkTheme: darkTheme(),
            themeMode: BlocProvider.of<ThemeCubit>(context).switchValue
                ? ThemeMode.dark
                : ThemeMode.light,
            routerConfig: router);
      },
    );
  }
}
