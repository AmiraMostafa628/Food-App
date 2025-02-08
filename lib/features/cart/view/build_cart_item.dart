import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/core/utils/resources/color_manager.dart';
import 'package:food_app/core/utils/shared_widgets/max_grey_container.dart';
import 'package:food_app/features/cart/view_model/cart_cubit.dart';
import 'package:food_app/features/cart/view_model/cart_states.dart';

class BuildCartItem extends StatelessWidget {
  const BuildCartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartStates>(
        builder: (context, state) {
          return ListView.separated(
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                     MaxGreyContainer(
                      height: 100,
                      width: 125,
                      backgroundColor:ColorManager.white.withAlpha(26),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            CartCubit.get(context).cartItems[index].restaurantName!,
                            style:
                            Theme.of(context).textTheme.headlineSmall!.copyWith(
                              fontWeight: FontWeight.w400,
                              color: ColorManager.white,
                            ),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            '\$${CartCubit.get(context).cartItems[index].price}',
                            style:
                            Theme.of(context).textTheme.headlineSmall!.copyWith(
                              fontWeight: FontWeight.bold,
                              color: ColorManager.white,
                            ),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Row(
                            children: [
                              Text(
                                CartCubit.get(context).cartItems[index].size!,
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                              const Spacer(),
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      CartCubit.get(context).decrement(
                                          CartCubit.get(context).cartItems[index].price!);
                                    },
                                    child:  CircleAvatar(
                                      radius: 14,
                                      backgroundColor:ColorManager.white.withAlpha(26),
                                      child: const Text(
                                        '-',
                                        style: TextStyle(
                                          color: ColorManager.white,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20.0),
                                    child: Text(CartCubit.get(context).cartItems[index].amount!,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(
                                          color: ColorManager.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      CartCubit.get(context).increment(
                                          CartCubit.get(context).cartItems[index].price!);
                                    },
                                    child: CircleAvatar(
                                      radius: 14,
                                      backgroundColor:ColorManager.white.withAlpha(26),
                                      child: const Text(
                                        '+',
                                        style: TextStyle(
                                            color: ColorManager.white,
                                            fontSize: 16),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                );
              },
              separatorBuilder: (context, index) => const SizedBox(
                height: 20.0,
              ),
              itemCount: CartCubit.get(context).cartItems.length);
        });
  }
}