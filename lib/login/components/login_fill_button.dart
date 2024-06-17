import 'package:flutter/material.dart';
import 'package:hobby_hub_app/common/utils/hobby_style.dart';
import 'package:hobby_hub_app/common/utils/hobby_utils.dart';

import '../../common/components/base_button/base_button.dart';

class LoginFillButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final ImageProvider image;
  final Color backgroundColor;
  final Color textColor;

  const LoginFillButton({
    super.key,
    required this.onPressed,
    required this.title,
    required this.image,
    this.backgroundColor = HobbyStyle.black,
    this.textColor = HobbyStyle.black,
  });

  @override
  Widget build(BuildContext context) {
    var border;
    if (backgroundColor == HobbyStyle.white) {
      border = Border.all(width: .5, color: HobbyStyle.gray070);
    }
    return BaseButton(
      onPressed: onPressed,
      child: Container(
        height: 48.toWidth,
        decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(4),
            border: border),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: image,
              width: 16.toWidth,
            ),
            SizedBox(width: 8.toWidth),
            Text(
              title,
              style: HobbyStyle.body2(
                color: textColor,
                weight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
