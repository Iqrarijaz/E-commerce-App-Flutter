import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:project1/models/catalog.dart';
import 'package:project1/utils/routes.dart';
import 'package:project1/widgets/home_widgets/catalog_header.dart';
import 'package:project1/widgets/home_widgets/catalog_list.dart';
import 'dart:convert';
import 'package:project1/widgets/theme.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    var CatalogJson = await rootBundle.loadString("assets/files/catalog.json");
    var decodeData = jsonDecode(CatalogJson);
    print(decodeData);
    var productData = decodeData["products"];
    CatalogModel.items =
        List.from(productData).map<Item>((item) => Item.fromMap(item)).toList();
    print(productData);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, MyRoutes.cartPageRoute);
        },
        child: Icon(CupertinoIcons.cart, color: Colors.white),
        backgroundColor: context.theme.buttonColor,
      ).p4(),
      body: SafeArea(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: (Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CatalogHeader(),
                if (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
                  CatalogList().py16().expand()
                else
                  CircularProgressIndicator().centered().py16().expand()
              ],
            )),
          ),
        ),
      ),
    );
  }
}
