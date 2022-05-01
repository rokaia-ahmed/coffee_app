import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../home_page/coffee_details_page.dart';
import '../home_page/cubit/cubit.dart';
import '../home_page/cubit/states.dart';
import '../model/product_model.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: BlocBuilder<ProductCubit, ProductStates>(
        builder: (context, state) {
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Hero(
                          tag: 'search_bar',
                          child: Card(
                            color: Colors.transparent,
                            margin: const EdgeInsets.all(0),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                color: Color(0xff141921),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: TextField(
                                autofocus: true,
                                onChanged: (text) {
                                  ProductCubit.get(context).search(text);
                                },
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
                                  prefixIcon: Icon(
                                    Icons.search,
                                    color: Colors.grey[600],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 5),
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            'Cancel',
                            style: TextStyle(
                              color: Color(0xffd17842),
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                    ],
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: ListView.separated(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        separatorBuilder: (context, index) => SizedBox(
                          height: 15,
                        ),
                        itemCount:
                            ProductCubit.get(context).searchProduct.length,
                        itemBuilder: (context, index) {
                          ProductModel model =
                              ProductCubit.get(context).searchProduct[index];
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        CoffeeDetailsPage(model)),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                                  .insertToDatabaseBag(model);
                                            },
                                            child: Container(
                                              height: 30,
                                              width: 30,
                                              decoration: BoxDecoration(
                                                color: Color(0xffd17842),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Icon(
                                                Icons.add,
                                                size: 20,
                                                color: Colors.white,
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
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
