import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  // TODO: Make a collection of cards (102)
  // TODO: Add a variable for Category (104)

  @override
  Widget build(BuildContext context) {
    // TODO: Return an AsymmetricView (104)
    // TODO: Pass Category variable to AsymmetricView (104)
    return Scaffold(
      // Add app bar (102)
      appBar: AppBar(
        title: const Text('BOOK '),
        leading: IconButton(
          icon: const Icon(Icons.menu,
          semanticLabel: 'menu',
          ),
          onPressed: () {
            print('Menu button');
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search,
            semanticLabel: 'search'),
            onPressed: () {
              print('search button');
            },
          ),
          IconButton(
            icon: const Icon(Icons.tune,
                semanticLabel: 'filter'),
            onPressed: () {
              print('Filter button');
            },
          ),
        ],
      ),

      // TODO: Add a grid view (102)
      body: GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.all(16.0),
        childAspectRatio: 8.0 / 9.0,
        // TODO: Build a grid of cards (102)
        children: <Widget>[
          Card(
            clipBehavior: Clip.antiAlias,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                AspectRatio(
                  aspectRatio: 18.0 / 11.0,
                  child: Image.asset('assets/diamond.png'),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
                  
                )
              ],
            ),


          )
        ],
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}