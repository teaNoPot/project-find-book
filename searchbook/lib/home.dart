import 'package:flutter/material.dart';
import 'package:searchbook/bookAppTheme.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CategoryType categoryType = CategoryType.ui;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: BookAppTheme.nearlyWhite,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).padding.top,
            ),
            //getAppBarUI(),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    children: <Widget>[
                      //getSearchBarUI(),
                      getBooksUI(),
                      Flexible(
                        child: getPopularBooksUI()
                      ),
                    ],
                  )
                )
              )
            )
          ],
        )
      )
    );
  }

  Widget getBooksUI() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 8.0, left: 18, right: 16),
          child: Text(
            ''
          )
        )
      ],
    );
  }

  Widget getPopularBooksUI() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 18, right: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Popular Books',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 22,
              letterSpacing: 0.27,
              color: BookAppTheme.darkerText,
            ),
          ),
          Flexible(
            child: Text("test"),
          ),
        ],
      ),
    );
  }

  void moveTo() {
    Navigator.push<dynamic>(
      context,
      MaterialPageRoute<dynamic>(
        builder: (BuildContext context) => Text("BookInfoScreen()"),
      ),
    );
  }


}



enum CategoryType {
  ui,
  coding,
  basic,
}