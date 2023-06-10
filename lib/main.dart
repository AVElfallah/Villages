import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:villages/router/router.dart';
import 'package:villages/shared/constants/constant.dart';
import 'package:villages/shared/data/Client/user_auth.dart';

import 'themes/light_theme.dart';

void main() async {
  await GetStorage.init(authContainerTag);
  WidgetsFlutterBinding.ensureInitialized();
  UserAuth.i;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return MaterialApp(
          theme: lightThemeData(),
          title: 'Village',
          debugShowCheckedModeBanner: false,
          initialRoute: AppRouter.splashScreen,
          onGenerateRoute: AppRouter.onGenerateRoute,
          /*    home: MapWebViewWidget(
            lat: "30",
            long: '54',
          ), */
        );
      },
    );
  }
}
