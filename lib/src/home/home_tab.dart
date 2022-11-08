import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:greengrocer/src/config/custom_colors.dart';
import 'package:greengrocer/src/custom/custom_form_search.dart';
import 'package:greengrocer/src/custom/custom_logo_text.dart';

import 'components/category_tile.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  List<String> categories = [
    'Frutas',
    'Legumes',
    'Verduras',
    'Tempero',
    'Cereais'
  ];

  String selectedCategory = 'Frutas';

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
                badgeColor: CustomColors.customContrastColor,
                badgeContent: const Text(
                  '2',
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
                child: Icon(
                  Icons.shopping_cart,
                  color: CustomColors.customSwatchColor,
                ),
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            const CustomFormSearch(),
            SizedBox(
              height: 40,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, index) {
                  return CategoryTile(
                    category: categories[index],
                    isSelected: categories[index] == selectedCategory,
                    onPress: () {
                      setState(() {
                        selectedCategory = categories[index];
                      });
                    },
                  );
                },
                separatorBuilder: (_, index) => const SizedBox(
                  width: 10,
                ),
                itemCount: categories.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
