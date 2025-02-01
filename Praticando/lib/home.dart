import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:praticando/login.dart';

import 'model/product.dart';
import 'model/product_repository.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

// TODO: Make a collection of cards (102)

// Replace this entire method
  List<Card> _buildGridCards(BuildContext context) {

    List<Product> products = ProductsRepository.loadProducts(Category.all);
    if (products.isEmpty) return const <Card>[];

    final ThemeData theme = Theme.of(context);
    final NumberFormat formatter = NumberFormat.simpleCurrency(locale: Localizations.localeOf(context).toString());

    return products.map((product) {
      return Card(
        clipBehavior: Clip.antiAlias,
        elevation: 8.0,
        child: Column(
          // TODO: Center items on the card (103)
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AspectRatio(aspectRatio: 18 / 11, child: Image.asset(product.assetName, package: product.assetPackage,fit: BoxFit.fitWidth)),
            Expanded(
              child: Padding(padding: const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  // TODO: Change innermost Column (103)
                  children: <Widget>[
                    Text(product.name,style: theme.textTheme.bodyLarge,softWrap: false,overflow: TextOverflow.ellipsis,maxLines: 1,),
                    const SizedBox(height: 4.0),
                    Text( formatter.format(product.price), style: theme.textTheme.bodySmall),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }).toList();
  }


  // TODO: Add a variable for Category (104)
  @override
  Widget build(BuildContext context) {
    // TODO: Return an AsymmetricView (104)
    // TODO: Pass Category variable to AsymmetricView (104)
    return Scaffold(
        appBar: AppBar( leading: IconButton(icon: const Icon(Icons.menu,semanticLabel: 'menu',),onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => const LoginPage(),));}),
                        title: const Text('SHRINE'),
                        actions: <Widget>[
                          IconButton(icon: const Icon(Icons.search,semanticLabel: 'search',),onPressed: () {print('Search button');}),
                          IconButton(    icon: const Icon(Icons.tune,semanticLabel: 'filter',), onPressed: () {print('Filter button');})
                        ]
        ),
        body: GridView.count(crossAxisCount: 2,padding: const EdgeInsets.all(16.0),childAspectRatio: 8.0 / 9.0, children: _buildGridCards(context)),
        resizeToAvoidBottomInset: false
    );
  }
}
