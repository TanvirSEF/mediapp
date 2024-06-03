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

  bookAppointment(String docID, String docName, context) async {
    isLoading(true);

    var store = FirebaseFirestore.instance.collection('appointments').doc();
    await store.set({
      'appBy': FirebaseAuth.instance.currentUser?.uid,
      'appDay': appointmentDayController.text,
      'appTime': appointmentTimeController.text,
      'appPhone': appointmentNumberController.text,
      'appName': appointmentNameController.text,
      'appMsg': appointmentDetailsController.text,
      'appWith': docID,
      'appWithDoctor': docName,
    });
    isLoading(false);
    VxToast.show(context, msg: "Appointment is booked successfully!");
    Get.back();
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getAppointments(bool isDoctor) {
    if (isDoctor) {
      return FirebaseFirestore.instance
          .collection('appointments')
          .where('appWith', isEqualTo: FirebaseAuth.instance.currentUser?.uid)
          .get();
    } else {
      return FirebaseFirestore.instance
          .collection('appointments')
          .where('appBy', isEqualTo: FirebaseAuth.instance.currentUser?.uid)
          .get();
    }
  }
}
