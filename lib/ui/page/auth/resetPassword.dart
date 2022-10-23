import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../core/provider/authProvider.dart';
import '../../../resources/values.dart';
import '../../../routing/navigations.dart';
import '../../../routing/router.dart';
import '../../../utils/validate.dart';
import '../../shared/widget/footerPage.dart';
import '../../shared/widget/headerPage.dart';
import '../../shared/widget/mainButton.dart';
import '../../shared/widget/mainTextField.dart';
class ResetPassword extends StatelessWidget {
   ResetPassword({Key? key}) : super(key: key);

  var formKye = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();

  TextEditingController codeController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController confermController = TextEditingController();

  @override

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                addVerticalSpace(60.h),
                Center(
                  child: Column(
                    children: const [
                      HeaderPage(text: "Reset ", gradientText: "Password",),
                    ],
                  ),
                ),
                addVerticalSpace(40.h),
                MainTextField(
                  controller: emailController,
                  hintText: "example@gmail.com",
                  icon: Icons.email,
                  inbutType: TextInputType.name,
                  validator: (value) => Validate.validateEmail(value),
                ),
                addVerticalSpace(20.h),
                MainTextField(
                  controller: codeController,
                  hintText: "123456",
                  icon: Icons.code,
                  inbutType: TextInputType.name,
                  validator: (value) => Validate.validateCode(value),
                ),
                addVerticalSpace(20.h),
                MainTextField(
                  controller: passwordController,
                  hintText: "Password",
                  icon: Icons.lock,
                  inbutType: TextInputType.name,
                  validator: (value) => Validate.validatePassword(value),
                ),
                addVerticalSpace(20.h),
                MainTextField(
                  controller: confermController,
                  hintText: "Conferm Password",
                  icon: Icons.lock,
                  inbutType: TextInputType.name,
                  validator: (value) => Validate.validatePassword(value),
                ),
                addVerticalSpace(100.h),
                Consumer<AuthProvider>(
                  builder: (context, auth, child){
                    return MainButton(
                      label: "Next",
                      color: Colors.blue,
                      textColor: Colors.white,
                      function: () async {
                        if (formKye.currentState!.validate()) {
                          auth.resetPassword(emailController.text, codeController.text, passwordController.text);
                        }
                      },
                    );
                  }
                ),

                const Spacer(),
                FooterPage(text: "Change your email? ",
                    textButtom: "Forget Password",
                    onPressed: () {
                      ServiceNavigations.serviceNavi.pushNamedWidget(RouteGenerator.forgetPassword);
                    })
              ],
            ),
          ),
        ),
      ),

    );
  }
}
