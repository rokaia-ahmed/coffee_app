
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Shared/cach_helper.dart';
import '../components/components.dart';
import '../components/text_form_feild.dart';
import '../login/login_screen.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({Key? key}) : super(key: key);
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=> RegisterCubit(InitialRegisterState()),
      child: BlocConsumer<RegisterCubit,RegisterStates>(
        listener: (context,state){
          if(state is SuccessRegisterState){
            CaChHelper.saveData(key: 'id', value:state.id)
                .then((value){
              Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context)=>LoginScreen()),
              );
            }
            );
          }else if(state is ErrorRegisterState){
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
                          Text('register',
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
                            hintText: 'enter your password',
                            controller: passwordController,
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
                                  RegisterCubit.get(context).register(
                                    email: emailController.text,
                                    password: passwordController.text,
                                  );

                                }
                              },
                              minWidth: double.infinity,
                              height: 60.0,
                              child:Text('register',
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
                              Text('do you have an account ? ',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              TextButton(onPressed: (){
                                Navigator.push(context,
                                  MaterialPageRoute(builder:(context)=>LoginScreen()),
                                );
                              }, child: Text('login now ',
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
