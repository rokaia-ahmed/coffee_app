
import 'package:coffee_shop/home_page/coffee_card.dart';
import 'package:coffee_shop/home_page/special_coffee_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/category.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';

late  TabController _tabController;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {

  late CategoryModel categoryModel ;

  @override
  void initState() {
    _tabController = TabController(length: 6, vsync: this);
    super.initState();
    //_tabController.animateTo(2);
  }
  int currentIndex = 0;
  void changeCurrentIndex(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=> ProductCubit(InitialProductState())..getCategory()..getProduct(),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: ListView(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            padding: EdgeInsets.all(20.0),
            children: [
              Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                height: 620,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Color(0xff1b2027),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Icon(
                            Icons.menu,
                            size: 40,
                            color: Color(0xff4d4f52),
                          ),
                        ),
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          clipBehavior: Clip.antiAlias,
                          child: Image.asset('images/person.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Text(
                      'Find the best\ncoffee for you ',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      decoration: BoxDecoration(
                        color: Color(0xff141921),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: TextField(
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        decoration: InputDecoration(
                          hintText: 'Find your coffee ...',
                          hintStyle: TextStyle(
                            color: Colors.grey[500],
                          ),
                          hoverColor: Colors.grey,
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.search,
                            color: Colors.grey[600],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TabBar(
                      tabs: [
                        Tab(text: 'Cappuccino',),
                        Tab(text: 'Espresso',),
                        Tab(text: 'Americano',),
                        Tab(text: 'Latte',),
                        Tab(text: 'Black',),
                        Tab(text: 'Mocha',),
                      ],
                      controller: _tabController,
                      isScrollable: true,
                      labelColor: Color(0xffd17842),
                      labelStyle: TextStyle(fontWeight: FontWeight.bold),
                      unselectedLabelColor: Color(0xff3c4046),
                      indicatorColor: Color(0xffd17842),

                    ),
                    SizedBox(
                      height: 270,
                      child: TabBarView(
                        controller: _tabController ,
                        children: [
                          CoffeeCard(),
                          CoffeeCard(),
                          CoffeeCard(),
                          CoffeeCard(),
                          CoffeeCard(),
                          CoffeeCard(),
                        ],
                      ),
                    ),
                    Text('Special for you ',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                  ],
                ),
              ),
              SpecialCoffeeCard(),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
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
              icon: Icon(Icons.shopping_bag, size: 35,),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite, size: 35),
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}

