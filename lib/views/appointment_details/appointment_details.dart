import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_doctime/controllers/appointment_controller.dart';
import 'package:flutter_doctime/views/appointment_detail_view/appointment_detail_view.dart';
import 'package:get/get.dart';

import '../../consts/consts.dart';

class AppointmentDetails extends StatelessWidget {
  const AppointmentDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AppointmentController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.blueColor,
        title: AppStyles.bold(
            title: "Appointments",
            color: AppColors.whiteColor,
            size: AppSizes.size18),
      ),
      body: FutureBuilder<QuerySnapshot>(
          future: controller.getAppointments(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              var data = snapshot.data?.docs;
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: ListView.builder(
                  itemCount: data?.length ?? 0,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      onTap: () {
                        Get.to(() => AppointmentDetailView(
                              doc: data[index],
                            ));
                      },
                      leading: CircleAvatar(
                        child: Image.asset(AppAssets.imgsign),
                      ),
                      title:
                          AppStyles.bold(title: data![index]['appWithDoctor']),
                      subtitle: AppStyles.normal(
                          title:
                              "${data[index]['appDay']} - ${data[index]['appTime']}",
                          color: AppColors.textColor.withOpacity(0.5)),
                    );
                  },
                ),
              );
            }
          }),
    );
  }
}
