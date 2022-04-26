import 'package:bloc/bloc.dart';
import 'package:coffee_shop/login/cubit/states.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginStates>{
  LoginCubit(LoginStates initialState) : super(initialState);

  static LoginCubit get(context) => BlocProvider.of(context);

  void login({required String email , required String password}){
    final FirebaseAuth _firebaseAuth = FirebaseAuth.instance ;
    _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
    ).then((value){
      print(value.user!.email);
      emit(SuccessLoginState());
    }
    ).catchError((error){
      emit(ErrorLoginState(error.toString()));
    });

  }

}