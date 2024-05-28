import 'package:flutter_doctime/consts/consts.dart';
import 'package:flutter_doctime/res/components/custom_button.dart';
import 'package:flutter_doctime/views/appointment_view/appointment.dart';
import 'package:get/get.dart';

class DoctorsProfileView extends StatelessWidget {
  const DoctorsProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgDarkColor,
      appBar: AppBar(
        backgroundColor: AppColors.blueColor,
        title: AppStyles.bold(title: "Doctor Name", color: AppColors.whiteColor, size: AppSizes.size18),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
              ),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius : 40,
                      child: Image.asset(AppAssets.imgsign,),),
                    10.widthBox,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppStyles.bold(title: "Doctor Name", color: AppColors.textColor, size: AppSizes.size14),
                          AppStyles.bold(title: "Category", color: AppColors.textColor.withOpacity(0.5), size: AppSizes.size14),
                          const Spacer(),
                          VxRating(
                            selectionColor: AppColors.yellowColor,
                              onRatingUpdate: (value){},
                              count: 5,
                              maxRating: 5,
                              value: 4,
                              stepInt: true,
                          )
                        ],
                      ),
                    ),
                    AppStyles.bold(title: "See all reviews", color: AppColors.blueColor, size: AppSizes.size12),
                  ],
                ),
              ),
              10.heightBox,
              Container(
                padding: const EdgeInsets.all(12),
                decoration:BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppColors.whiteColor,
                ) ,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      title: AppStyles.bold(title: "Phone Number", color: AppColors.textColor, size: AppSizes.size16),
                      subtitle: AppStyles.normal(title: "01756343...", color: AppColors.textColor.withOpacity(0.5),size: AppSizes.size12),
                      trailing: Container(
                        width: 50,
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: AppColors.yellowColor,
                        ),
                          child: Icon(Icons.phone, color: AppColors.whiteColor,)),
                    ),
                    10.heightBox,
          
                    AppStyles.bold(title: "About", color: AppColors.textColor, size: AppSizes.size16),
                    5.heightBox,
                    AppStyles.normal(title: "This is the about section of a doctor", color: AppColors.textColor, size: AppSizes.size14),
                    10.heightBox,
                    AppStyles.bold(title: "Address", color: AppColors.textColor, size: AppSizes.size16),
                    5.heightBox,
                    AppStyles.normal(title: "This is the Address", color: AppColors.textColor, size: AppSizes.size14),
                    10.heightBox,
                    AppStyles.bold(title: "Working Time ", color: AppColors.textColor, size: AppSizes.size16),
                    5.heightBox,
                    AppStyles.normal(title: "9.00am to 5.00pm", color: AppColors.textColor.withOpacity(0.5), size: AppSizes.size14),
                    10.heightBox,
                    AppStyles.bold(title: "Services", color: AppColors.textColor, size: AppSizes.size16),
                    5.heightBox,
                    AppStyles.normal(title: "Services of a doctor", color: AppColors.textColor.withOpacity(0.5), size: AppSizes.size14),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10.0),
        child: CustomButton(buttonText: "Book an appointment", onTap: (){
          Get.to(()=>const Appointment());
        },),
      ),
    );
  }
}
