
import 'package:flutter/material.dart';

class ChangeCoffeeSize extends StatefulWidget {
  const ChangeCoffeeSize({Key? key}) : super(key: key);
  @override
  State<ChangeCoffeeSize> createState() => _ChangeCoffeeSizeState();
}
class _ChangeCoffeeSizeState extends State<ChangeCoffeeSize> {
  bool isS = false;
  bool isM = false;
  bool isL = false;

  Color colorBorder = Color(0xffd17842);

  Color colorChar = Color(0xffd17842);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: (){
            setState(() {
              isS = true;
              isM = false;
              isL = false;
            });
          },
          child: Container(
            height :37,
            width: 100,
            child: Center(
              child: Text('S',
                style: TextStyle(
                  color: isS ? colorChar =Color(0xffd17842)  : colorChar=Color(0xff919296),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: isS ? colorBorder=Color(0xffd17842): colorBorder = Colors.black,
              ),
            ),

          ),
        ),
        InkWell(
          onTap: (){
            setState(() {
              isS = false;
              isM = true;
              isL = false;
            });
          },
          child: Container(
            height :37,
            width: 100,
            child: Center(
              child: Text('M',
                style: TextStyle(
                  color: isM ? colorChar =Color(0xffd17842)  : colorChar=Color(0xff919296) ,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: isM ? colorBorder=Color(0xffd17842): colorBorder = Colors.black,
              ),
            ),

          ),
        ),
        InkWell(
          onTap: (){
            setState(() {
              isS = false;
              isM = false;
              isL = true;
            });
          },
          child: Container(
            height :37,
            width: 100,
            child: Center(
              child: Text('L',
                style: TextStyle(
                  color: isL ?colorChar =Color(0xffd17842)  : colorChar=Color(0xff919296) ,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color:isL ? colorBorder=Color(0xffd17842): colorBorder = Colors.black,
              ),
            ),

          ),
        ),
      ],
    );
  }
}
