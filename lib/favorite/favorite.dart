

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../home_page/cubit/cubit.dart';
import '../home_page/cubit/states.dart';

class Favorite extends StatelessWidget {
  const Favorite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductCubit,ProductStates>(
      listener:(context,state){} ,
      builder: (context,state){
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              child: Text('Favorite',
                style:TextStyle(
                  color: Colors.white,
                ) ,
              ),
            ),
          ),
        );
      },

    );
  }
}
