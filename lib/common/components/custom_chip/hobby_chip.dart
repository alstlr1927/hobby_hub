import 'package:flutter/material.dart';
import 'package:hobby_hub_app/common/components/base_button/base_button.dart';
import 'package:hobby_hub_app/common/utils/hobby_style.dart';
import 'package:hobby_hub_app/common/utils/hobby_utils.dart';

class HobbyChip extends StatelessWidget {
  final String text;
  final bool isSelect;
  final VoidCallback? onPressed;
  const HobbyChip({
    super.key,
    required this.text,
    required this.isSelect,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return BaseButton(
      onPressed: onPressed,
      child: Container(
        padding:
            EdgeInsets.symmetric(horizontal: 22.toWidth, vertical: 8.toWidth),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: isSelect ? HobbyStyle.primary050 : HobbyStyle.white,
          border: Border.all(
            width: 1,
            color: isSelect ? HobbyStyle.primary050 : HobbyStyle.gray070,
          ),
        ),
        child: Text(
          text,
          style: HobbyStyle.body2(
            color: isSelect ? HobbyStyle.white : HobbyStyle.gray070,
            weight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
