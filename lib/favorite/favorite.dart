

import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../home_page/coffee_details_page.dart';
import '../home_page/cubit/cubit.dart';
import '../home_page/cubit/states.dart';
import '../model/product_model.dart';

class Favorite extends StatelessWidget {
  const Favorite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductCubit,ProductStates>(
      listener:(context,state){} ,
      builder: (context,state){
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: BuildCondition(
              condition: (ProductCubit.get(context).favorite.isNotEmpty),
              builder: (context) {
                return ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  separatorBuilder: (context, index) => SizedBox(
                    height: 15,
                  ),
                  itemCount: ProductCubit.get(context).favorite.length,
                  itemBuilder: (context, index) {
                    ProductModel model = ProductCubit.get(context).favorite[index];
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CoffeeDetailsPage(model)),
                        );
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 140,
                        decoration: BoxDecoration(
                          color: Color(0xff141921),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 10.0,
                            ),
                            Container(
                              width: 150,
                              height: 120,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.0),
                                image: DecorationImage(
                                    image: NetworkImage(model.image!),
                                    fit: BoxFit.cover),
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  model.name!,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  textScaleFactor: 0.9,
                                ),
                                SizedBox(
                                  height: 6.0,
                                ),
                                Text(
                                  model.ingredients!,
                                  style: TextStyle(
                                    color: Color(0xff919293),
                                    fontSize: 12,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  textScaleFactor: 0.8,
                                ),
                                SizedBox(
                                  height: 8.0,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      r'$',
                                      style: TextStyle(
                                        color: Color(0xffd17842),
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      model.price!,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 60,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        ProductCubit.get(context)
                                            .updateDatabaseFav(model.id!);
                                      },
                                      child: Container(
                                        height: 30,
                                        width: 30,
                                        decoration: BoxDecoration(
                                          color: Color(0xffd17842),
                                          borderRadius:
                                          BorderRadius.circular(10),
                                        ),
                                        child: Padding(
                                          padding:
                                          const EdgeInsets.only(bottom: 20),
                                          child: Icon(
                                            Icons.minimize,
                                            size: 20,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              fallback: (context) => Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('add your favorite coffee ',
                        style: TextStyle(
                          color:Colors.white ,
                          fontSize: 25.0,
                        ),
                      ),
                      Icon(Icons.favorite,
                        color: Color(0xffd17842)  ,
                        size: 80,
                      ),
                    ],
                  )
              ),
            ),
          ),
        );
      },

    );
  }
}
