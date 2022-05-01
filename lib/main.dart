
import 'package:coffee_shop/login/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Shared/cach_helper.dart';
import 'home_page/cubit/cubit.dart';
import 'home_page/cubit/states.dart';
import 'home_page/layout.dart';


String id = '' ;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await CaChHelper.init();

  id = CaChHelper.getData(key: 'id')??'';
  Widget? widget ;

  if(id.isNotEmpty){
    widget = Layout();
  }else{
    widget = LoginScreen();
  }

  runApp(MyApp(
      startPage :widget ,
  ));
}


class MyApp extends StatelessWidget {
  final  Widget? startPage ;
  MyApp({
    required this.startPage ,
}) ;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
     create:(context) => ProductCubit(InitialProductState())..getProduct()..createDatabaseBag()..createDatabaseFavorite() ,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home:startPage,
      ),
    );
  }
}

