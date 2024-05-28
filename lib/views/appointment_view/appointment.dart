import 'package:flutter_doctime/res/components/custom_textfield.dart';
import '../../consts/consts.dart';
import '../../res/components/custom_button.dart';

class Appointment extends StatelessWidget {
  const Appointment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.blueColor,
        title: AppStyles.bold(title: "Doctor Name", color: AppColors.whiteColor, size: AppSizes.size18),
      ),
      body:  Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppStyles.bold(title: "Select appointment Day"),
                5.heightBox,
                const CustomTextfield(hint: "Select Day"),
                10.heightBox,
                AppStyles.bold(title: "Select appointment Time"),
                5.heightBox,
                const CustomTextfield(hint: "Select Time"),
                20.heightBox,
                AppStyles.bold(title: "Phone Number"),
                5.heightBox,
                const CustomTextfield(hint: "Phone Number"),
                10.heightBox,
                AppStyles.bold(title: "Patient Name"),
                5.heightBox,
                const CustomTextfield(hint: "Enter Patient Name"),
                10.heightBox,
                AppStyles.bold(title: "Patient Problem"),
                5.heightBox,
                const CustomTextfield(hint: "Enter Patient Problem"),
              ],
          ),
        ),
      ),
      bottomNavigationBar:  Padding(
        padding: const EdgeInsets.all(10.0),
        child: CustomButton(buttonText: "Book an appointment", onTap: (){}),
      ),
    );
  }
}
