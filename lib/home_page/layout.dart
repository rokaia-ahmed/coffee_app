import 'package:coffee_shop/home_page/cubit/cubit.dart';
import 'package:coffee_shop/home_page/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Layout extends StatefulWidget {
  const Layout({Key? key}) : super(key: key);

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {


  int currentIndex = 0;
  void changeCurrentIndex(int index) {
    setState(() {
      currentIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductCubit(InitialProductState())..getProduct()..createDatabase(),
      child: BlocConsumer<ProductCubit,ProductStates>(
        listener: (context,state){},
        builder: (context,state){
          return Scaffold(
            backgroundColor: Colors.black,
            body:ProductCubit.get(context).screens[currentIndex],
            bottomNavigationBar:BottomNavigationBar(
              backgroundColor: Colors.black,
              selectedItemColor: Color(0xffd17842),
              unselectedItemColor: Color(0xff2d4f52),
              showUnselectedLabels: false,
              showSelectedLabels: false,
              currentIndex: currentIndex,
              onTap: changeCurrentIndex,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home, size: 35),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.shopping_bag,
                    size: 35,
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.favorite, size: 35),
                  label: '',
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
