import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:storma/models/product_model.dart';
import 'package:storma/providers/product_provider.dart';
import 'package:storma/shared/theme.dart';
import 'package:storma/ui/page/product_page.dart';

class SearchProduct extends StatefulWidget {
  const SearchProduct({Key? key}) : super(key: key);

  @override
  _SearchProductState createState() => _SearchProductState();
}

class _SearchProductState extends State<SearchProduct> {
  TextEditingController controller = TextEditingController();
  var focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return searchWidget();
  }

  Widget searchWidget() {
    return Builder(builder: (context) {
      return Consumer<ProductProvider>(builder: (context, productProvider, _) {
        return Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 17),
              margin: const EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(defaultRadius),
                  color: cBgColor2),
              child: TextFormField(
                controller: controller,
                style: whiteTextStyle,
                cursorColor: cBlueColor,
                focusNode: focusNode,
                decoration: InputDecoration(
                  suffixIcon: controller.text.isNotEmpty
                      ? GestureDetector(
                          child: Icon(Icons.close, color: cGreyColor),
                          onTap: () {
                            controller.clear;
                            FocusScope.of(context).requestFocus(FocusNode());
                          },
                        )
                      : const SizedBox(),
                  icon: Icon(
                    Icons.search,
                    color: cPrimaryColor,
                  ),
                  hintText: 'Search product',
                  hintStyle: greyTextStyle,
                  focusedBorder: InputBorder.none,
                ),
                onChanged: (String value) =>
                    productProvider.searchProduct(value),
              ),
            ),
            Expanded(
              child: productProvider.filterProduct != null &&
                      productProvider.filterProduct!.isNotEmpty
                  ? searchResult()
                  : const SizedBox(),
            ),
          ],
        );
      });
    });
  }

  Widget searchResult() {
    return Stack(
      children: [
        Builder(builder: (context) {
          return Consumer<ProductProvider>(
            builder: (context, productProvider, _) {
              return Container(
                margin: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(defaultRadius),
                  color: cBgColor4,
                ),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemCount: productProvider.filterProduct!.length,
                  itemBuilder: (context, index) {
                    var item = productProvider.filterProduct![index];

                    return searchItem(item);
                  },
                ),
              );
            },
          );
        }),
      ],
    );
  }

  Widget searchItem(ProductModel product) {
    return Builder(builder: (context) {
      return Consumer<ProductProvider>(
        builder: (context, productProvider, _) {
          return GestureDetector(
            onTap: () {
              focusNode.unfocus();
              productProvider.deleteSearchHistory();
              controller.text = "";
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductPage(product: product),
                ),
              );
            },
            child: Container(
              // margin: const EdgeInsets.only(bottom: 20),
              padding: const EdgeInsets.symmetric(
                vertical: 13,
                horizontal: 15,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: cBgColor4,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          image: DecorationImage(
                            image: NetworkImage(
                              product.galleries[0].url,
                            ),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              product.name,
                              style: whiteTextStyle.copyWith(
                                fontWeight: semiBold,
                                fontSize: 16,
                              ),
                              overflow: TextOverflow.clip,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              '\$ ${product.price}',
                              style: blueTextStyle.copyWith(
                                fontSize: 14,
                              ),
                              overflow: TextOverflow.clip,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      );
    });
  }
}
