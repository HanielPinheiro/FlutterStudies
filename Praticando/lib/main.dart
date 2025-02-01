import 'package:flutter/material.dart';
import 'home.dart';
import 'login.dart';
import 'design/theme.dart';

void main() => runApp(const ShrineApp());

// TODO: Convert ShrineApp to stateful widget (104)
class ShrineApp extends StatelessWidget {
  const ShrineApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shrine',
      initialRoute: '/login',
      routes: {
        '/login': (BuildContext context) => const LoginPage(),
        // TODO: Change to a Backdrop with a HomePage frontLayer (104)
        '/': (BuildContext context) => const HomePage(),
        // TODO: Make currentCategory field take _currentCategory (104)
        // TODO: Pass _currentCategory for frontLayer (104)
        // TODO: Change backLayer field value to CategoryMenuPage (104)
      },
      //theme: ThemeData.dark(useMaterial3: true),
      theme: ShrineTheme.buildShrineTheme()

    );
  }
}
