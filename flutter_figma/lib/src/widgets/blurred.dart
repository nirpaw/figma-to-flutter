import 'dart:ui';

import 'package:flutter/widgets.dart';
import 'package:flutter_figma/src/helpers/api_extensions.dart';
import 'package:flutter_figma/src/rendering/decoration.dart';

class FigmaBlurred extends StatelessWidget {
  final Widget child;
  final List<FigmaBackgroundBlurEffect> effects;
  final List<num> cornerRadii;
  const FigmaBlurred({
    Key key,
    @required this.child,
    @required this.cornerRadii,
    @required this.effects,
  })  : assert(effects != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    var result = child;

    for (var effect in effects) {
      result = ClipRRect(
        borderRadius: cornerRadii.toBorderRadius(),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: effect.radius,
            sigmaY: effect.radius,
          ),
          child: result,
        ),
      );
    }

    return result;
  }
}
