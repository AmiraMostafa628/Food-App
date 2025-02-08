import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_app/core/utils/models/track_order_model.dart';
import 'package:food_app/core/utils/resources/assets_manager.dart';
import 'package:food_app/core/utils/resources/color_manager.dart';
import 'package:food_app/core/utils/resources/go_router.dart';
import 'package:food_app/core/utils/shared_widgets/max_grey_container.dart';
import 'package:food_app/features/payment/view_model/payment_cubit.dart';
import 'package:food_app/features/payment/view_model/payment_states.dart';
import 'package:go_router/go_router.dart';

List<TrackOrderModel> itemModel = [
  TrackOrderModel(
      iconColor: ColorManager.primaryColor,
      icon: AssetsManager.check,
      title: 'Your order has been received'),
  TrackOrderModel(
      iconColor: ColorManager.primaryColor,
      icon: AssetsManager.loader,
      title: 'The restaurant is preparing your food'),
  TrackOrderModel(
      iconColor: ColorManager.restaurantCategoriesColor,
      icon: AssetsManager.check,
      title: 'Your order has been picked up for delivery'),
  TrackOrderModel(
      iconColor: ColorManager.restaurantCategoriesColor,
      icon: AssetsManager.check,
      title: 'Order arriving soon!'),
];

void showBottomSheetFunction(BuildContext context) {
  final PaymentCubit paymentCubit = PaymentCubit.get(context);
  paymentCubit.isBottomSheetShown(true);
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: ColorManager.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
    ),
    builder: (context) => BlocBuilder<PaymentCubit,PaymentStates>(
        builder: (context,state){
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
                child: Column(
                  children: [
                    Container(
                      height: 7.0,
                      width: 70.0,
                      decoration: BoxDecoration(
                        color: const Color(0xffD8E3ED),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const MaxGreyContainer(
                          width: 63,
                          height: 63,
                        ),
                        const SizedBox(width: 10.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Uttora Coffee House',
                              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                                fontWeight: FontWeight.normal,
                                color: ColorManager.restaurantTitleColor,
                              ),
                            ),
                            const SizedBox(height: 4.0),
                            Text(
                              'Orderd at 06 Sept, 10:00pm',
                              style: Theme.of(context).textTheme.displaySmall!.copyWith(
                                fontWeight: FontWeight.normal,
                                color: ColorManager.restaurantCategoriesColor,
                              ),
                            ),
                            const SizedBox(height: 8.0),
                            Text(
                              '2x Burger',
                              style: Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 13),
                            ),
                            const SizedBox(height: 8.0),
                            Text(
                              '4x Sandwich',
                              style: Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 13),
                            ),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(height: 30),
                    Center(
                      child: Text('20 min',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: ColorManager.restaurantTitleColor
                        ),

                      ),
                    ),
                    const SizedBox(height: 10),
                    Center(
                      child: Text('Estimated delivery time',
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: ColorManager.restaurantCategoriesColor,
                          fontWeight: FontWeight.normal,
                        ),

                      ),
                    ),
                    const SizedBox(height: 30),
                    Column(
                      children: itemModel.asMap().entries.map((entry){
                        int index= entry.key;
                        var item = entry.value;
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                    radius:10,
                                    backgroundColor: item.iconColor,
                                    child: SvgPicture.asset(item.icon,height: 11,width: 11,)),
                                const SizedBox(width: 25.0,),
                                Text(item.title,
                                  style: Theme.of(context).textTheme.displayMedium!.copyWith(
                                    fontSize: 13,
                                    color: index==0?
                                    ColorManager.primaryColor:
                                    ColorManager.restaurantCategoriesColor,
                                  ),
                                ),
                              ],
                            ),
                            index!= itemModel.length-1? SizedBox(
                              height:30,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 2.0),
                                child: VerticalDivider(
                                  color: index==0?
                                  ColorManager.primaryColor:
                                  ColorManager.restaurantCategoriesColor,),
                              ),
                            ):const SizedBox(),
                          ],
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
              Container(
                decoration:  const BoxDecoration(
                  color: ColorManager.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                  ),
                  border: Border(
                    top: BorderSide(
                      color: Color(0xffE8E8E8)
                    )
                  )
                ),
                child:  Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Row(
                    children: [
                      const CircleAvatar(
                        radius: 27,
                        backgroundColor: ColorManager.trackOrderBackGround,
                        child: Icon(Icons.person,color: ColorManager.arrowColor,size: 35,),
                      ),
                      const SizedBox(width: 10.0,),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Robert F.',
                              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 5.0,),
                            Text('Courier',
                              style: Theme.of(context).textTheme.displayMedium!.copyWith(
                                fontSize: 14,
                                color: ColorManager.restaurantCategoriesColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          GoRouter.of(context).push(AppRouter.kDeliverCallScreen);
                        },
                        child: const CircleAvatar(
                          radius: 23,
                          backgroundColor: ColorManager.primaryColor,
                          child: Icon(Icons.call,color: ColorManager.white,),
                        ),
                      ),
                      const SizedBox(width: 10.0,),
                      GestureDetector(
                        onTap: (){
                          GoRouter.of(context).push(AppRouter.kChatView);
                        },
                        child: Container(
                          width: 45,
                          height: 45,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: ColorManager.primaryColor
                            )
                          ),
                          child: const Icon(FontAwesomeIcons.facebookMessenger,color: ColorManager.primaryColor,),
                        ),
                      )

                    ],
                  ),
                ),

              )
            ],
          );
        }),
  ).whenComplete((){
    paymentCubit.isBottomSheetShown(false);
  });
}
