import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_shop/model/user.dart';
import 'package:coffee_shop/register/cubit/states.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterCubit extends Cubit<RegisterStates>{
  RegisterCubit(RegisterStates initialState) : super(initialState);

  static RegisterCubit get(context) => BlocProvider.of(context);


  void register({required String email , required String password,
    required String name , required phone}
      ){
    emit(LoadingRegisterState());
    final FirebaseAuth _firebaseAuth = FirebaseAuth.instance ;
    _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    ).then((value){
      createUser(
        id:value.user!.uid ,
        name:name ,
        phone:phone ,
        email:email ,
      );
      print(value.user!.email);
      emit(SuccessRegisterState(value.user!.uid));
    }
    ).catchError((error){
      emit(ErrorRegisterState(error.toString()));
    });

  }

  void createUser({
   required name,
    required email,
    required id ,
    required phone ,
}){
    UserModel model = UserModel(
      id:id ,
      name:name ,
      phone: phone,
      email:email ,
      image: '',
    );
    emit(LoadingCreateUserState());
   FirebaseFirestore.instance.collection('users').doc(id).set(model.toMap())
       .then((value){
       emit(SuccessCreateUserState());
   }).catchError((error){
     emit(ErrorCreateUserState(error.toString()));
   });
  }

}