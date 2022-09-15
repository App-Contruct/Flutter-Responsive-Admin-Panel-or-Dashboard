import 'package:admin/utils/constants.dart';
import 'package:admin/controllers/MenuController.dart';
import 'package:admin/screens/auth/auth_screem.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: dotenv.env['firebase_apiKey']!,
      appId: dotenv.env['firebase_appId']!,
      messagingSenderId: dotenv.env['firebase_messagingSenderId']!,
      projectId: dotenv.env['firebase_projectId']!,
      authDomain: dotenv.env['firebase_authDomain']!,
      measurementId: dotenv.env['firebase_measurementId']!,
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Painel de Administração',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: bgColor,
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
            .apply(bodyColor: Colors.white),
        canvasColor: secondaryColor,
      ),
      home: AuthScreen(),
    );
  }
}
