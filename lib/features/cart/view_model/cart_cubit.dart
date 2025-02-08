import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/core/utils/models/cart_model.dart';
import 'package:food_app/core/utils/models/ingredient_items_model.dart';
import 'package:food_app/core/utils/models/restaurant_model.dart';
import 'package:food_app/core/utils/resources/assets_manager.dart';
import 'package:food_app/core/utils/resources/cache_helper.dart';
import 'package:food_app/core/utils/resources/color_manager.dart';
import 'package:food_app/core/utils/resources/constants.dart';
import 'package:food_app/features/cart/view_model/cart_states.dart';

class CartCubit extends Cubit<CartStates> {
  CartCubit() : super(CartInitialStates());

  static CartCubit get(context) => BlocProvider.of(context);

  int amount = 1;

  void resetAmount() {
    amount = 1;
    emit(ChangeAmountSuccessState());
  }

  void increment(int value) {
    amount++;
    changePrice(value);
    emit(ChangeAmountSuccessState());
  }

  void decrement(int value) {
    amount > 1 ? amount-- : amount;
    changePrice(value);
    emit(ChangeAmountSuccessState());
  }

  late int price;

  void setInitialPrice(int initialPrice) {
    price = initialPrice;
    emit(SetPriceSuccessState());
  }

  void changePrice(int value) {
    price = value * amount;
    emit(ChangePriceSuccessState());
  }

  final List<String> foodSize = ['10”', '14”', '16”'];

  final List<String> itemSize = ['\$', '\$\$', '\$\$\$'];

  final List<String> time = ['10-15 min', '20 min', '30 min'];

  int ratingIndex = -1;

  void selectRating(int index) {
    ratingIndex = index;
    emit(ChangeRatingSuccessStates());
  }

  Icon changeIcon(index) {
    if (ratingIndex == index || index < ratingIndex) {
      return const Icon(
        Icons.star,
        color: ColorManager.primaryColor,
      );
    } else {
      return const Icon(
        Icons.star_border,
        color: ColorManager.fillTextFieldColor,
      );
    }
  }

  int selectedIndex = 1;

  void selectFoodSize(int index) {
    selectedIndex = index;
    emit(ChangeFoodSizeSuccessStates());
  }

  int deliverTimeIndex = 1;

  void selectDeliverTime(int index) {
    deliverTimeIndex = index;
    emit(ChangeDeliverTimeSuccessStates());
  }

  late String selectedValue;

  void changeDropDownItem(String value) {
    selectedValue = value;
    _updatePopularItems(value);
    emit(ChangeDropDownItemStates());
  }

  late List<RestaurantModel> popularItems;

  void _updatePopularItems(String value) {
    popularItems = [
      RestaurantModel(
          restaurantName: '$value Bistro',
          restaurantCategories: 'Rose garden',
          price: 40),
      RestaurantModel(
          restaurantName: 'Smokin\'$value',
          restaurantCategories: 'Caffeine Restaurant',
          price: 60),
      RestaurantModel(
          restaurantName: 'Buffalo $value',
          restaurantCategories: 'Kaji Firm Kitchen',
          price: 75),
      RestaurantModel(
          restaurantName: 'Bullseye $value',
          restaurantCategories: 'Kebab restaurant',
          price: 94),
    ];
    emit(UpdatePopularItemsStates());
  }

  List<ItemModel> inGradientItems = [
    ItemModel(icon: AssetsManager.ingredient1, title: 'Salt'),
    ItemModel(icon: AssetsManager.ingredient2, title: 'Chicken'),
    ItemModel(icon: AssetsManager.ingredient3, title: 'onion'),
    ItemModel(icon: AssetsManager.ingredient4, title: 'Garlic'),
    ItemModel(icon: AssetsManager.ingredient5, title: 'Pappers'),
    ItemModel(icon: AssetsManager.ingredient6, title: 'Ginger'),
    ItemModel(icon: AssetsManager.ingredient7, title: 'Broccoli'),
    ItemModel(icon: AssetsManager.ingredient8, title: 'Orange'),
    ItemModel(icon: AssetsManager.ingredient9, title: 'Walnut'),
  ];

  late List<CartModel> cartItems = [];

  late num totalPrice = 0.0;

  Future<void> getCartItems() async {
    uId = CacheHelper.getData(key: 'uId');
    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .collection('cart').get().then((value){
      cartItems = [];
      totalPrice = 0.0;
      for (var element in value.docs) {
        cartItems.add(CartModel.fromJson(element.data()));
        totalPrice += element.data()['price'];
      }

      emit(GetCartItemsSuccessStates());

    }).catchError((error){
      emit(GetCartItemsErrorStates());
    });

  }


  Future<void> addCartItems({
    required RestaurantModel restaurantModel,
    required int price,
    required String size,
    required String amount,
  }) async {
    CartModel cartModel = CartModel(
      restaurantName: restaurantModel.restaurantName,
      restaurantCategories: restaurantModel.restaurantCategories,
      price: price,
      size: size,
      amount: amount
    );
    uId = CacheHelper.getData(key: 'uId');
    FirebaseFirestore.instance.collection('users')
        .doc(uId)
        .collection('cart')
        .where('restaurantName', isEqualTo: restaurantModel.restaurantName)
        .get()
        .then((querySnapshot) {
      if (querySnapshot.docs.isNotEmpty) {
        querySnapshot.docs.first.reference.update(cartModel.toMap()!)
            .then((value) async {

          await getCartItems();
          emit(UpdateCartItemsSuccessStates());
        }).catchError((error) {
          emit(UpdateCartItemsErrorStates());
        });
      }
      else {
        FirebaseFirestore.instance.collection('users')
            .doc(uId)
            .collection('cart')
            .add(cartModel.toMap()!)
            .then((value) async {
          await getCartItems();
          emit(UpdateCartItemsSuccessStates());
        }).catchError((error) {
          emit(UpdateCartItemsErrorStates());
        });
      }
    }).catchError((error) {
      emit(UpdateCartItemsErrorStates());
    });
  }

}
