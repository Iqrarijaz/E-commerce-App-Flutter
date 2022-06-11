//catalog header for main page
import 'package:flutter/cupertino.dart';
import 'package:project1/widgets/theme.dart';
import 'package:velocity_x/src/extensions/context_ext.dart';

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Catalog App",
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.bold,
            color: context.theme.accentColor,
          ),
        ),
        Text(
          "Trending products",
          style: TextStyle(
            fontSize: 20,
            color: context.theme.accentColor,
          ),
        ),
      ],
    );
  }
}