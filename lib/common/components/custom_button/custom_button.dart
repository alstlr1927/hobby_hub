library hobby_button;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hobby_hub_app/common/utils/hobby_utils.dart';

import '../../utils/hobby_style.dart';
import '../base_button/base_button.dart';
import '../indicator/hobby_indicator.dart';

part 'custom_button_type.dart';

class HobbyButton extends StatefulWidget {
  final Function? onPressed;
  final HobbyButtonOption option;

  HobbyButton({
    required this.option,
    this.onPressed,
  });

  @override
  HobbyButtonState createState() => HobbyButtonState();
}

class HobbyButtonState extends State<HobbyButton>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    HobbyButtonTheme theme = widget.option.theme;
    if (theme is HobbyButtonFillTheme) {
      return _Fill(option: widget.option, onPressed: widget.onPressed);
    } else if (theme is HobbyButtonLineTheme) {
      return _Line(option: widget.option, onPressed: widget.onPressed);
    } else if (theme is HobbyButtonTextTheme) {
      return _Text(option: widget.option, onPressed: widget.onPressed);
    } else {
      return _Icon(option: widget.option, onPressed: widget.onPressed);
    }
  }
}

class _Fill extends StatefulWidget {
  final Function? onPressed;
  final HobbyButtonOption option;

  _Fill({
    required this.option,
    this.onPressed,
  });

  @override
  _FillState createState() => _FillState();
}

class _FillState extends State<_Fill> with SingleTickerProviderStateMixin {
  bool inProgress = false;

