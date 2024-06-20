import 'package:dairyapp/Routes/AppRoutes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'Pages/Home/Tabs/SettingTab/help center/view_model/support_view_model.dart';
import 'firebase_options.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
    print("Firebase initialized successfully");
  } catch (e) {
    print("Error initializing Firebase: $e");
  }
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light,
      ));
  runApp(
    MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context)=>SupportViewModel(),
          ),
          // Add other providers if necessary
        ],
        child:  MyApp()
    ),
  );
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
     // themeMode: Provider.of<ThemeNotifier>(context).themeMode,
      initialRoute: '/',
      getPages:AppRoutes.routes,
      //home: MyHomePage(),
    );
  }
}

