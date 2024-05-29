import 'package:flutter_doctime/consts/consts.dart';
import 'package:flutter_doctime/consts/lists.dart';
import 'package:flutter_doctime/controllers/auth_controller.dart';
import 'package:flutter_doctime/controllers/setting_controller.dart';
import 'package:flutter_doctime/views/login_view/login_view.dart';
import 'package:get/get.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(SettingController());
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: AppStyles.bold(
            title: AppStrings.settings,
            color: AppColors.whiteColor,
            size: AppSizes.size18),
        backgroundColor: AppColors.blueColor,
      ),
      body: Obx(
        () => controller.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      child: Image.asset(AppAssets.imgsign),
                    ),
                    title: AppStyles.bold(title: controller.username.value),
                    subtitle: AppStyles.normal(title: controller.email.value),
                  ),
                  const Divider(),
                  10.heightBox,
                  ListView(
                    shrinkWrap: true,
                    children: List.generate(
                        settingsList.length,
                        (index) => ListTile(
                              onTap: () async {
                                if (index == 2) {
                                  AuthController().signout();
                                  Get.offAll(() => const LoginView());
                                }
                              },
                              leading: Icon(
                                settingsListIcon[index],
                                color: AppColors.blueColor,
                              ),
                              title: AppStyles.bold(
                                title: settingsList[index],
                              ),
                            )),
                  ),
                ],
              ),
      ),
    );
  }
}
