
import 'package:flutter/material.dart';

import 'cubit/cubit.dart';

class ChangeCoffeeSize extends StatefulWidget {
  const ChangeCoffeeSize({Key? key}) : super(key: key);
  @override
  State<ChangeCoffeeSize> createState() => _ChangeCoffeeSizeState();
}
class _ChangeCoffeeSizeState extends State<ChangeCoffeeSize> {

  Color colorBorder = Color(0xffd17842);

  Color colorChar = Color(0xffd17842);
  @override
  Widget build(BuildContext context) {
    ProductCubit cubit = ProductCubit.get(context) ;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: (){
            cubit.price(isS:true, isM: false, isL: false);
          },
          child: Container(
            height :37,
            width: 100,
            child: Center(
              child: Text('S',
                style: TextStyle(
                  color: cubit.isS ? colorChar =Color(0xffd17842)  : colorChar=Color(0xff919296),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color:cubit.isS ? colorBorder=Color(0xffd17842): colorBorder = Colors.black,
              ),
            ),

          ),
        ),
        InkWell(
          onTap: (){
            cubit.price(isS:false, isM:true, isL: false);
          },
          child: Container(
            height :37,
            width: 100,
            child: Center(
              child: Text('M',
                style: TextStyle(
                  color: cubit.isM ? colorChar =Color(0xffd17842)  : colorChar=Color(0xff919296) ,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: cubit.isM ? colorBorder=Color(0xffd17842): colorBorder = Colors.black,
              ),
            ),

          ),
        ),
        InkWell(
          onTap: (){
            cubit.price(isS:false, isM: false, isL: true);
          },
          child: Container(
            height :37,
            width: 100,
            child: Center(
              child: Text('L',
                style: TextStyle(
                  color:cubit.isL ?colorChar =Color(0xffd17842)  : colorChar=Color(0xff919296) ,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color:cubit.isL ? colorBorder=Color(0xffd17842): colorBorder = Colors.black,
              ),
            ),

          ),
        ),
      ],
    );
  }
}
