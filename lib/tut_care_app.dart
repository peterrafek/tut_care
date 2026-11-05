import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/app_theme.dart';
import 'core/global_cubit/global_cubit.dart';
import 'core/global_cubit/global_state.dart';
import 'core/router/app_routes.dart';

class TutCareApp extends StatelessWidget {
  const TutCareApp({super.key});

  @override
  Widget build(BuildContext context) {
    final globalCubit = BlocProvider.of<GlobalCubit>(context);
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => BlocBuilder<GlobalCubit, GlobalState>(
        buildWhen: (previous, current) =>
            current is LoadedRedirectedScreen ||
            current is ChangeLanguageIndexState,
        builder: (context, state) => globalCubit.redirectedScreen != null
            ? MaterialApp(
                title: 'Tut Care',
                debugShowCheckedModeBanner: false,
                theme: AppTheme.darkTheme,
                themeMode: ThemeMode.light,
                onGenerateRoute: AppRoutes.onGenerateRoute,
                initialRoute: globalCubit.redirectedScreen,
                localizationsDelegates: context.localizationDelegates,
                supportedLocales: context.supportedLocales,
                locale: context.locale,
              )
            : const SizedBox.shrink(),
      ),
    );
  }
}
