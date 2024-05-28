import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_doctime/consts/consts.dart';
import 'package:flutter_doctime/firebase_options.dart';
import 'package:flutter_doctime/res/components/waiting_screen.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(fontFamily: AppFonts.nunito),
      debugShowCheckedModeBanner: false,
      home: const WaitingScreen(),
    );
  }
}
