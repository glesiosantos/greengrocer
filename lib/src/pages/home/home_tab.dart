import 'package:add_to_cart_animation/add_to_cart_animation.dart';
import 'package:add_to_cart_animation/add_to_cart_icon.dart';
import 'package:flutter/material.dart';
import 'package:greengrocer/src/config/custom_colors.dart';
import 'package:greengrocer/src/custom/custom_form_search.dart';
import 'package:greengrocer/src/custom/custom_logo_text.dart';
import 'package:greengrocer/src/custom/custom_shimmer.dart';
import 'package:greengrocer/src/pages/home/components/item_tile.dart';
import 'package:greengrocer/src/services/utils-services.dart';

import '../../shared/app_data.dart' as appData;
import 'components/category_tile.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> with AutomaticKeepAliveClientMixin {
  GlobalKey<CartIconKey> globalKeyCartItem = GlobalKey<CartIconKey>();

  late Function(GlobalKey) runAddToCardAnimationMethod;

  final utilServices = UtilsServices();

  bool isLoading = true;

  // para passar as global key
  void itemSelectedCartAnimation(GlobalKey gkImage) {
    runAddToCardAnimationMethod(gkImage);
  }

  String selectedCategory = appData.categories.first;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const CustomLogoText(
          firtText: 'Green',
          lastText: 'grocer',
          sizeText: 30,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 15, right: 15),
            child: GestureDetector(
              onTap: () {},
              child: Badge(
                backgroundColor: Colors.transparent,
                child: AddToCartIcon(
                  colorBadge: Colors.grey.shade300,
                  key: globalKeyCartItem,
                  icon: Icon(
                    Icons.shopping_cart,
                    color: CustomColors.customSwatchColor,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      body: AddToCartAnimation(
        gkCart: globalKeyCartItem,
        previewCurve: Curves.linearToEaseOut, //ease
        previewDuration: const Duration(milliseconds: 100),
        receiveCreateAddToCardAnimationMethod: (addToCardAnimationMethod) {
          // You can run the animation by addToCardAnimationMethod, just pass trough the the global key of  the image as parameter
          runAddToCardAnimationMethod = addToCardAnimationMethod;
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          child: Column(
            children: [
              const CustomFormSearch(),
              SizedBox(
                height: 40,
                child: !isLoading
                    ? ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (_, index) {
                          return CategoryTile(
                            category: appData.categories[index],
                            isSelected:
                                appData.categories[index] == selectedCategory,
                            onPress: () {
                              setState(() {
                                selectedCategory = appData.categories[index];
                              });
                            },
                          );
                        },
                        separatorBuilder: (_, index) => const SizedBox(
                          width: 10,
                        ),
                        itemCount: appData.categories.length,
                      )
                    : ListView(
                        children: [
                          CustomShimmer(
                            height: double.infinity,
                            width: 150,
                            borderRadius: BorderRadius.circular(20),
                          )
                        ],
                      ),
              ),
              Expanded(
                child: !isLoading
                    ? GridView.builder(
                        physics: const BouncingScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 10,
                                crossAxisSpacing: 10,
                                childAspectRatio: 9 / 11.5),
                        itemBuilder: (_, index) {
                          return ItemTile(
                              item: appData.items[index],
                              cartAnimationMethod: itemSelectedCartAnimation);
                        },
                        itemCount: appData.items.length,
                      )
                    : GridView.count(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        childAspectRatio: 9 / 11.5,
                        padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                        physics: const BouncingScrollPhysics(),
                        children: List.generate(
                          10,
                          (index) => CustomShimmer(
                            height: double.infinity,
                            width: double.infinity,
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
