import 'package:flutter/material.dart';
import 'package:hobby_hub_app/common/components/base_button/base_button.dart';
import 'package:hobby_hub_app/common/utils/hobby_style.dart';
import 'package:hobby_hub_app/common/utils/hobby_utils.dart';

class HobbyDialog extends StatefulWidget {
  final String title;
  final String content;
  final List<HobbyDialogBtnItem> itemList;
  const HobbyDialog({
    super.key,
    this.title = '',
    this.content = '',
    required this.itemList,
  });

  @override
  State<HobbyDialog> createState() => _HobbyDialogState();
}

class _HobbyDialogState extends State<HobbyDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: double.infinity,
        height: widget.itemList.isEmpty ? 150.toWidth : 190.toWidth,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(16.toWidth),
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (widget.title.isNotEmpty) ...{
                      Text(
                        '${widget.title}',
                        style: HobbyStyle.body1(
                          color: HobbyStyle.primary050,
                          weight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 20.toWidth),
                    },
                    if (widget.content.isNotEmpty)
                      Text(
                        '${widget.content}',
                        style: HobbyStyle.body2(
                          color: HobbyStyle.gray090,
                        ),
                        textAlign: TextAlign.center,
                      ),
                  ],
                ),
              ),
            ),
            if (widget.itemList.isNotEmpty) ...{
              Divider(
                height: 1,
                color: HobbyStyle.gray060,
              ),
              Row(
                children: widget.itemList
                    .map((item) {
                      return Container(child: item);
                    })
                    .superJoin(Container(
                      color: HobbyStyle.gray060,
                      width: 1,
                      height: 50.toWidth,
                    ))
                    .toList(),
              ),
            },
          ],
        ),
      ),
    );
  }
}

class HobbyDialogBtnItem extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  const HobbyDialogBtnItem({
    super.key,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      child: BaseButton(
        onPressed: onPressed,
        child: Container(
          height: 50.toWidth,
          alignment: Alignment.center,
          child: Text(
            title,
            style: HobbyStyle.body2(
              color: HobbyStyle.gray090,
            ),
          ),
        ),
      ),
    );
  }
}
