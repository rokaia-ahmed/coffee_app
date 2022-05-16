import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {

  CustomTextFormField({this.onChange, required  this.hintText,
  this.obscureText= false,this.controller,this.icon});

final Function (String) ? onChange ;
final String ? hintText;
final bool? obscureText;
final Widget? icon ;
final TextEditingController? controller ;

  @override
  Widget build(BuildContext context) {
        return TextFormField(
          controller: controller ,
         style: TextStyle(
           color: Colors.white,
         ),
         obscureText: obscureText!,
          validator: (data){
          if(data!.isEmpty){
          return 'field is required';
           }
          return null ;
        },
          onChanged:onChange ,
          decoration: InputDecoration(
          suffixIcon: icon,
          enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(20.0),
    borderSide: BorderSide(
    color:Color(0xffd17842),
    ),
    ) ,
          focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(20.0),
    borderSide: BorderSide(
    color: Color(0xffd17842),
    ),
    ),
          border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          ),
           filled: true,
           fillColor:Colors.black,
          hintText: hintText,
           hintStyle: const TextStyle(
           color: Colors.white,
            fontSize: 15,
        ),

),
);
  }
}
