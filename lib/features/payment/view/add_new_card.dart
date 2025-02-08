import 'package:flutter/material.dart';
import 'package:food_app/core/utils/resources/color_manager.dart';
import 'package:food_app/core/utils/resources/go_router.dart';
import 'package:food_app/core/utils/shared_widgets/arrow_back_button.dart';
import 'package:food_app/core/utils/shared_widgets/custom_button.dart';
import 'package:food_app/core/utils/shared_widgets/custom_text_form_field.dart';
import 'package:food_app/features/payment/view/add_new_card_components/card_number_field.dart';
import 'package:food_app/features/payment/view_model/payment_cubit.dart';
import 'package:go_router/go_router.dart';

class AddNewCard extends StatelessWidget {
   AddNewCard({super.key, required this.totalPrice});

  final cardNameController = TextEditingController();
   final expireDateController = TextEditingController();
   final cvcCardController = TextEditingController();
  final num totalPrice;

  @override
  Widget build(BuildContext context) {
    String cardNumber = '';
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const ArrowBackButton(icon:Icons.close),
                          const SizedBox(
                            width: 15,
                          ),
                          Text(
                            'Add Card',
                            style:
                            Theme
                                .of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                              color: ColorManager.restaurantTitleColor,
                              fontSize: 17,
                            ),
                          ),
                  
                        ],
                      ),
                      const SizedBox(height: 20,),
                      Text('card holder name'.toUpperCase(),
                        style: Theme.of(context).textTheme.labelSmall!.copyWith(
                            color: ColorManager.restaurantCategoriesColor,
                            fontWeight: FontWeight.normal,
                  
                        ),
                      ),
                      const SizedBox(height: 10.0,),
                      CustomTextFormField(
                          text: 'Vishal Khadok',
                          color:  ColorManager.fillTextFieldColor,
                          type: TextInputType.name,
                          textEditingController: cardNameController),
                      const SizedBox(height: 20.0,),
                      Text('card holder name'.toUpperCase(),
                        style: Theme.of(context).textTheme.labelSmall!.copyWith(
                          color: ColorManager.restaurantCategoriesColor,
                          fontWeight: FontWeight.normal,
                  
                        ),
                      ),
                      const SizedBox(height: 10.0,),
                      CardNumberField(
                        cardNumber: (value){
                          cardNumber = value;
                      },),
                      const SizedBox(height: 30,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('expire date'.toUpperCase(),
                                  style: Theme.of(context).textTheme.labelSmall!.copyWith(
                                      color: ColorManager.restaurantCategoriesColor,
                                      fontWeight: FontWeight.normal
                  
                                  ),
                                ),
                                const SizedBox(height: 10.0,),
                                CustomTextFormField(
                                    text: 'mm/yyyy',
                                    color: ColorManager.fillTextFieldColor,
                                    type: TextInputType.datetime,
                                    textEditingController: expireDateController),
                  
                              ],
                            ),
                          ),
                          const SizedBox(width: 30,),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('cvc'.toUpperCase(),
                                  style: Theme.of(context).textTheme.labelSmall!.copyWith(
                                      color: ColorManager.restaurantCategoriesColor,
                                      fontWeight: FontWeight.normal
                  
                                  ),
                                ),
                                const SizedBox(height: 10.0,),
                                CustomTextFormField(
                                    text: '***',
                                    color: ColorManager.fillTextFieldColor,
                                    type: TextInputType.number,
                                    textEditingController: cvcCardController),
                  
                              ],
                            ),
                          )
                        ],
                      ),
                  
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30,),
              CustomButton(
                  onPressed: (){
                    if(cardNumber.isNotEmpty && cardNameController.text.isNotEmpty&& cvcCardController.text.isNotEmpty) {
                      PaymentCubit.get(context).addCard(
                          cardNumber: cardNumber,
                          cardName:cardNameController.text,
                          cvcNumber: cvcCardController.text );
                      if(PaymentCubit.get(context).cardModel.isNotEmpty){
                        GoRouter.of(context).push(AppRouter.kPaymentMethod,extra: totalPrice);
                      }
                    }

                  },
                  text: 'Add & Make Payment')
            ],
          ),
        ),
      ),
    );


  }
}






