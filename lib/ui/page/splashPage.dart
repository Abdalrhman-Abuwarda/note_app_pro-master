import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../core/data/local/sharedController.dart';
import '../../resources/assets.dart';
import '../../resources/values.dart';
import '../../routing/navigations.dart';
import '../../routing/router.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 3), (){
      SharedPrefController().isLoggedIn() ? ServiceNavigations.serviceNavi.pushNamedReplacement(RouteGenerator.homePage) : ServiceNavigations.serviceNavi.pushNamedReplacement(RouteGenerator.loginPage);
      // SharedPrefController().getUser().token != null ? ServiceNavigations.serviceNavi.pushNamedWidget(RouteGenerator.homePage) : ServiceNavigations.serviceNavi.pushNamedWidget(RouteGenerator.loginPage);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Text("This is User ${SharedPrefController().getUser().email??"iiiii"}"),
            Image.asset(
              ImageAssets.splashLogo,
              height: 172.h,
              width: 172.w,
            ),
            SizedBox(
              height: AppSize.s32.h,
            ),
          ],
        ),
      ),
    );
  }
}
