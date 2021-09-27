import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:valoprosuser/core/constant/sizeconfig.dart';
import 'package:valoprosuser/ui/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Valo-PROS-user',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(textTheme: GoogleFonts.latoTextTheme()),
      builder: (context, test) {
        SizeConfig.init(context);
        return test!;
      },
      home: const HomePage(),
    );
  }
}
