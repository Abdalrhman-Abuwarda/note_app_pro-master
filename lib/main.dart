import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note_app_pro/resources/theme.dart';
import 'package:note_app_pro/routing/navigations.dart';
import 'package:note_app_pro/routing/router.dart';
import 'package:note_app_pro/routing/routes.dart';
import 'package:note_app_pro/ui/page/auth/loginScreen.dart';
import 'package:note_app_pro/ui/page/home/homePage.dart';
import 'package:note_app_pro/ui/page/splashPage.dart';
import 'package:note_app_pro/utils/helper.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/data/local/sharedController.dart';
import 'core/provider/authProvider.dart';
import 'core/provider/noteProvider.dart';
import 'core/provider/themeProvider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  await SharedPrefController().initSharedPreferences();
  runApp(MyApp());
}


class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var currentTheme = AppThemes.light;
  // late SharedPreferences sharedPreferences;
  // late AppService appService;

  // @override
  // void initState() {
  //   appService = AppService(sharedPreferences);
  //   super.initState();
  // }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider(), child: MyApp()),
        ChangeNotifierProvider(create: (_) => NoteProvider(), child: MyApp()),
        ChangeNotifierProvider(create: (_) => ThemeProvider(), child: MyApp()),
      ],
      child: ScreenUtilInit(
          designSize: const Size(414, 896),
          builder: (context, child) => MaterialApp(
                scaffoldMessengerKey: Helpers.scaffoldKey,
                theme: customDarkTheme(),
                debugShowCheckedModeBanner: false,
                navigatorKey: ServiceNavigations.serviceNavi.navKey,
                home: const SplashPage(),
                // initialRoute: RouteGenerator.splashPage,
                onGenerateRoute: RoutsGnerate.generateRoute,

          )),
    );
  }
}
