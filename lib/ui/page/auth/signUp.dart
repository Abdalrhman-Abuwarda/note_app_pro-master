import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note_app_pro/resources/values.dart';
import 'package:provider/provider.dart';
import '../../../core/models/studentModel.dart';
import '../../../core/provider/authProvider.dart';
import '../../../routing/navigations.dart';
import '../../../routing/router.dart';
import '../../../utils/helper.dart';
import '../../../utils/validate.dart';
import '../../shared/widget/footerPage.dart';
import '../../shared/widget/headerPage.dart';
import '../../shared/widget/mainButton.dart';
import '../../shared/widget/mainTextField.dart';
import '../../shared/widget/radioTile.dart';
enum Gender {
  M,
  F,
}

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool isCheck = false;

  late TextEditingController emailController ;
  late TextEditingController fullNameController;
  late TextEditingController passwordController;

  var formKye = GlobalKey<FormState>();
  bool isPassword = true;
  String _human = Gender.M.name;
  var provider = Provider.of<AuthProvider>;

  @override
  void initState() {

    // TODO: implement initState
    super.initState();
    emailController = TextEditingController();
    fullNameController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    fullNameController.dispose();
    passwordController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 80.h, right: 20.w, left: 20.w),
          child: Form(
            key: formKye,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                  child: HeaderPage(text: "Sign ", gradientText: "Up",),
                ),
                const Center(
                  child: Text(
                    "Create a new account",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                addVerticalSpace(90.h),
                MainTextField(
                  controller: fullNameController,
                  hintText: "Full name",
                  icon: Icons.person,
                  inbutType: TextInputType.emailAddress,
                  validator: (value) => Validate.validateUserName(value),
                ),
                addVerticalSpace(10.h),
                MainTextField(
                  controller: emailController,
                  hintText: "Email",
                  icon: Icons.email,
                  inbutType: TextInputType.emailAddress,
                  validator: (value) => Validate.validateEmail(value),
                ),
                addVerticalSpace(10.h),
                MainTextField(
                  hintText: "Password",
                  controller: passwordController,
                  icon: Icons.lock,
                  inbutType: TextInputType.visiblePassword,
                  suffixIcon:
                      isPassword ? Icons.visibility : Icons.visibility_off,
                  isPassword: isPassword,
                  validator: (value) => Validate.validatePassword(value),
                  suffixPressed: () {
                    setState(() {
                      isPassword = !isPassword;
                    });
                  },
                ),
                addVerticalSpace(10.h),
                Row(
                  children: [
                    RadioTile( text: "Male",value: Gender.M.name, groupValue: _human, onChange: (value){
                      setState(() {
                        _human = value ?? '';
                      });
                    }),
                    RadioTile( text: "Female",value: Gender.F.name, groupValue: _human, onChange: (value){
                      setState(() {
                        _human = value ?? '';
                      });
                    }),
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                        value: isCheck,
                        onChanged: (value) {
                          setState(() {
                            isCheck = value!;
                          });
                        }),
                    const Text(
                      "Agree With",
                      style: TextStyle(color: Color(0xFFCCCCCC)),
                    ),
                    TextButton(
                        onPressed: () {},
                        child: const Text(
                          "trames and condition",
                          style: TextStyle(color: Color(0xFF21AA93)),
                        ))
                  ],
                ),
                addVerticalSpace(80.h),
                Consumer<AuthProvider>(
                  builder: (context, auth, child){
                    return MainButton(
                      label: "Sign up",
                      color: Colors.blue,
                      textColor: Colors.white,
                      function: () async {
                        if (formKye.currentState!.validate()) {
                          auth.register(student);
                          // Helepers.showSnackBar(context, message: "Register Successfully");
                        }
                      },
                    );
                  },

                ),
                const Spacer(),
                FooterPage(
                  text: "Haven an account?",
                  onPressed: () {  ServiceNavigations.serviceNavi.pushNamedWidget(RouteGenerator.loginPage);},
                  textButtom: "Login",
                )
              ],
            ),
          ),
        ),
      ),
    );
  }


  Student get student {
    Student student = Student();
    student.fullName = fullNameController.text;
    student.email = emailController.text;
    student.password = passwordController.text;
    student.gender = _human.toString();
      return student;
  }
}



