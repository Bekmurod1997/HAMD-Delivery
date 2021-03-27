import 'package:HAMD/ObxHelper/item_category_controller.dart';
import 'package:HAMD/ObxHelper/product_by_category.dart';
import 'package:HAMD/constants/colors.dart';
import 'package:HAMD/constants/fonts.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryButtons extends StatefulWidget {
  int selectedCategory;
  CategoryButtons({@required this.selectedCategory});
  @override
  _CategoryButtonsState createState() => _CategoryButtonsState();
}

class _CategoryButtonsState extends State<CategoryButtons> {
  final CategoryItemController categoryData =
      Get.find<CategoryItemController>();
  final ProductByCategoryController productByCategoryController =
      Get.find<ProductByCategoryController>();
  int buttonIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 25),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Наше меню',
              style: FontStyles.mediumStyle(
                fontSize: 18,
                fontFamily: 'Poppins', //looked really strange with this style
                color: Color(0xff222E54),
              ),
            ),
          ),
        ),
        SizedBox(height: 25),
        Container(
          height: 50,
          width: double.infinity,
          child: Obx(() {
            if (categoryData.isLoading.value) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return ListView.separated(
                itemCount: categoryData.categoryList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Padding(
                  padding: index == 0
                      ? EdgeInsets.only(left: 25)
                      : EdgeInsets.only(left: 13),
                  child: RaisedButton(
                    elevation: 0,
                    color: buttonIndex == index
                        ? ColorPalatte.strongRedColor
                        : Colors.white,
                    onPressed: () {
                      print(index);
                      setState(() {
                        buttonIndex = index;
                        print('after setState');
                        widget.selectedCategory =
                            categoryData.categoryList[index].id;
                        print(widget.selectedCategory);
                        print('id');
                        print(categoryData.categoryList[index].id);
                        productByCategoryController
                            .fetchProductByCategory(widget.selectedCategory);
                      });

                      // toTest();
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    child: Text(
                      categoryData.categoryList[index].name,
                      style: FontStyles.mediumStyle(
                        fontSize: 12,
                        fontFamily: 'Poppins',
                        color: buttonIndex == index
                            ? Colors.white
                            : Color(0xff222E54),
                      ),
                    ),
                  ),
                ),
                separatorBuilder: (context, index) => SizedBox(width: 0),
              );
            }
          }),
        ),
      ],
    );
  }
}
