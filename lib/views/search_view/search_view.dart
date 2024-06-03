import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_doctime/consts/consts.dart';
import 'package:flutter_doctime/views/doctors_profile_view/doctors_profile_view.dart';
import 'package:get/get.dart';

class SearchView extends StatelessWidget {
  final String searchQuery;
  const SearchView({super.key, required this.searchQuery});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.blueColor,
        elevation: 0.0,
        title: AppStyles.bold(
            title: "Search Results",
            color: AppColors.whiteColor,
            size: AppSizes.size18),
      ),
      body: FutureBuilder<QuerySnapshot>(
        future: FirebaseFirestore.instance.collection('doctors').get(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 180,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (BuildContext context, int index) {
                  var doc = snapshot.data!.docs[index];
                  return !doc['docName']
                          .toString()
                          .toLowerCase()
                          .contains(searchQuery.toLowerCase())
                      ? const SizedBox.shrink()
                      : GestureDetector(
                          onTap: () {
                            Get.to(() => DoctorsProfileView(doc: doc));
                          },
                          child: Container(
                            clipBehavior: Clip.hardEdge,
                            decoration: BoxDecoration(
                              color: AppColors.bgDarkColor,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            margin: const EdgeInsets.only(right: 8),
                            height: 100,
                            width: 150,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    color: Colors.amber,
                                    child: Image.asset(
                                      AppAssets.imgsign,
                                      width: 100,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  5.heightBox,
                                  AppStyles.normal(title: doc['docName']),
                                  VxRating(
                                    selectionColor: AppColors.yellowColor,
                                    onRatingUpdate: (value) {},
                                    count: 5,
                                    maxRating: 5,
                                    value: double.parse(
                                        doc['docRating'].toString()),
                                    stepInt: true,
                                  ),
                                ],
                              ),
                            ),
                          ));
                },
              ),
            );
          }
        },
      ),
    );
  }
}
