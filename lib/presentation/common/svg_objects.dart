import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test_app/components/resources.g.dart';

abstract class SvgObjects {
  static void init() {
    final pics = <String>[
      R.ASSETS_SVG_RU_SVG,
      R.ASSETS_SVG_UK_SVG,
    ];
    for (final String p in pics) {
      final loader = SvgAssetLoader(p);
      svg.cache.putIfAbsent(loader.cacheKey(null), () => loader.loadBytes(null));
    }
  }
}

class SvgRu extends StatelessWidget {
  const SvgRu({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(R.ASSETS_SVG_RU_SVG);
  }
}

class SvgUk extends StatelessWidget {
  const SvgUk({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(R.ASSETS_SVG_UK_SVG);
  }
}
