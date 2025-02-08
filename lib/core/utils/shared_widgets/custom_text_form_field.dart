import 'package:flutter/material.dart';
import 'package:food_app/core/utils/resources/color_manager.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      required this.text,
      required this.textEditingController,
      this.prefixIcon,
      this.color,
      this.widget,
      this.suffixIcon,
      this.type,
      this.validate,
      this.isPassword = false,
      this.suffixPressed,
      this.onChange,
      this.onTap,
      this.readOnly = false,
      this.suffixColor});

  final String text;
  final TextEditingController textEditingController;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final Color? suffixColor;
  final Color? color;
  final Widget? widget;
  final TextInputType? type;
  final bool? isPassword;
  final FormFieldValidator? validate;
  final Function? suffixPressed;
  final Function(String)? onChange;
  final Function()? onTap;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 65,
      child: TextFormField(
        controller: textEditingController,
        keyboardType: type ?? TextInputType.text,
        readOnly: readOnly,
        obscureText: isPassword!,
        onTap: onTap,
        validator: (value) {
          return validate!(value);
        },
        style: Theme.of(context).textTheme.bodySmall!.copyWith(
              color: const Color(0xff32343E),
            ),
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 18.0, horizontal: 14.0),
          enabledBorder: buildOutlineInputBorder(),
          focusedBorder: buildOutlineInputBorder(),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: Colors.red,
              )),
          filled: true,
          fillColor: color,
          hintText: text,
          hintStyle: const TextStyle(
            fontSize: 14,
            color: Color(0xffA0A5BA),
          ),
          prefixIcon: prefixIcon != null
              ? IconButton(
                  onPressed: () {},
                  icon: Icon(prefixIcon!,
                      size: 22, color: ColorManager.iconColor))
              : null,
          suffixIcon: suffixIcon != null
              ? (suffixColor != null
                  ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                       width: 45,
                      height: 45,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        color: ColorManager.white
                      ),
                      child: IconButton(
                          onPressed: () {
                            suffixPressed!();
                          },
                          icon: Icon(
                            suffixIcon,
                            size: 16,
                          ),
                          color: suffixColor,
                        ),
                    ),
                  )
                  : IconButton(
                      onPressed: () {
                        suffixPressed!();
                      },
                      icon: Icon(
                        suffixIcon,
                        size: 16,
                      ),
                      color: ColorManager.iconColor,
                    ))
              : null,
        ),
        onChanged: onChange,
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(
          color: Colors.transparent,
        ));
  }
}
