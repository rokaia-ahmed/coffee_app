import 'package:buildcondition/buildcondition.dart';
import 'package:coffee_shop/home_page/cubit/cubit.dart';
import 'package:coffee_shop/home_page/cubit/states.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../login/login_screen.dart';
import '../model/user.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductCubit, ProductStates>(
      listener: (context, state) {
        print(state);
      },
      builder: (context, state) {
        UserModel? model = ProductCubit.get(context).model;
        return Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            backgroundColor: Colors.black,
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: BuildCondition(
                condition: (model != null),
                builder: (context) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: Center(
                        child: CircleAvatar(
                          child: Center(
                            child: CircleAvatar(
                              radius: 88,
                              backgroundColor: Colors.transparent,
                              child: Image.asset(
                                'images/default.png',
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          backgroundColor: Colors.white,
                          radius: 90,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Name',
                      style: TextStyle(
                        color: Color(0xffd17842),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.all(15),
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Color(0xff4d4f52),
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: Text(
                        model!.name,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      ' Email',
                      style: TextStyle(
                        color: Color(0xffd17842),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.all(15),
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Color(0xff4d4f52),
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: Text(
                        model.email,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      ' Phone',
                      style: TextStyle(
                        color: Color(0xffd17842),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.all(15),
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Color(0xff4d4f52),
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: Text(
                        model.phone,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    InkWell(
                      onTap: () async {
                        await FirebaseAuth.instance.signOut().then((value) {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()),
                              (route) => false);
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(15),
                        width: double.infinity,
                        height: 55,
                        decoration: BoxDecoration(
                          //ffc107
                          color: Color(0xffd17842),
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: Center(
                          child: Text(
                            'Logout',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                fallback: (context) =>
                    Center(child: CircularProgressIndicator()),
              ),
            ),
          ),
        );
      },
    );
  }
}
