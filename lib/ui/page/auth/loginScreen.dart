import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:note_app_pro/core/provider/noteProvider.dart';
import 'package:provider/provider.dart';
import '../../../core/provider/authProvider.dart';
import '../../../resources/assets.dart';
import '../../../resources/values.dart';
import '../../../routing/navigations.dart';
import '../../../routing/router.dart';
import '../../../utils/helper.dart';
import '../../../utils/validate.dart';
import '../../shared/widget/footerPage.dart';
import '../../shared/widget/headerPage.dart';
import '../../shared/widget/mainButton.dart';
import '../../shared/widget/mainTextField.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isCheck = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var formKye = GlobalKey<FormState>();
  bool isPassword = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key: Helepers.scaffoldKey,
      resizeToAvoidBottomInset: false,
      //appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 50.h, right: 20.w, left: 20.w),
          child: Form(
            key: formKye,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                addVerticalSpace(80.h),
                Center(
                  child: Column(
                    children: [
                      const HeaderPage(text: "Welcome ", gradientText: "Back",),
                      Image.asset(
                        ImageAssets.splashLogo,
                        height: 172.h,
                        width: 172.w,)
                    ],
                  ),
                ),
                addVerticalSpace(20.h),
                MainTextField(
                  controller: emailController,
                  hintText: "example@gmail.com",
                  icon: Icons.email,
                  inbutType: TextInputType.name,
                  validator: (value) => Validate.validateEmail(value),
                ),
                addVerticalSpace(20.h),
                MainTextField(
                  hintText: "Password",
                  controller: passwordController,
                  icon: Icons.lock,
                  inbutType: TextInputType.visiblePassword,
                  suffixIcon: isPassword
                      ? Icons.visibility
                      : Icons.visibility_off,
                  isPassword: isPassword,
                  validator: (value) => Validate.validatePassword(value),
                  suffixPressed: () {
                    setState(() {
                      isPassword = !isPassword;
                    });
                  },
                ),
                addVerticalSpace(5.h),
                Row(
                  children: [
                    addHorizantelSpace(200),
                    TextButton(
                      onPressed: () {
                        ServiceNavigations.serviceNavi.pushNamedWidget(RouteGenerator.forgetPassword);
                      },
                      child: const Text(
                        "Forget Password?",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                addVerticalSpace(80.h),
                Consumer<AuthProvider>(
                    builder: (context, auth, child) {
                      return MainButton(
                        label: "LOGIN",
                        color: Colors.blue,
                        textColor: Colors.white,
                        function: () async {
                          if (formKye.currentState!.validate()) {
                            // Provider.of<NoteProvider>(context,listen: false).ResponseRead();
                            auth.login( emailController.text, passwordController.text);
                          }
                        },
                      );
                    }
                ),
                const Spacer(),
                FooterPage(text: "Have an account? ",
                    textButtom: "Sign Up",
                    onPressed: () {
                      ServiceNavigations.serviceNavi.pushNamedWidget(RouteGenerator.signupPage);
                    })
              ],
            ),
          ),
        ),
      ),

    );
  }
}
