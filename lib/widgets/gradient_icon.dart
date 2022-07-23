import 'package:flutter/material.dart';
import 'package:masmas_fit/colors.dart';

Widget gradientIcon({LinearGradient? gradient, required Widget icon}) {
  gradient ??= kBlueLinear;
  //Radiengradient = RadientGradient(colors: gradient.colors, tileMode: TileMode.mirror);
  return ShaderMask(
    shaderCallback: (bounds) {
      return gradient!.createShader(Offset.zero & bounds.size);
    },
    child: icon,
  );
}
