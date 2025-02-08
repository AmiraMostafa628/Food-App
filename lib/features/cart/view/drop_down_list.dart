import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/core/utils/resources/color_manager.dart';
import 'package:food_app/features/cart/view_model/cart_cubit.dart';
import 'package:food_app/features/cart/view_model/cart_states.dart';
import 'package:food_app/features/search/view_model/search_cubit.dart';


class DropDownList extends StatelessWidget {
  const DropDownList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit,CartStates>(
        builder: (BuildContext context,state){
          return DropdownButtonHideUnderline(
            child: IntrinsicHeight(
              child: DropdownButton2<String>(
                value: CartCubit.get(context).selectedValue,
                onChanged: (value){
                  CartCubit.get(context).changeDropDownItem(value!);
                },

                items: SearchCubit.get(context).items.map((item){
                  return DropdownMenuItem<String>(
                    value: item,
                    child: Text(
                      item.toUpperCase(),
                      style:Theme.of(context).textTheme.labelSmall!.copyWith(
                        color: ColorManager.restaurantTitleColor,
                        fontSize: 12,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  );
                }).toList(),
                selectedItemBuilder: (BuildContext context){
                  return SearchCubit.get(context).items.map((item){
                    return Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 10),
                      decoration:  BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(
                              color: const Color(0xffEBEBEB),
                              width: 1
                          )
                      ),
                      child: Row(
                        children: [
                          Text(
                            item.toUpperCase(),
                            style: Theme.of(context).textTheme.labelSmall!.copyWith(
                              color: ColorManager.restaurantTitleColor,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(width: 10.0,),
                          const Icon(Icons.arrow_drop_down,
                            size: 22,
                            color: ColorManager.primaryColor,
                          )

                        ],
                      ),

                    );
                  }).toList();
                },


                iconStyleData: const IconStyleData(
                  icon: SizedBox.shrink(),
                  iconEnabledColor: ColorManager.primaryColor,
                  iconDisabledColor:ColorManager.primaryColor,
                ),
                dropdownStyleData: DropdownStyleData(
                  elevation: 1,
                  width: 120,
                  decoration: BoxDecoration(
                      color: const Color(0xffF5F5F7),
                      borderRadius: BorderRadius.circular(12)
                  ),
                ),
                menuItemStyleData: const MenuItemStyleData(
                  height: 45,

                ),
              ),
            ),
          );
        });

  }
}