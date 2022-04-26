
import 'package:coffee_shop/login/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../components/text_form_feild.dart';
import '../home_page/home_page.dart';
import 'cubit/cubit.dart';

class LoginScreen extends StatefulWidget {
   LoginScreen({Key? key}) : super(key: key);
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    var email = TextEditingController();
    var password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=> LoginCubit(InitialLoginState()),
      child: BlocConsumer<LoginCubit,LoginStates>(
        listener: (context,state){
          if(state is SuccessLoginState){
            Navigator.push(context,
              MaterialPageRoute(builder:(context)=>HomePage()),
            );
          }else if(state is ErrorLoginState){
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.error),
              backgroundColor: Colors.red,
            ));

          }
        },
        builder:(context,state){
          return  Scaffold(
            backgroundColor: Colors.black,
            body:SafeArea(
              child: Stack(
                children: [
              Container(
              decoration: BoxDecoration(
              image: DecorationImage(
                opacity: 100,
                fit: BoxFit.fill,
                image: AssetImage(
                  'images/Cappuccino3.jpg',
                ),
              ),
            ),
              ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Form(
                      key: formKey ,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Spacer(
                            flex: 1,
                          ),
                          Text('Login',
                            style:TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),

                          ),
                          Spacer(
                            flex: 3,
                          ),
                          CustomTextFormField(
                            hintText: 'enter your email',
                            controller: email ,
                          ),
                          Spacer(
                            flex: 1,
                          ),
                          CustomTextFormField(
                            hintText: 'enter your password',
                            controller: password,
                          ),
                          Spacer(
                            flex: 1,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color:Color(0xffd17842) ,
                                borderRadius: BorderRadius.circular(20.0)
                            ),
                            child: MaterialButton(
                              onPressed: (){
                                if(formKey.currentState!.validate()){
                                  LoginCubit.get(context).login(
                                      email: email.text,
                                      password: password.text,
                                  );

                                }
                              },
                              minWidth: double.infinity,
                              height: 60.0,
                              child:Text('Login',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Text('don\'t have an account ? ',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              TextButton(onPressed: (){}, child: Text('register now ',
                                style: TextStyle(
                                  color: Color(0xffd17842),
                                ),
                              ),
                              ),
                            ],
                          ),
                          Spacer(
                            flex: 8,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ) ,
          );
        },
      ),
    );
  }
}