  void setProgress({required bool inProgress}) {
    if (mounted) {
      setState(() {
        this.inProgress = inProgress;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    HobbyButtonFillTheme theme = widget.option.theme as HobbyButtonFillTheme;
    HobbyButtonFillStyle style = widget.option.style as HobbyButtonFillStyle;

    bool enabled = widget.onPressed != null && !inProgress;

    Color backgroundColor = enabled ? theme.baseColor : theme.disabledBaseColor;
    double borderRadius = style.borderRadius;
    double? minWidth = style.minWidth;
    double height = style.height;
    EdgeInsets padding = style.padding;
    String? text = widget.option.text;
    TextStyle textStyle = style.textStyle
        .copyWith(color: enabled ? theme.textColor : theme.disabledTextColor);

    return BaseButton(
        onPressed: enabled
            ? () async {
                setProgress(inProgress: true);
                await widget.onPressed?.call();
                setProgress(inProgress: false);
              }
            : null,
        child: Container(
          constraints: minWidth == null
              ? BoxConstraints.expand(height: height)
              : BoxConstraints(
                  minHeight: height,
                  minWidth: minWidth,
                ),
          child: AnimatedContainer(
            duration: Duration(milliseconds: 200),
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            child: Padding(
              padding: padding,
              child: AnimatedSwitcher(
                  duration: Duration(milliseconds: 100),
                  child: inProgress
                      ? Stack(
                          clipBehavior: Clip.none,
                          alignment: Alignment.center,
                          children: [
                            if (text != null) ...{
                              Text(
                                '$text',
                                style: textStyle.copyWith(
                                    color: Colors.transparent),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            },
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    CupertinoTheme(
                                      data: CupertinoThemeData(
                                        brightness: Brightness.light,
                                      ),
                                      child: HobbyIndicator(
                                        animating: true,
                                        radius: 10,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        )
                      : FittedBox(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              if (text != null) ...{
                                Text(
                                  '${text.isEmpty ? ' ' : text}',
                                  style: textStyle,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              },
                            ],
                          ),
                        )),
            ),
          ),
        ));
  }
}

class _Line extends StatefulWidget {
  final Function? onPressed;
  final HobbyButtonOption option;

  _Line({
    required this.option,
    this.onPressed,
  });

  @override
  _LineState createState() => _LineState();
}

class _LineState extends State<_Line> with SingleTickerProviderStateMixin {
  bool inProgress = false;

  void setProgress({required bool inProgress}) {
    if (mounted) {
      setState(() {
        this.inProgress = inProgress;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    HobbyButtonLineTheme theme = widget.option.theme as HobbyButtonLineTheme;
    HobbyButtonLineStyle style = widget.option.style as HobbyButtonLineStyle;

    bool enabled = widget.onPressed != null && !inProgress;

    Color backgroundColor = enabled ? theme.baseColor : theme.disabledBaseColor;
    Color borderColor = enabled ? theme.lineColor : theme.disabledLineColor;
    double borderRadius = style.borderRadius;
    double? minWidth = style.minWidth;
    double height = style.height;
    EdgeInsets padding = style.padding;
    String? text = widget.option.text;
    TextStyle textStyle = style.textStyle
        .copyWith(color: enabled ? theme.textColor : theme.disabledTextColor);
    return BaseButton(
        onPressed: enabled
            ? () async {
                setProgress(inProgress: true);
                await widget.onPressed?.call();
                setProgress(inProgress: false);
              }
            : null,
        child: Container(
          constraints: minWidth == null
              ? BoxConstraints.expand(height: height)
              : BoxConstraints(
                  minHeight: height,
                  minWidth: minWidth,
                ),
          child: AnimatedContainer(
            duration: Duration(milliseconds: 200),
            decoration: BoxDecoration(
              border: Border.all(color: borderColor, width: 1),
              color: backgroundColor,
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            child: Padding(
              padding: padding,
              child: AnimatedSwitcher(
                  duration: Duration(milliseconds: 100),
                  child: inProgress
                      ? Stack(
                          clipBehavior: Clip.none,
                          alignment: Alignment.center,
                          children: [
                            if (text != null) ...{
                              Text(
                                '$text',
                                style: textStyle.copyWith(
                                    color: Colors.transparent),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            },
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    CupertinoTheme(
                                      data: CupertinoThemeData(
                                        brightness: Brightness.light,
                                      ),
                                      child: HobbyIndicator(
                                        animating: true,
                                        radius: 10,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        )
                      : FittedBox(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              if (text != null) ...{
                                Text(
                                  '$text',
                                  style: textStyle,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              },
                            ],
                          ),
                        )),
            ),
          ),
        ));
  }
}

class _Icon extends StatefulWidget {
  final Function? onPressed;
  final HobbyButtonOption option;

  _Icon({
    required this.option,
    this.onPressed,
  });

  @override
  _IconState createState() => _IconState();
}

class _IconState extends State<_Icon> with SingleTickerProviderStateMixin {
  bool inProgress = false;

  void setProgress({required bool inProgress}) {
    if (mounted) {
      setState(() {
        this.inProgress = inProgress;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    HobbyButtonIconTheme theme = widget.option.theme as HobbyButtonIconTheme;
    HobbyButtonIconStyle style = widget.option.style as HobbyButtonIconStyle;

    bool enabled = widget.onPressed != null && !inProgress;

    double size = style.size;
    Color backgroundColor = enabled ? theme.textColor : theme.disabledTextColor;
    IconData? icon = widget.option.icon;
    return BaseButton(
        onPressed: enabled
            ? () async {
                setProgress(inProgress: true);
                await widget.onPressed?.call();
                setProgress(inProgress: false);
              }
            : null,
        child: AnimatedSwitcher(
            duration: Duration(milliseconds: 100),
            child: inProgress
                ? Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.center,
                    children: [
                      if (icon != null) ...{
                        Icon(icon, size: size, color: Colors.transparent)
                      },
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CupertinoTheme(
                            data: CupertinoThemeData(
                              brightness: Brightness.light,
                            ),
                            child: HobbyIndicator(
                              animating: true,
                              radius: 10,
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                : FittedBox(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (icon != null) ...{
                          Icon(icon, size: size, color: backgroundColor)
                        },
                      ],
                    ),
                  )));
  }
}

class _Text extends StatefulWidget {
  final Function? onPressed;
  final HobbyButtonOption option;

  _Text({
    required this.option,
    this.onPressed,
  });

  @override
  _TextState createState() => _TextState();
}

class _TextState extends State<_Text> with SingleTickerProviderStateMixin {
  bool inProgress = false;

  void setProgress({required bool inProgress}) {
    if (mounted) {
      setState(() {
        this.inProgress = inProgress;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    HobbyButtonTextTheme theme = widget.option.theme as HobbyButtonTextTheme;
    HobbyButtonTextStyle style = widget.option.style as HobbyButtonTextStyle;

    bool enabled = widget.onPressed != null && !inProgress;

    Color backgroundColor = Colors.transparent;
    double borderRadius = style.borderRadius;
    double height = style.height;
    double minWidth = style.minWidth;
    EdgeInsets padding = style.padding;
    String? text = widget.option.text;
    TextStyle textStyle = style.textStyle
        .copyWith(color: enabled ? theme.textColor : theme.disabledTextColor);

    return BaseButton(
        onPressed: enabled
            ? () async {
                setProgress(inProgress: true);
                await widget.onPressed?.call();
                setProgress(inProgress: false);
              }
            : null,
        child: Container(
          constraints: BoxConstraints(
            minHeight: height,
            minWidth: minWidth,
          ),
          child: AnimatedContainer(
            duration: Duration(milliseconds: 200),
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            child: Padding(
              padding: padding,
              child: AnimatedSwitcher(
                  duration: Duration(milliseconds: 100),
                  child: inProgress
                      ? Stack(
                          clipBehavior: Clip.none,
                          alignment: Alignment.center,
                          children: [
                            if (text != null) ...{
                              Text(
                                '$text',
                                style: textStyle.copyWith(
                                    color: Colors.transparent),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            },
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                CupertinoTheme(
                                  data: CupertinoThemeData(
                                    brightness: Brightness.light,
                                  ),
                                  child: HobbyIndicator(
                                    animating: true,
                                    radius: 10,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                      : FittedBox(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              if (text != null) ...{
                                Text(
                                  '$text',
                                  style: textStyle,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              },
                            ],
                          ),
                        )),
            ),
          ),
        ));
  }
}
