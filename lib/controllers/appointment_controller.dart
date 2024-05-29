import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_doctime/consts/consts.dart';
import 'package:get/get.dart';

class AppointmentController extends GetxController {
  var isLoading = false.obs;

  var appointmentDayController = TextEditingController();
  var appointmentTimeController = TextEditingController();
  var appointmentNumberController = TextEditingController();
  var appointmentNameController = TextEditingController();
  var appointmentDetailsController = TextEditingController();

  bookAppointment(String docId, context) async {
    isLoading(true);

    var store = FirebaseFirestore.instance.collection('appointments').doc();
    await store.set({
      'appBy': FirebaseAuth.instance.currentUser?.uid,
      'appDay': appointmentDayController.text,
      'appTime': appointmentTimeController.text,
      'appPhone': appointmentNumberController.text,
      'appName': appointmentNameController.text,
      'appMsg': appointmentDetailsController.text,
      'appWith': docId,
    });
    isLoading(false);
    VxToast.show(context, msg: "Appointment is booked successfully!");
    Get.back();
  }
}
