import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/core/utils/models/card_model.dart';
import 'package:food_app/core/utils/models/ingredient_items_model.dart';
import 'package:food_app/core/utils/resources/assets_manager.dart';
import 'package:food_app/features/payment/view_model/payment_states.dart';

class PaymentCubit extends Cubit<PaymentStates> {
  PaymentCubit() :super(PaymentInitialStates());

  static PaymentCubit get(context) => BlocProvider.of(context);

  final List<ItemModel> itemModel = [
    ItemModel(icon: AssetsManager.cash, title: 'Cash'),
    ItemModel(icon: AssetsManager.visa, title: 'Visa'),
    ItemModel(icon: AssetsManager.masterCardEmpty, title: 'Master Card'),
    ItemModel(icon: AssetsManager.paypalIcon, title: 'Paypal'),

  ];

  int selectedIndex = -1;
  void selectCard(int index) {
    selectedIndex = index;
    emit(ChangeIndexSuccessStates());
  }

  late final List<CardModel> cardModel=[];

  void addCard({required String cardName,required String cardNumber,required String cvcNumber}){
    cardModel.add(CardModel(cardName: cardName, cardNumber: cardNumber,cvcNumber: cvcNumber));

    emit(AddCardSuccessState());
  }
  void initializeState() {
    isShown = false;
    emit(PaymentInitialStates());
  }
 bool isShown = false;
  void isBottomSheetShown(bool state){
    isShown = state;
    emit(ChangeBottomSheetState());
  }




}