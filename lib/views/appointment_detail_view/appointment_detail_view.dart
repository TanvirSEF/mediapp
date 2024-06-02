import 'package:cloud_firestore/cloud_firestore.dart';
import '../../consts/consts.dart';

class AppointmentDetailView extends StatelessWidget {
  final DocumentSnapshot doc;
  const AppointmentDetailView({super.key, required this.doc});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: AppColors.blueColor,
        title: AppStyles.bold(
            title: doc['appWithDoctor'],
            color: AppColors.whiteColor,
            size: AppSizes.size18),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppStyles.bold(title: "Select appointment Day"),
            5.heightBox,
            AppStyles.normal(title: doc['appDay']),
            10.heightBox,
            AppStyles.bold(title: "Select appointment Time"),
            5.heightBox,
            AppStyles.normal(title: doc['appTime']),
            20.heightBox,
            AppStyles.bold(title: "Phone Number"),
            5.heightBox,
            AppStyles.normal(title: doc['appPhone']),
            10.heightBox,
            AppStyles.bold(title: "Patient Name"),
            5.heightBox,
            AppStyles.normal(title: doc['appName']),
            10.heightBox,
            AppStyles.bold(title: "Patient Problem"),
            5.heightBox,
            AppStyles.normal(title: doc['appMsg'])
          ],
        ),
      ),
    );
  }
}
