import 'package:coffee_shop/register/cubit/states.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterCubit extends Cubit<RegisterStates>{
  RegisterCubit(RegisterStates initialState) : super(initialState);

  static RegisterCubit get(context) => BlocProvider.of(context);

  void register({required String email , required String password}){
    final FirebaseAuth _firebaseAuth = FirebaseAuth.instance ;
    _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    ).then((value){
      print(value.user!.email);
      emit(SuccessRegisterState(value.user!.uid));
    }
    ).catchError((error){
      emit(ErrorRegisterState(error.toString()));
    });

  }

}