import 'package:flutter/material.dart';

import 'package:masmas_fit/title_fonts.dart';

class CustomSearch extends StatefulWidget {
  const CustomSearch({Key? key}) : super(key: key);

  @override
  State<CustomSearch> createState() => CustomSearchState();
}

class CustomSearchState extends State<CustomSearch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Search',
          style: TitleFonts().kSemiBold26,
        ),
      ),
    );
  }
}
