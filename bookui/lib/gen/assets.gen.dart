/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// ignore_for_file: directives_ordering,unnecessary_import

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/book1.jpg
  AssetGenImage get book1 => const AssetGenImage('assets/images/book1.jpg');

  /// File path: assets/images/book10.jpg
  AssetGenImage get book10 => const AssetGenImage('assets/images/book10.jpg');

  /// File path: assets/images/book2.jpg
  AssetGenImage get book2 => const AssetGenImage('assets/images/book2.jpg');

  /// File path: assets/images/book3.jpg
  AssetGenImage get book3 => const AssetGenImage('assets/images/book3.jpg');

  /// File path: assets/images/book4.jpg
  AssetGenImage get book4 => const AssetGenImage('assets/images/book4.jpg');

  /// File path: assets/images/book5.jpg
  AssetGenImage get book5 => const AssetGenImage('assets/images/book5.jpg');

  /// File path: assets/images/book6.jpg
  AssetGenImage get book6 => const AssetGenImage('assets/images/book6.jpg');

  /// File path: assets/images/book7.jpg
  AssetGenImage get book7 => const AssetGenImage('assets/images/book7.jpg');

  /// File path: assets/images/book8.jpg
  AssetGenImage get book8 => const AssetGenImage('assets/images/book8.jpg');

  /// File path: assets/images/book9.jpg
  AssetGenImage get book9 => const AssetGenImage('assets/images/book9.jpg');

  /// File path: assets/images/flutter_logo.png
  AssetGenImage get flutterLogo =>
      const AssetGenImage('assets/images/flutter_logo.png');

  /// File path: assets/images/upcoming1.jpg
  AssetGenImage get upcoming1 =>
      const AssetGenImage('assets/images/upcoming1.jpg');

  /// File path: assets/images/upcoming2.png
  AssetGenImage get upcoming2 =>
      const AssetGenImage('assets/images/upcoming2.png');

  /// File path: assets/images/upcoming3.jpg
  AssetGenImage get upcoming3 =>
      const AssetGenImage('assets/images/upcoming3.jpg');
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage extends AssetImage {
  const AssetGenImage(String assetName) : super(assetName);

  Image image({
    Key? key,
    ImageFrameBuilder? frameBuilder,
    ImageLoadingBuilder? loadingBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? width,
    double? height,
    Color? color,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    FilterQuality filterQuality = FilterQuality.low,
  }) {
    return Image(
      key: key,
      image: this,
      frameBuilder: frameBuilder,
      loadingBuilder: loadingBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      width: width,
      height: height,
      color: color,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      filterQuality: filterQuality,
    );
  }

  String get path => assetName;
}
