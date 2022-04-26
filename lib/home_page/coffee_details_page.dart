
import 'dart:ui';
import 'package:coffee_shop/model/product_model.dart';
import 'package:flutter/material.dart';

import 'change_Size_coffee.dart';
class CoffeeDetailsPage  extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
            child: SingleChildScrollView(
              child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 440,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: AssetImage('images/Cappuccino3.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 20,
                      left: 20,
                      child: Container(
                        width: 45,
                        height: 45,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              Icons.arrow_back_ios,
                              color: Colors.grey[700],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 20,
                      right: 20,
                      child: Container(
                        width: 45,
                        height: 45,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.favorite,
                            color: Colors.grey[700],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 320.0,
                      child: ClipRect(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(
                            sigmaX: 10.0,
                            sigmaY: 10.0,
                          ),
                          child: Container(
                            width: 377,
                            height: 140,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade900.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Cappuccino',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10.0,
                                      ),
                                      Text(
                                        'with oct milk',
                                        style: TextStyle(
                                          color: Color(0xff919292),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 15.0,
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.star,
                                            color: Color(0xffd17842),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            '4.5',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 8.0,
                                          ),
                                          Text(
                                            '(6.893)',
                                            style: TextStyle(
                                              color: Color(0xff919296),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            width: 42,
                                            height: 42,
                                            decoration: BoxDecoration(
                                              color: Colors.black,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Image.asset(
                                                  'images/coffee-beans.png',
                                                  height: 17,
                                                  width: 17,
                                                  color: Color(0xffd17842),
                                                ),
                                                SizedBox(
                                                  height: 4,
                                                ),
                                                Text(
                                                  'coffee',
                                                  style: TextStyle(
                                                    color: Color(0xff919296),
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            width: 15,
                                          ),
                                          Container(
                                            width: 42,
                                            height: 42,
                                            decoration: BoxDecoration(
                                              color: Colors.black,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Image.asset(
                                                  'images/water-drop-icon.png',
                                                  height: 17,
                                                  width: 17,
                                                  color: Color(0xffd17842),
                                                ),
                                                SizedBox(
                                                  height: 4,
                                                ),
                                                Text(
                                                  'milk',
                                                  style: TextStyle(
                                                    color: Color(0xff919296),
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10.0,
                                      ),
                                      Container(
                                        width: 150,
                                        height: 42,
                                        decoration: BoxDecoration(
                                          color: Colors.black,
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'Medium Roasted',
                                            style: TextStyle(
                                              color: Color(0xff919296),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Description',
                        style: TextStyle(
                          color: Color(0xff919296),
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'A cappuccino is a coffee based drink made primary from espresso and milk....',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Size',
                        style: TextStyle(
                          color: Color(0xff919296),
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      ChangeCoffeeSize(),
                      SizedBox(
                        height: 27,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text('Price',
                              style: TextStyle(
                                color: Color(0xff919296),
                                fontWeight: FontWeight.bold,
                              ),
                              ),
                              SizedBox(height: 10,),
                              Row(
                                children: [
                                  Text(r'$',
                                    style: TextStyle(
                                      color: Color(0xffd17842),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 21,
                                    ),
                                  ),
                                  Text('4.20',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 21,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          InkWell(
                            onTap:(){} ,
                            highlightColor: Colors.transparent,
                            splashColor:Colors.transparent ,
                            child: Container(
                              height: 50,
                              width:220 ,
                              decoration: BoxDecoration(
                                color: Color(0xffd17842),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child:Center(
                                child: Text('Buy Now',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                                ),
                              ) ,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
          ),
            ),
        ),
      ),
     );
  }
}

