import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_couples_tracker/core/cache/cache_helper.dart';
import 'package:movies_couples_tracker/core/widgets/view_models/theme_cubit.dart';
import 'package:movies_couples_tracker/features/splash/presentation/views/splash_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper().init(); // ✅ Important

  runApp( BlocProvider(
  create: (context) => ThemeCubit(),
  child: MyApp(),
));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeData>(
      builder: (context, theme) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: theme,
          locale: const Locale('en'),
          supportedLocales: const [
            Locale('en'),
            Locale('ar'),
          ],
          localizationsDelegates: [
          ],
          home: const SplashView(),
        );
      },
    );
  }
}


