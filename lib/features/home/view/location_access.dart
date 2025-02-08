import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/core/utils/resources/cache_helper.dart';
import 'package:food_app/core/utils/resources/color_manager.dart';
import 'package:food_app/core/utils/resources/go_router.dart';
import 'package:food_app/features/home/view_model/home_cubit/home_cubit.dart';
import 'package:food_app/features/home/view_model/home_cubit/home_states.dart';
import 'package:go_router/go_router.dart';

class LocationAccess extends StatelessWidget {
  const LocationAccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<HomeCubit, HomeStates>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 150,
                height: 200,
                decoration: BoxDecoration(
                    color: ColorManager.grey,
                    borderRadius: BorderRadius.circular(30)),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () async {
                  HomeCubit.get(context).requestLocationPermission();
                  GoRouter.of(context).pushReplacement(AppRouter.kHomeView);
                  await CacheHelper.saveData(
                      key: 'isLocationAccessed', value: true);

                },
                child: Container(
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: ColorManager.primaryColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Access Location',
                          style: Theme.of(context).textTheme.labelSmall),
                      const SizedBox(
                        width: 5.0,
                      ),
                      const Icon(
                        Icons.location_on,
                        color: ColorManager.white,
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text('DFOOD WILL ACCESS YOUR LOCATION ONLY WHILE USING THE APP',
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .displayMedium!
                    .copyWith(color: const Color(0xff646982), fontSize: 16),
              )
            ],
          ),
        );
      },
    ));
  }
}
