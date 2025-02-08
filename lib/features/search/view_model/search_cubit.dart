import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/core/utils/models/restaurant_model.dart';
import 'package:food_app/core/utils/models/suggested_restaurant.dart';
import 'package:food_app/features/search/view_model/search_states.dart';

class SearchCubit extends Cubit<SearchStates> {
  SearchCubit() : super(SearchInitialStates());

  static SearchCubit get(context) => BlocProvider.of(context);


  final List<String> items = ['Burger', 'Sandwich', 'Pizza', 'Sea food'];

  final List<SuggestedRestaurantModel> suggestedRestaurant = [
    SuggestedRestaurantModel(restaurantName: 'Pansi Restaurant', rate: '4.7'),
    SuggestedRestaurantModel(
        restaurantName: 'American Spicy Burger Shop', rate: '4.3'),
    SuggestedRestaurantModel(
        restaurantName: 'Cafenio Coffee Club', rate: '4.0'),
    SuggestedRestaurantModel(
        restaurantName: 'rose garden restaurant', rate: '4.7'),
    SuggestedRestaurantModel(
        restaurantName: 'Buffalo Burger restaurant', rate: '4.3'),
    SuggestedRestaurantModel(restaurantName: 'Point Coffee Club', rate: '4.0'),
  ];

  final List<RestaurantModel> popularFastFood = [
    RestaurantModel(
        restaurantName: 'European Pizza',
        restaurantCategories: 'Uttora Coffe House'),
    RestaurantModel(
        restaurantName: 'Buffalo Pizza.',
        restaurantCategories: 'Cafenio Coffee Club'),
  ];


  late List<SuggestedRestaurantModel> searchResult = [];

  void updateSearchResult(String searchText) {
    searchResult = suggestedRestaurant.where((element) {
      return element.restaurantName.toLowerCase().contains(searchText);
    }).toList();
    emit(UpdateSearchResultStates());
  }


}
