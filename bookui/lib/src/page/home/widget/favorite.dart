import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import '../../../providers/book_provider.dart';

class FavoriteWidget extends StatefulWidget {
  final String favoriteId;

  const FavoriteWidget({Key? key, required this.favoriteId}) : super(key: key);

  @override
  _FavoriteWidgetState createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var id = widget.favoriteId;
    return Consumer<HomeProvider>(
        builder: (context, provider, widget) => IconButton(
            onPressed: () {
              provider.onFavorite(id);
            },
            icon: Icon(
              provider.isFavorite(id)
                  ? Icons.favorite
                  : Icons.favorite_border_outlined,
              color: Colors.orange[300],
            )));
  }
}
