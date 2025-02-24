import 'package:flutter/material.dart';

import '../constants/color_constants.dart';
import '../constants/constant_widgets.dart';

class CustomDropdownField extends StatelessWidget {
  final String? label;
  final String? hint;
  final List<String> items;
  final String? value;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final void Function(String?)? onChanged;
  final VoidCallback? onTap;
  final bool readOnly;
  final Color? borderColor;

  const CustomDropdownField({
    Key? key,
    this.label,
    this.hint,
    required this.items,
    this.value,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
    this.onChanged,
    this.onTap,
    this.readOnly = false, this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: customText(
              text: label!,
              color: ColorConstants.textGrey,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        DropdownButtonFormField<String>(
          value: value,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(
              color: ColorConstants.blackColor,
              fontSize: 16,
              fontFamily: 'NunitoSans',
            ),
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            filled: true,
            fillColor: Colors.transparent,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide:  BorderSide(
                color: borderColor ?? ColorConstants.blackColor,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide:  BorderSide(
                color: borderColor ?? ColorConstants.blackColor,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: Colors.red,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: Colors.red,
              ),
            ),
          ),
          dropdownColor: Colors.white,
          style: const TextStyle(
            color: ColorConstants.blackColor,
            fontSize: 16,
            fontFamily: 'NunitoSans',
          ),
          validator: validator,
          onChanged: readOnly ? null : onChanged,
          items: items.map((String item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(item),
            );
          }).toList(),
        ),
      ],
    );
  }
}
