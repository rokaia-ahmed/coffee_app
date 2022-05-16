
import 'package:coffee_shop/Shared/cach_helper.dart';
import 'package:coffee_shop/components/components.dart';
import 'package:coffee_shop/login/cubit/states.dart';
import 'package:coffee_shop/register/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../components/text_form_feild.dart';
import '../home_page/layout.dart';
import 'cubit/cubit.dart';

class LoginScreen extends StatefulWidget {
   LoginScreen({Key? key}) : super(key: key);
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
     bool isSecure = true;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=> LoginCubit(InitialLoginState()),
      child: BlocConsumer<LoginCubit,LoginStates>(
        listener: (context,state){
          if(state is SuccessLoginState){

           CaChHelper.saveData(key: 'id', value:state.id)
               .then((value){
             Navigator.pushReplacement(context,
                 MaterialPageRoute(builder: (context)=>Layout()),
             );
           }
           );
          }else if(state is ErrorLoginState){
            showToast(text: state.error, state:ToastStates.error);
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
                          Text('login',
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
                            controller: emailController ,
                          ),
                          Spacer(
                            flex: 1,
                          ),
                          CustomTextFormField(
                            obscureText: isSecure,
                            hintText: 'enter your password',
                            controller: passwordController,
                            icon:IconButton(
                              onPressed:(){
                                setState(() {
                                  isSecure =! isSecure ;
                                });
                              } ,
                              icon: Icon(
                                (isSecure)?  Icons.visibility_off : Icons.visibility,
                                  color: Colors.white,
                              ),
                            ) ,
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
                                      email: emailController.text,
                                      password: passwordController.text,
                                  );

                                }
                              },
                              minWidth: double.infinity,
                              height: 60.0,
                              child:Text('login',
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
                              TextButton(onPressed: (){
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context)=> RegisterScreen()),
                                );
                              }, child: Text('register now ',
                                style: TextStyle(
                                  color: Color(0xffd17842),
                                ),
                              ),
                              ),
                            ],
                          ),
                          if(state is LoadingLoginState)
                          Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
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
