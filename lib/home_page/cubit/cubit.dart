import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_shop/home_page/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/product_model.dart';

class ProductCubit extends Cubit<ProductStates> {
  ProductCubit(ProductStates initialState) : super(initialState);

  static ProductCubit get(context) => BlocProvider.of(context);

  FirebaseFirestore db = FirebaseFirestore.instance;
  ProductModel? productModel ;

  List<ProductModel> products = [];
  List<ProductModel>special = [];


  Future<List<ProductModel>> getProduct()async{
    emit(LoadingProductState());
    var response = db.collection('Product').doc('1');
    await response.get().then((value){
       List data = value.get('data');
       print(data);
        data.forEach((element) {
          ProductModel model = ProductModel.fromJson(element);
          products.add(model);
          if(model.special){
            special.add(model);
          }
          print('data : '+products.toString());
          emit(SuccessProductState());
        });
     }).catchError((error){
       print(error);
       emit(ErrorProductState(error.toString()));
     });
    return products;
  }

}







/*  var response = await db.collection('Product').doc('1').get();
    List data = response.get('data');
    data.forEach((element) {
      products.add(ProductModel.fromJson(data[element]));
    });   */