import 'package:bookui/src/settings/settings_controller.dart';
import 'package:flutter/material.dart';

import 'package:bookui/src/providers/book_provider.dart';
import 'package:provider/provider.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({Key? key, required this.settingsController})
      : super(key: key);
  final SettingsController settingsController;

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Row(
        children: [
          Expanded(
              child: Stack(children: <Widget>[
            TextField(
              decoration: InputDecoration(
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none),
                  contentPadding: const EdgeInsets.symmetric(vertical: 0),
                  prefixIcon: Icon(
                    Icons.search_outlined,
                    color: Theme.of(context).colorScheme.onSurface,
                    size: 30,
                  ),
                  hintText: 'Search book here..',
                  hintStyle: TextStyle(color: Colors.grey[600])),
            ),
          ])),
          IconButton(
              onPressed: () {
                widget.settingsController.updateThemeMode(
                    widget.settingsController.themeMode == ThemeMode.light
                        ? ThemeMode.dark
                        : ThemeMode.light);
              },
              icon: Icon(
                widget.settingsController.themeMode == ThemeMode.light
                    ? Icons.dark_mode_rounded
                    : Icons.light_mode_rounded,
              ))
        ],
      ),
    );
  }
}
