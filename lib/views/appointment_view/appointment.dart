import 'package:flutter_doctime/controllers/appointment_controller.dart';
import 'package:flutter_doctime/res/components/custom_textfield.dart';
import 'package:get/get.dart';
import '../../consts/consts.dart';
import '../../res/components/custom_button.dart';

class Appointment extends StatelessWidget {
  final String docID;
  final String docName;
  const Appointment({super.key, required this.docID, required this.docName});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AppointmentController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.blueColor,
        title: AppStyles.bold(
            title: docName, color: AppColors.whiteColor, size: AppSizes.size18),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppStyles.bold(title: "Select appointment Day"),
              5.heightBox,
              CustomTextfield(
                hint: "Select Day",
                textController: controller.appointmentDayController,
              ),
              10.heightBox,
              AppStyles.bold(title: "Select appointment Time"),
              5.heightBox,
              CustomTextfield(
                hint: "Select Time",
                textController: controller.appointmentTimeController,
              ),
              20.heightBox,
              AppStyles.bold(title: "Phone Number"),
              5.heightBox,
              CustomTextfield(
                hint: "Phone Number",
                textController: controller.appointmentNumberController,
              ),
              10.heightBox,
              AppStyles.bold(title: "Patient Name"),
              5.heightBox,
              CustomTextfield(
                hint: "Enter Patient Name",
                textController: controller.appointmentNameController,
              ),
              10.heightBox,
              AppStyles.bold(title: "Patient Problem"),
              5.heightBox,
              CustomTextfield(
                hint: "Enter Patient Problem",
                textController: controller.appointmentDetailsController,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Obx(
        () => Padding(
          padding: const EdgeInsets.all(10.0),
          child: controller.isLoading.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : CustomButton(
                  buttonText: "Book an appointment",
                  onTap: () async {
                    await controller.bookAppointment(docID, context);
                  }),
        ),
      ),
    );
  }
}
