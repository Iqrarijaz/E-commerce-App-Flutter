// catalogList
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project1/models/catalog.dart';
import 'package:project1/pages/home_detail_page.dart';
import 'package:project1/utils/routes.dart';
import 'package:project1/widgets/theme.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:project1/utils/routes.dart';

class CatalogList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: CatalogModel.items.length,
        itemBuilder: (context, index) {
          final catalog = CatalogModel.getByPosition(index);
          return InkWell(
              onTap:()=> Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeDetailPage(catalog: catalog),
                ),
              ),
              child: CatalogItem(catalog: catalog)
          );
        });
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;

  const CatalogItem({Key? key, required this.catalog})
      : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
      children: [
        Container(
            child: Hero(
              tag: Key(catalog.id.toString()),
              child: Image.network(catalog.image)
                  .box
                  .rounded
                  .p16
                  .color(context.canvasColor)
                  .make()
                  .p16()
                  .w40(context),
            )
        ),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            catalog.name.text.lg.color(context.accentColor).bold.make(),
            catalog.desc.text.make(),
            HeightBox(8),
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              buttonPadding: EdgeInsets.zero,
              children: [
                "\$${catalog.price}".text.bold.lg.make(),
                ElevatedButton(
                  child: "Buy".text.make(),
                  onPressed: () {},
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(context.theme.buttonColor),
                      shape: MaterialStateProperty.all(StadiumBorder())),
                ),
              ],
            ).pOnly(right: 10.0)
          ],
        ))
      ],
    )).color(context.cardColor).rounded.square(150).make().py8();
  }
}
