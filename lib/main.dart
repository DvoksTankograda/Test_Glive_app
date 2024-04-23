import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Providers/Providers_app.dart';
import 'pages/auth_page.dart';

void main() {
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => PointsManager()),
      ],
      child:const MyApp()

    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: AuthPage(),
    );
  }
}
