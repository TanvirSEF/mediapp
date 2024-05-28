import 'package:flutter_doctime/controllers/auth_controller.dart';
import 'package:flutter_doctime/res/components/custom_button.dart';
import 'package:flutter_doctime/res/components/custom_textfield.dart';
import 'package:flutter_doctime/consts/consts.dart';
import 'package:flutter_doctime/views/home/homee.dart';
import 'package:flutter_doctime/views/signup_view/signup_view.dart';
import 'package:get/get.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AuthController());
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 40),
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  AppAssets.ioBody,
                  width: 200,
                ),
                10.heightBox,
                AppStyles.bold(
                    title: AppStrings.welcomeBack, size: AppSizes.size18),
                AppStyles.bold(title: AppStrings.weAreExcited)
              ],
            ),
            30.heightBox,
            Expanded(
              child: Form(
                  child: SingleChildScrollView(
                child: Column(
                  children: [
                    CustomTextfield(
                      hint: AppStrings.email,
                      textController: controller.emailController,
                    ),
                    10.heightBox,
                    CustomTextfield(
                      hint: AppStrings.password,
                      textController: controller.passwordController,
                    ),
                    20.heightBox,
                    Align(
                        alignment: Alignment.centerRight,
                        child:
                            AppStyles.normal(title: AppStrings.forgetPassword)),
                    20.heightBox,
                    CustomButton(
                      buttonText: AppStrings.login,
                      onTap: () async {
                        await controller.loginUser();
                        if (controller.userCredential != null) {
                          Get.to(() => const Homee());
                        }
                      },
                    ),
                    20.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppStyles.normal(title: AppStrings.dontHaveAccount),
                        8.widthBox,
                        GestureDetector(
                          onTap: () {
                            Get.to(() => const SignupView());
                          },
                          child: AppStyles.bold(
                              title: AppStrings.signup, size: AppSizes.size18),
                        ),
                      ],
                    )
                  ],
                ),
              )),
            )
          ],
        ),
      ),
    );
  }
}
