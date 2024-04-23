import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp_project/cache/cache_helper.dart';
import 'package:gp_project/core/api/dio_consumer.dart';
import 'package:gp_project/cubit/image_cubit_cubit.dart';
import 'package:gp_project/cubit/logout_cubit.dart';
import 'package:gp_project/pages/account.dart';
import 'package:gp_project/pages/profile_page.dart';
import 'package:gp_project/providers/theme_provider.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  CacheHelper().init();
  runApp(const GProject());
}

class GProject extends StatelessWidget {
  static final ValueNotifier<ThemeMode> themeNotifier =
      ValueNotifier(ThemeMode.light);
  const GProject({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
        valueListenable: themeNotifier,
        builder: (_, ThemeMode currentMode, __) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => LogoutCubit(DioConsumer(dio: Dio())),
              ),
              BlocProvider(
                create: (context) => ImageCubitCubit(),
              ),
            ],
            child: ChangeNotifierProvider(
              create: (_) => ThemeProvider(),
              child:
                  Consumer<ThemeProvider>(builder: (context, themeProvider, _) {
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  //theme: ThemeData.light(),
                  //darkTheme: ThemeData.dark(),
                  //themeMode: currentMode,
                  theme: ThemeData.light(),
                  darkTheme: ThemeData.dark(),
                  themeMode: themeProvider.themeMode == ThemeModeType.dark
                      ? ThemeMode.dark
                      : ThemeMode.light,
                  home:  Account(),
                );
              }),
            ),
          );
        });
  }
}
