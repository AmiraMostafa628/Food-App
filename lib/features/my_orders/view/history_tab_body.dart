import 'package:flutter/material.dart';
import 'package:food_app/core/utils/models/my_orders_model.dart';
import 'package:food_app/core/utils/resources/color_manager.dart';
import 'package:food_app/core/utils/shared_widgets/custom_button.dart';
import 'package:food_app/core/utils/shared_widgets/max_grey_container.dart';

class HistoryTabBody extends StatelessWidget {
  HistoryTabBody({super.key});

  final List<MyOrdersModel> itemModels = [
    MyOrdersModel(
        title: 'Food',
        subTitle: 'Pizza Hut',
        price: 35.25,
        count: '03',
        date: '29 Jan, 12:30',
        code: '#162432'),
    MyOrdersModel(
        title: 'Drink',
        subTitle: 'McDonald',
        price: 40.15,
        count: '02',
        date: '30 Jan, 12:30',
        code: '#242432'),
    MyOrdersModel(
        title: 'Drink',
        subTitle: 'Starbucks',
        price: 10.20,
        count: '01',
        date: '30 Jan, 12:30',
        code: '#240112'),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: itemModels.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              spacing: 10.0,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  spacing: 25,
                  children: [
                    Text(
                      itemModels[index].title,
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(
                        fontWeight: FontWeight.normal,
                        color: ColorManager.restaurantTitleColor,
                      ),
                    ),
                    index == itemModels.length-1?Text(
                      'Canceled',
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: ColorManager.darkRed,
                      ),
                    ):Text(
                      'Completed',
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: ColorManager.green,
                      ),
                    )
                  ],
                ),
                const Divider(
                  color: Color(0xffEEF2F6),
                ),
                Row(
                  children: [
                    const MaxGreyContainer(
                      height: 60,
                      width: 60,
                    ),
                    const SizedBox(
                      width: 15.0,
                    ),
                    Expanded(
                      child: Column(
                        spacing: 10.0,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                itemModels[index].subTitle,
                                style: Theme.of(context)
                                    .textTheme
                                    .labelSmall!
                                    .copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: ColorManager.restaurantTitleColor,
                                ),
                              ),
                              const Spacer(),
                              Text(
                                itemModels[index].code,
                                style: Theme.of(context)
                                    .textTheme
                                    .labelSmall!
                                    .copyWith(
                                    fontWeight: FontWeight.normal,
                                    color: const Color(0xff6B6E82),
                                    decoration: TextDecoration.underline),
                              ),
                            ],
                          ),
                          Row(
                            spacing: 12,
                            children: [
                              Text(
                                '\$${itemModels[index].price}',
                                style: Theme.of(context)
                                    .textTheme
                                    .labelSmall!
                                    .copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: ColorManager.restaurantTitleColor,
                                ),
                              ),
                              const SizedBox(
                                height: 25.0,
                                child: VerticalDivider(
                                  width: 10.0,
                                  thickness: 1.0,
                                  color: Color(0xffCACCDA),
                                ),
                              ),
                              Text(
                                itemModels[index].date!,
                                style: Theme.of(context)
                                    .textTheme
                                    .displaySmall!
                                    .copyWith(
                                  fontWeight: FontWeight.normal,
                                  color: const Color(0xff6B6E82),
                                ),
                              ),
                              const Icon(
                                Icons.circle,
                                size: 4.0, // Adjust size as needed
                                color: Color(0xff6B6E82), // Adjust color as needed
                              ),
                              Text(
                                '${itemModels[index].count} Items',
                                style: Theme.of(context)
                                    .textTheme
                                    .displaySmall!
                                    .copyWith(
                                  fontWeight: FontWeight.normal,
                                  color: const Color(0xff6B6E82),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 20.0),
                const Row(
                  spacing: 25.0,
                  children: [
                    Expanded(
                        child: CustomButton(
                            text: 'Rate',
                            height: 50.0,
                            upperCase: false,
                            fontSize: 12,
                            backGroundColor: ColorManager.white,
                            fontWeight: FontWeight.bold,
                            fontColor:ColorManager.primaryColor
                        )),
                    Expanded(
                        child: CustomButton(
                          text: 'Re-Order',
                          height: 50.0,
                          upperCase: false,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,

                        )),

                  ],
                )
              ],
            ),
          );
        });
  }
}