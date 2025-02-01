import 'package:flutter/material.dart';

import 'backdrop.dart';
import 'model/product.dart';
import 'menu.dart';
import 'home.dart';
import 'login.dart';
import 'design/theme.dart';

void main() => runApp(ShrineApp());


class ShrineApp extends StatefulWidget {
  const ShrineApp({super.key});
  @override
  State<StatefulWidget> createState() => _ShrineAppState();
}

class _ShrineAppState extends State<ShrineApp> {
  Category _currentCategory = Category.all;
  void _onCategoryTap(Category category) {setState(() { _currentCategory = category;});}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shrine',
      initialRoute: '/login',
      routes: {
        '/login': (BuildContext context) => const LoginPage(),

        '/': (BuildContext context) => Backdrop(
          currentCategory: _currentCategory,
          frontLayer: HomePage(category: _currentCategory),
          backLayer: CategoryMenuPage( currentCategory: _currentCategory, onCategoryTap: _onCategoryTap,),
          frontTitle: Text('SHRINE'),
          backTitle: Text('MENU'),
        )
      },
      //theme: ThemeData.dark(useMaterial3: true),
      theme: ShrineTheme.buildShrineTheme()

    );
  }
}
