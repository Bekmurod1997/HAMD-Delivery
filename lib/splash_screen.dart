import 'package:HAMD/ui/home/home_screen.dart';
import 'package:flutter/cupertino.dart';

import 'package:HAMD/services/repository_user.dart';
import 'package:HAMD/services/repository_category.dart';
import 'package:HAMD/services/repository_products.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  UserRepository userRepository = UserRepository();
  CategoryRepository categoryR = CategoryRepository();
  ProductsRepository productsRepository = ProductsRepository();
  @override
  void initState() {
    print('this is initsate in splash screen');
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(_callApi);
  }

  _gotToNextPage() {
    Navigator.of(context).pushReplacement(
      CupertinoPageRoute(
        builder: (_) => HomeScreen(),
      ),
    );
  }

  _callApi(_) {
    userRepository.fetchUserInfo(context);
    categoryR.fetchCategoryInfo(context);
    productsRepository.fetchAllProducts(context);
    _gotToNextPage();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
