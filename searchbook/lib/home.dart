import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:searchbook/bookAppTheme.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  SimpleFilter simpleFilter = SimpleFilter.fantasy;

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
            getAppBarUI(),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    children: <Widget>[
                      getSearchBarUI(),
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


  // DONE: getAppBarUI - 122-001
  Widget getAppBarUI() {
    return Padding(
      padding: const EdgeInsets.only(top: 9.0, left: 18, right: 18),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Search your',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    letterSpacing: 0.2,
                    color: BookAppTheme.grey
                  ),
                ),
                Text(
                  'Favorite books',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      letterSpacing: 0.27,
                      color: BookAppTheme.darkerText
                  ),
                ),
              ],
            )
          ),
          Container(
            width: 60,
            height: 60,
            child: Image.asset('assets/diamond.png'),
          )
        ],
      ),
    );
  }

  // DONE: getSearchBarUI - 122-002:
  Widget getSearchBarUI() {
    return Padding(
      padding: const EdgeInsets.only(top: 9.0, left: 18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width * 0.75,
            height: 64,
            child: Padding(
              padding: const EdgeInsets.only(top:8.0, bottom: 8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: HexColor('#F8FAFB'),
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(13.0),
                    bottomLeft: Radius.circular(13.0),
                    topLeft: Radius.circular(13.0),
                    topRight: Radius.circular(13.0),
                  ),
                ),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.only(left: 16, right: 16),
                        child: TextFormField(
                          style: TextStyle(
                            fontFamily: 'WorkSans',
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: BookAppTheme.nearlyBlue,
                          ),
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            labelText: 'Tap to begin the search...',
                            border: InputBorder.none,
                            helperStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: HexColor('#B9BABC'),
                            ),
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              letterSpacing: 0.2,
                              color: HexColor('#B9BABC'),
                            ),
                          ),
                          onEditingComplete: () {},
                        )
                      ),
                    ),
                    SizedBox(
                      width: 60,
                      height: 60,
                      child: Icon(Icons.search, color: HexColor('#B9BABC')),
                    )
                  ],
                ),
              )
            ),
          ),
          const Expanded(
            child: SizedBox(),
          )
        ],
      )
    );
  }

  // filterTagUI
  Widget filterTagUI(SimpleFilter simpleFilterData, bool isSelected) {
    String txt = '';
    if (SimpleFilter.fantasy == simpleFilterData) {
      txt = 'Fantasy';
    } else if (SimpleFilter.thriller == simpleFilterData) {
      txt = 'Thriller';
    } else if (SimpleFilter.horror == simpleFilterData) {
      txt = 'Horror';
    }
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ?
            BookAppTheme.nearlyBlue : BookAppTheme.nearlyWhite,
          borderRadius: const BorderRadius.all(Radius.circular(24.0)),
          border: Border.all(color: BookAppTheme.nearlyBlue)
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            splashColor: Colors.white24,
            borderRadius: const BorderRadius.all(Radius.circular(24.0)),
            onTap: () {
              setState(() {
                simpleFilter = simpleFilterData;
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 12, bottom: 12, left: 18, right: 18),
              child: Center(
                child: Text(
                  txt,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                    letterSpacing: 0.27,
                    color: isSelected
                        ? BookAppTheme.nearlyWhite
                        : BookAppTheme.nearlyBlue,
                  ),
                ),
              ),
            ),
          )
        ),
      ),
    );
  }

  // TODO: getBooksUI - 122-003
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

  // TODO: getPopularBooksUI - 122-004
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



enum SimpleFilter {
  fantasy,
  thriller,
  horror,
}