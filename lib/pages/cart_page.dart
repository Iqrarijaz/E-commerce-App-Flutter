import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project1/widgets/theme.dart';
import 'package:velocity_x/src/extensions/context_ext.dart';
import 'package:velocity_x/src/extensions/string_ext.dart';

class CartPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "Cart".text.color( context.theme.accentColor).xl4.make(),
        centerTitle: true,
      ),
      backgroundColor: context.canvasColor,
    );
  }
}
