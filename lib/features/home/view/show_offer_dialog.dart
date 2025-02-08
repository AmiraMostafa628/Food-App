import 'package:flutter/material.dart';
import 'package:food_app/core/utils/resources/assets_manager.dart';
import 'package:food_app/core/utils/resources/color_manager.dart';

void showCustomDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierColor: Colors.grey.withAlpha(153),
    builder: (context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: Stack(
          alignment: AlignmentDirectional.topEnd,
          clipBehavior: Clip.none,
          children: [
            Container(
              width: 300,
              height: 400,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                gradient: const LinearGradient(
                  colors: [
                    Color(0xffFFEB34),
                    Color(0xffE76F00),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Image.asset(AssetsManager.topLeft),
                        Image.asset(AssetsManager.topCenter),
                        Image.asset(AssetsManager.topRight),
                      ],
                    ),
                    Text(
                      'Hurry Offers!',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontSize: 35,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Image.asset(
                                alignment: AlignmentDirectional.centerEnd,
                                AssetsManager.centerRight),
                          ],
                        ),
                        Text(
                          '#1243CD2',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'Use the cupon get 25% discount',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(fontSize: 16),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                              side: const BorderSide(color: ColorManager.white),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8))),
                          child: Text(
                            'Get it',
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(color: ColorManager.white),
                          )),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              top: -10,
              right: -10,
              child: Container(
                decoration: const BoxDecoration(
                  color: Color(0xffFFE194),
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.close,
                      size: 18,
                      color: Color(0xffEF761A),
                    )),
              ),
            ),
          ],
        ),
      );
    },
  );
}
