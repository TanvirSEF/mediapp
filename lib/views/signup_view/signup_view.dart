import 'package:flutter_doctime/controllers/auth_controller.dart';
import 'package:flutter_doctime/res/components/custom_button.dart';
import 'package:flutter_doctime/res/components/custom_textfield.dart';
import 'package:flutter_doctime/consts/consts.dart';
import 'package:flutter_doctime/views/home/homee.dart';
import 'package:get/get.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

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
                  AppAssets.imgsign,
                  width: 200,
                ),
                10.heightBox,
                // AppStyles.bold(
                //     title: AppStrings.signup, size: AppSizes.size22),
                AppStyles.bold(
                  title: AppStrings.signupNow,
                  size: AppSizes.size22,
                  alignment: TextAlign.center,
                )
              ],
            ),
            30.heightBox,
            Expanded(
              child: Form(
                  child: SingleChildScrollView(
                child: Column(
                  children: [
                    CustomTextfield(
                      hint: AppStrings.fullname,
                      textController: controller.fullnameController,
                    ),
                    10.heightBox,
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
                    CustomButton(
                      buttonText: AppStrings.signup,
                      onTap: () async {
                        await controller.signupUser();
                        if (controller.userCredential != null) {
                          Get.offAll(() => const Homee());
                        }
                      },
                    ),
                    20.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppStyles.normal(title: AppStrings.alreadyHaveAccount),
                        8.widthBox,
                        GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: AppStyles.bold(
                              title: AppStrings.login, size: AppSizes.size20),
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
