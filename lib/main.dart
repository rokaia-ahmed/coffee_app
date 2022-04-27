
import 'package:coffee_shop/home_page/home_page.dart';
import 'package:coffee_shop/login/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'Shared/cach_helper.dart';


String id = '' ;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await CaChHelper.init();

  id = CaChHelper.getData(key: 'id')??'';
  Widget? widget ;

  if(id.isNotEmpty){
    widget = HomePage();
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home:startPage,
    );
  }
}

