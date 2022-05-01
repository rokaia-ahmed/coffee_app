import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_shop/favorite/favorite.dart';
import 'package:coffee_shop/home_page/cubit/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';

import '../../bag/bag.dart';
import '../../model/product_model.dart';
import '../home_page.dart';

class ProductCubit extends Cubit<ProductStates> {
  ProductCubit(ProductStates initialState) : super(initialState);

  static ProductCubit get(context) => BlocProvider.of(context);

  FirebaseFirestore db = FirebaseFirestore.instance;
  Database? databaseBag;
  Database? databaseFav;

  //late CategoryModel categoryModel;

  //List<CategoryModel> category = [];

  // Future<List<CategoryModel>> getCategory()async{
  //   emit(LoadingCategoryState());
  //   var response = db.collection('categories').doc('2');
  //   await response.get().then((value) {
  //     List data = value.get('data');
  //    // print(data);
  //     data.forEach((element) {
  //       category.add(CategoryModel.fromJson(element));
  //       categoryModel = CategoryModel.fromJson(element);
  //     });
  //     emit(SuccessCategoryState());
  //   }).catchError((error){
  //     emit(ErrorCategoryState(error.toString()));
  //   });
  //   return category ;
  // }
  List<ProductModel> products = [];
  List<ProductModel> special = [];
  Map<String, List<ProductModel>> category = {};
  Future<List<ProductModel>> getProduct() async {
    emit(LoadingProductState());
    var response = db.collection('Product').doc('1');
    await response.get().then((value) {
      List data = value.get('data');
      // print(data);
      data.forEach((element) {
        ProductModel model = ProductModel.fromJson(element);
        if (model.special != true) {
          if (category[model.categoryId] == null)
            category[model.categoryId!] = [];
          category[model.categoryId]!.add(model);
          products.add(model);
        } else {
          special.add(model);
        }
        // print('data : '+products.toString());
        print(products);
        emit(SuccessProductState());
      });
    }).catchError((error) {
      print(error);
      emit(ErrorProductState(error.toString()));
    });
    return products;
  }

  List<Widget> screens = [
    HomePage(),
    Bag(),
    Favorite(),
  ];

  List<ProductModel> bag = [];
  List<ProductModel> favorite = [];
  void createDatabaseBag() {
    openDatabase('todo.db', version: 1, onCreate: (database, version) {
      print('database created');
      database
          .execute(
              'CREATE TABLE products(id TEXT PRIMARY KEY ,name TEXT ,ingredients TEXT,price TEXT,status TEXT , image TEXT)')
          .then((value) {
        print('table created');
      }).catchError((error) {
        print('error when created table ${error.toString()}');
      });
    }, onOpen: (database) {
      print('database opened');
    }).then((value) {
      databaseBag = value;
      getDatabaseBag();
      emit(CreateBagDatabaseState());
    });
  }

  void insertToDatabaseBag(ProductModel model) async {
    print(model.id);
    databaseBag!
        .rawInsert(
            'INSERT INTO products(name,ingredients,price,status,id , image) VALUES("${model.name}","${model.ingredients}","${model.price}","new","${model.id}" , "${model.image}")')
        .then((value) {
      bag.add(model);
      emit(InsertBagDatabaseState());
      print('added');
    }).catchError((error) {
      print(error);
    });
  }

  void getDatabaseBag() {
    databaseBag!.rawQuery('SELECT * FROM products').then((value) {
      value.forEach((element) {
        ProductModel model = ProductModel.fromJson(element);
        bag.add(model);
      });
      emit(GetBagDatabaseState());
    });
  }
  void updateDatabaseBag(
    String id,
  ) async {
    await databaseBag!
        .rawUpdate('DELETE FROM products WHERE id = "$id"')
        .then((value) {
      for (int i = 0; i < bag.length; i++) {
        if (bag[i].id == id) {
          bag.removeAt(i);
          break;
        }
      }
      emit(UpdateBagDatabaseState());
    });
  }


  void createDatabaseFavorite() {
    openDatabase('fav.db', version: 1, onCreate: (database, version) {
      print('database created');
      database
          .execute(
          'CREATE TABLE favorite(id TEXT PRIMARY KEY ,name TEXT ,ingredients TEXT,price TEXT,status TEXT , image TEXT)')
          .then((value) {
        print('table favorite created');
      }).catchError((error) {
        print('error when created table ${error.toString()}');
      });
    }, onOpen: (database) {
      print('database opened');
    }).then((value) {
      databaseFav = value;
      getDatabaseFavorite();
      emit(CreateFavoriteDatabaseState());
    });
  }

  void insertToDatabaseFavorite(ProductModel model) async {
    print(model.id);
    databaseFav!
        .rawInsert(
        'INSERT INTO favorite(name,ingredients,price,status,id , image) VALUES("${model.name}","${model.ingredients}","${model.price}","new","${model.id}" , "${model.image}")')
        .then((value) {
      favorite.add(model);
      emit(InsertFavoriteDatabaseState());
      print('added');
    }).catchError((error) {
      print(error);
    });
  }

  void getDatabaseFavorite() {
    databaseFav!.rawQuery('SELECT * FROM favorite').then((value) {
      value.forEach((element) {
        ProductModel model = ProductModel.fromJson(element);
        favorite.add(model);
      });
      emit(GetFavoriteDatabaseState());
    });
  }

  void updateDatabaseFav(
      String id,
      ) async {
    await databaseFav!
        .rawUpdate('DELETE FROM favorite WHERE id = "$id"')
        .then((value) {
      for (int i = 0; i < favorite.length; i++) {
        if (favorite[i].id == id) {
          favorite.removeAt(i);
          break;
        }
      }
      emit(UpdateFavoriteDatabaseState());
    });
  }
}
