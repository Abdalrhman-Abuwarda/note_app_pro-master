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
class ForgetPassword extends StatefulWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  var formKye = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();


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
                addVerticalSpace(80.h),
                Center(
                  child: Column(
                    children: const [
                      HeaderPage(text: "Forget ", gradientText: "Password",),
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
                // Row(
                //   children: [
                //     addHorizantelSpace(200),
                //     TextButton(
                //       onPressed: () {},
                //       child: const Text(
                //         "Forget Password?",
                //         style: TextStyle(
                //             fontSize: 15, fontWeight: FontWeight.bold),
                //       ),
                //     ),
                //   ],
                // ),
                addVerticalSpace(80.h),
                Consumer<AuthProvider>(
                  builder: (context, auth, child) {
                   return MainButton(
                      label: "Next",
                      color: Colors.blue,
                      textColor: Colors.white,
                      function: () async {
                        if (formKye.currentState!.validate()) {
                          auth.forgetPassword(emailController.text);
                        }
                      },
                    );

                  }
                ),

                const Spacer(),
                FooterPage(text: "Have an account? ",
                    textButtom: "Login",
                    onPressed: () {
                      ServiceNavigations.serviceNavi.pushNamedWidget(RouteGenerator.loginPage);
                    })
              ],
            ),
          ),
        ),
      ),

    );
  }

}
