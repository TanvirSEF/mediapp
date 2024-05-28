import '../../consts/consts.dart';


class AppointmentDetailView extends StatelessWidget {
  const AppointmentDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: AppColors.blueColor,
        title: AppStyles.bold(title: "Doctor Name", color: AppColors.whiteColor, size: AppSizes.size18),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppStyles.bold(title: "Select appointment Day"),
              5.heightBox,
              AppStyles.normal(title: "Selected Day"),
              10.heightBox,
              AppStyles.bold(title: "Select appointment Time"),
              5.heightBox,
              AppStyles.normal(title: "Selected Time"),
              20.heightBox,
              AppStyles.bold(title: "Phone Number"),
              5.heightBox,
              AppStyles.normal(title: "Phone Number"),
              10.heightBox,
              AppStyles.bold(title: "Patient Name"),
              5.heightBox,
              AppStyles.normal(title: "Name"),
              10.heightBox,
              AppStyles.bold(title: "Patient Problem"),
              5.heightBox,
              AppStyles.normal(title: "Problem")
            ],
          ),
        ),
      );
  }
}
