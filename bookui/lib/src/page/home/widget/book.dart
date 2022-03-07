import 'package:flutter/material.dart';
import 'favorite.dart';


class BookWidget extends StatelessWidget {
  final String? _id, _title, _author, _subtitle, _thumbnail, _description;
  BookWidget(this._id, this._title, this._author, this._subtitle,
      this._thumbnail, this._description);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 120,
        child: Row(children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(_thumbnail ?? "-",
                width: 80, height: 150, fit: BoxFit.cover),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              _title ?? "-",
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          FavoriteWidget(favoriteId: _id ?? "-")
                        ]),
                    Text(
                      _author ?? "-",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Flexible(
                      child: RichText(
                        overflow: TextOverflow.ellipsis,
                        text: TextSpan(
                            style: const TextStyle(color: Colors.grey),
                            text: _description ?? _subtitle),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        _buildIconText(Icons.star, Colors.orange[300]!, '4.5(99k)'),
                        const SizedBox(
                          width: 10,
                        ),
                        _buildIconText(
                          Icons.visibility,
                          Colors.white,
                          '65M Read',
                        ),
                      ],
                    )
                  ]))
        ]));
  }

  Widget _buildIconText(IconData icon, Color color, String text) {
    return Row(
      children: [
        Icon(
          icon,
          color: color,
          size: 14,
        ),
        const SizedBox(
          width: 2,
        ),
        Text(
          text,
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
