import 'package:flutter/material.dart';
import 'package:food_app/core/utils/resources/color_manager.dart';
import 'package:food_app/features/payment/view/add_new_card_components/format_card_number.dart';

class CardNumberField extends StatelessWidget {
  CardNumberField({super.key, required this.cardNumber});

  final cardNumberController = TextEditingController();
  late final Function(String) cardNumber;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 65,
      child: TextFormField(
        controller: cardNumberController,
        keyboardType: TextInputType.number,
        style: Theme.of(context).textTheme.bodySmall!.copyWith(
          color: const Color(0xff32343E),
        ),
        decoration: InputDecoration(
            hintText: '---- ---- ---- ----',
            hintStyle: const TextStyle(letterSpacing: 2,
              fontSize: 14,
              color: Color(0xffA0A5BA),
            ),
            filled: true,
            fillColor: ColorManager.fillTextFieldColor ,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: Colors.transparent,

                )
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: Colors.transparent,

                )
            )

        ),
        inputFormatters: [FormatCardNumber()],
        onChanged: (value){
          cardNumber(value);
        },

      ),
    );
  }
}