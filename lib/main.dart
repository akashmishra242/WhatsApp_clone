import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_clone/firebase_options.dart';

import 'Authentication/views/welcomepage.dart';
import 'common/route/routes.dart';
import 'common/utility/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Whatsapp Clone',
      theme: ThemeData.dark().copyWith(
          backgroundColor: backgroundColor,
          appBarTheme: const AppBarTheme(color: appBarColor)),
      onGenerateRoute: (settings) => generateRoute(settings),
      home: const WelcomePage(),
    );
  }
}
