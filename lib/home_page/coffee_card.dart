
import 'package:buildcondition/buildcondition.dart';
import 'package:coffee_shop/home_page/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../model/product_model.dart';
import 'coffee_details_page.dart';
import 'cubit/cubit.dart';

class CoffeeCard extends StatefulWidget {

  @override
  State<CoffeeCard> createState() => _CoffeeCardState();
}

class _CoffeeCardState extends State<CoffeeCard> with TickerProviderStateMixin  {
final List <String> images=[
  'images/Cappuccino1.jpg',
  'images/Cappuccino2.jpg',
  'images/Cappuccino3.jpg',
  'images/Cappuccino4.jpg',
];

final List <String> ingredients=[
  'with oat milk',
  'with cinnamon power',
  'with chocolate power',
  'with caramel drizzle',
];

final List <String> price =[
  '4.00','5.00','6.00','7.00'
];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductCubit,ProductStates>(
      listener: (context,states){},
      builder:(context,states){
        return Flexible(
          child: InkWell(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            onTap: (){
              Navigator.push(context,
                MaterialPageRoute(builder:(context)=>CoffeeDetailsPage()),
              );
            },
            child: BuildCondition(
              condition:(ProductCubit.get(context).products.length>0 ) ,
              builder: (context){
                return TabBarView(
                 // controller:TabController(length: 6, vsync: this) ,
                    children: [
                      ListView.separated(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: ProductCubit.get(context).products.length,
                          separatorBuilder: (context,index)=>SizedBox(width: 20,),
                          itemBuilder:(context,index){
                            ProductModel model = ProductCubit.get(context).products[index];
                            return Container(
                              height: 250,
                              width: 160,
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Container(
                                    height: 135,
                                    width: 140,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      image: DecorationImage(
                                          image: NetworkImage(model.image),
                                          fit: BoxFit.cover
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(15),
                                    child: Column(
                                      children: [
                                        Text(model.name,style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                        ),),
                                        SizedBox(
                                          height: 3,
                                        ),
                                        Text(model.ingredients,
                                          style: TextStyle(
                                            color: Color(0xff919293),
                                            fontSize: 13,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          children: [
                                            Text(r'$',style: TextStyle(
                                              color: Color(0xffd17842),
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            ),
                                            Text('${model.price}',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Spacer(),
                                            InkWell(
                                              onTap: (){},
                                              child: Container(
                                                height: 30,
                                                width: 30,
                                                decoration: BoxDecoration(
                                                  color: Color(0xffd17842),
                                                  borderRadius: BorderRadius.circular(10),
                                                ),
                                                child: Icon(Icons.add,size: 20,color: Colors.white,),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              decoration: BoxDecoration(
                                color: Color(0xff242931),
                                borderRadius: BorderRadius.circular(20),
                              ),
                            );
                          }
                      ),
                    ],
                );
              },
             fallback:(context)=> Center(child:CircularProgressIndicator()) ,
            ),
          ),
        );
      } ,
    );
  }
}
