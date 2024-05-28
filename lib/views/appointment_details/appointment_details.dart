import 'package:flutter_doctime/views/appointment_detail_view/appointment_detail_view.dart';
import 'package:get/get.dart';

import '../../consts/consts.dart';

class AppointmentDetails extends StatelessWidget {
  const AppointmentDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.blueColor,
        title: AppStyles.bold(title: "Appointments", color: AppColors.whiteColor, size: AppSizes.size18),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.builder(
            itemCount: 4,
          itemBuilder: (BuildContext context, int index){
              return  ListTile(
                onTap: (){
                  Get.to(()=>const AppointmentDetailView());
                },
                leading: CircleAvatar(child: Image.asset(AppAssets.imgsign),),
                title: AppStyles.bold(title: "Doctor Name"),
                subtitle: AppStyles.normal(title: "Appointment time", color: AppColors.textColor.withOpacity(0.5)),
              );
          },
        ),
      ),
    );
  }
}
