import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_gym_coach/firebase_options.dart';
import 'package:my_gym_coach/src/domain/repositories/user_repository.dart';
import 'package:my_gym_coach/src/presentation/cubits/firebase_authentication/firebase_authentication_cubit.dart';
import 'package:my_gym_coach/src/presentation/views/walkthrough_view.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:oktoast/oktoast.dart';

import 'src/config/router/app_router.dart';
import 'src/config/themes/app_theme.dart';
import 'src/domain/repositories/api_repository.dart';
import 'src/domain/repositories/database_repository.dart';
import 'src/locator.dart';
import 'src/presentation/cubits/local_articles/local_articles_cubit.dart';
import 'src/presentation/cubits/remote_articles/remote_articles_cubit.dart';
import 'src/utils/constants/strings.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialize();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await initializeDependencies();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          lazy: false,
          create: (context) => FirebaseAuthenticationCubit(
            locator<UserRepository>(),
          )..checkAuthenticationStatus(),
        ),
        BlocProvider(
          create: (context) => LocalArticlesCubit(
            locator<DatabaseRepository>(),
          )..getAllSavedArticles(),
        ),
        BlocProvider(
          create: (context) => RemoteArticlesCubit(
            locator<ApiRepository>(),
          )..getBreakingNewsArticles(),
        ),
      ],
      child: OKToast(
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerDelegate: appRouter.delegate(),
          routeInformationParser: appRouter.defaultRouteParser(),
          title: appTitle,
          theme: AppThemeData.lightTheme,
        ),
      ),
    );
  }
}
