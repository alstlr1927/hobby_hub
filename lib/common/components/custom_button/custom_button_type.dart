part of hobby_button;

abstract class HobbyButtonStyle {
  HobbyButtonStyle();
}

abstract class HobbyButtonTheme {
  HobbyButtonTheme();
}

/* STYLE===================================================*/

class HobbyButtonFillStyle extends HobbyButtonStyle {
  final double height;
  final double? minWidth;
  final EdgeInsets padding;
  final TextStyle textStyle;
  final double borderRadius;

  static HobbyButtonFillStyle get fullLarge => HobbyButtonFillStyle(
        height: 56.toWidth,
        padding: EdgeInsets.symmetric(horizontal: 18),
        borderRadius: 4,
        textStyle: HobbyStyle.body1(weight: FontWeight.w600),
      );

  static HobbyButtonFillStyle get large => HobbyButtonFillStyle(
        height: 56.toWidth,
        padding: EdgeInsets.symmetric(horizontal: 18),
        minWidth: 88.toWidth,
        borderRadius: 4,
        textStyle: HobbyStyle.body1(weight: FontWeight.w600),
      );

  static HobbyButtonFillStyle get xsmall => HobbyButtonFillStyle(
        height: 28.toWidth,
        padding: EdgeInsets.symmetric(horizontal: 8),
        minWidth: 73.toWidth,
        borderRadius: 4,
        textStyle: HobbyStyle.caption(weight: FontWeight.w600),
      );

  static HobbyButtonFillStyle get small => HobbyButtonFillStyle(
        height: 36.toWidth,
        padding: EdgeInsets.symmetric(horizontal: 16),
        minWidth: 52.toWidth,
        borderRadius: 4,
        textStyle: HobbyStyle.body2(weight: FontWeight.w600),
      );

  static HobbyButtonFillStyle get fullSmall => HobbyButtonFillStyle(
        height: 36.toWidth,
        padding: EdgeInsets.symmetric(horizontal: 16),
        borderRadius: 4,
        textStyle: HobbyStyle.body2(weight: FontWeight.w600),
      );

  static HobbyButtonFillStyle get regular => HobbyButtonFillStyle(
        height: 48.toWidth,
        padding: EdgeInsets.symmetric(horizontal: 16),
        minWidth: 88.toWidth,
        borderRadius: 4,
        textStyle: HobbyStyle.body1(weight: FontWeight.w600),
      );

  static HobbyButtonFillStyle get fullRegular => HobbyButtonFillStyle(
        height: 48.toWidth,
        padding: EdgeInsets.zero,
        borderRadius: 4,
        textStyle: HobbyStyle.body1(weight: FontWeight.w600),
      );

  HobbyButtonFillStyle({
    required this.height,
    this.minWidth,
    required this.padding,
    required this.textStyle,
    required this.borderRadius,
  });

  HobbyButtonFillStyle copyWith({
    double? height,
    double? minWidth,
    EdgeInsets? padding,
    TextStyle? textStyle,
    double? borderRadius,
  }) {
    return HobbyButtonFillStyle(
      height: height ?? this.height,
      minWidth: minWidth ?? this.minWidth,
      padding: padding ?? this.padding,
      textStyle: textStyle ?? this.textStyle,
      borderRadius: borderRadius ?? this.borderRadius,
    );
  }
}

class HobbyButtonLineStyle extends HobbyButtonStyle {
  final double height;
  final double? minWidth;
  final EdgeInsets padding;
  final TextStyle textStyle;
  final double borderRadius;

  static HobbyButtonLineStyle get large => HobbyButtonLineStyle(
        height: 56.toWidth,
        padding: EdgeInsets.symmetric(horizontal: 18),
        minWidth: 88.toWidth,
        borderRadius: 4,
        textStyle: HobbyStyle.body1(weight: FontWeight.w600),
      );

  static HobbyButtonLineStyle get regular => HobbyButtonLineStyle(
        height: 48.toWidth,
        padding: EdgeInsets.symmetric(horizontal: 16),
        minWidth: 88.toWidth,
        borderRadius: 4,
        textStyle: HobbyStyle.body1(weight: FontWeight.w600),
      );

  static HobbyButtonLineStyle get xsmall => HobbyButtonLineStyle(
        height: 28.toWidth,
        padding: EdgeInsets.symmetric(horizontal: 8),
        minWidth: 73.toWidth,
        borderRadius: 4,
        textStyle: HobbyStyle.caption(weight: FontWeight.w600),
      );

  static HobbyButtonLineStyle get small => HobbyButtonLineStyle(
        height: 36.toWidth,
        padding: EdgeInsets.symmetric(horizontal: 16),
        minWidth: 52.toWidth,
        borderRadius: 4,
        textStyle: HobbyStyle.body2(weight: FontWeight.w600),
      );

  static HobbyButtonLineStyle get fullSmall => HobbyButtonLineStyle(
        height: 36.toWidth,
        padding: EdgeInsets.symmetric(horizontal: 16),
        borderRadius: 4,
        textStyle: HobbyStyle.body2(weight: FontWeight.w600),
      );

  static HobbyButtonLineStyle get fullRegular => HobbyButtonLineStyle(
        height: 48.toWidth,
        padding: EdgeInsets.zero,
        borderRadius: 4,
        textStyle: HobbyStyle.body1(weight: FontWeight.w600),
      );

  HobbyButtonLineStyle(
      {required this.height,
      this.minWidth,
      required this.padding,
      required this.textStyle,
      required this.borderRadius});

  HobbyButtonLineStyle copyWith({
    double? height,
    double? minWidth,
    EdgeInsets? padding,
    TextStyle? textStyle,
    double? borderRadius,
  }) {
    return HobbyButtonLineStyle(
      height: height ?? this.height,
      minWidth: minWidth ?? this.minWidth,
      padding: padding ?? this.padding,
      textStyle: textStyle ?? this.textStyle,
      borderRadius: borderRadius ?? this.borderRadius,
    );
  }
}

class HobbyButtonIconStyle extends HobbyButtonStyle {
  double size;

  static HobbyButtonIconStyle get small => HobbyButtonIconStyle(
        size: 16.toWidth,
      );

  static HobbyButtonIconStyle get regular => HobbyButtonIconStyle(
        size: 24.toWidth,
      );

  HobbyButtonIconStyle({required this.size});
}

class HobbyButtonTextStyle extends HobbyButtonStyle {
  final double height;
  final double minWidth;
  final EdgeInsets padding;
  final TextStyle textStyle;
  final double borderRadius;

  static HobbyButtonTextStyle get small => HobbyButtonTextStyle(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        borderRadius: 4,
        minWidth: 48.toWidth,
        height: 26.toWidth,
        textStyle: HobbyStyle.caption(weight: FontWeight.w600),
      );

  static HobbyButtonTextStyle get regular => HobbyButtonTextStyle(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        borderRadius: 4,
        minWidth: 52.toWidth,
        height: 28.toWidth,
        textStyle: HobbyStyle.body2(weight: FontWeight.w600),
      );

  HobbyButtonTextStyle(
      {required this.padding,
      required this.height,
      required this.minWidth,
      required this.textStyle,
      required this.borderRadius});
}

/* THEME===================================================*/

class HobbyButtonColors {
  static const button_base_white = HobbyStyle.white;
  static const button_base_gray = HobbyStyle.gray040;
  static const button_base_magenta = HobbyStyle.primary050;
  static const button_base_lightMagenta = HobbyStyle.primary020;

  static const button_text_white = HobbyStyle.white;
  static const button_text_gray = HobbyStyle.gray070;
  static const button_text_deepGray = HobbyStyle.gray090;
  static const button_text_magenta = HobbyStyle.primary050;
  static const button_text_negationRed = HobbyStyle.negationRed;

  static const button_disabled_text_gray = HobbyStyle.gray060;
  static const button_disabled_base_gray = HobbyStyle.gray040;
  static const button_disabled_line_gray = HobbyStyle.gray050;

  static const button_line_negationRed = HobbyStyle.negationRed;

  static const button_loading_base_gray = HobbyStyle.gray040;
  static const button_loading_line_gray = HobbyStyle.gray050;
}

class HobbyButtonFillTheme extends HobbyButtonTheme {
  final Color baseColor;
  final Color textColor;
  final Color disabledBaseColor;
  final Color disabledTextColor;
  final Color loadingColor;

  static HobbyButtonFillTheme get lightMagenta => HobbyButtonFillTheme(
        baseColor: HobbyButtonColors.button_base_lightMagenta,
        textColor: HobbyButtonColors.button_text_magenta,
        disabledBaseColor: HobbyButtonColors.button_disabled_base_gray,
        disabledTextColor: HobbyButtonColors.button_disabled_text_gray,
        loadingColor: HobbyButtonColors.button_loading_base_gray,
      );

  static HobbyButtonFillTheme get magenta => HobbyButtonFillTheme(
        baseColor: HobbyButtonColors.button_base_magenta,
        textColor: HobbyButtonColors.button_text_white,
        disabledBaseColor: HobbyButtonColors.button_disabled_base_gray,
        disabledTextColor: HobbyButtonColors.button_disabled_text_gray,
        loadingColor: HobbyButtonColors.button_loading_base_gray,
      );

  static HobbyButtonFillTheme get gray => HobbyButtonFillTheme(
        baseColor: HobbyButtonColors.button_base_gray,
        textColor: HobbyButtonColors.button_text_gray,
        disabledBaseColor: HobbyButtonColors.button_disabled_base_gray,
        disabledTextColor: HobbyButtonColors.button_disabled_text_gray,
        loadingColor: HobbyButtonColors.button_loading_base_gray,
      );

  static HobbyButtonFillTheme get orange => HobbyButtonFillTheme(
        baseColor: Color(0xFFFF7742),
        textColor: HobbyButtonColors.button_text_white,
        disabledBaseColor: HobbyButtonColors.button_disabled_base_gray,
        disabledTextColor: HobbyButtonColors.button_disabled_text_gray,
        loadingColor: HobbyButtonColors.button_loading_base_gray,
      );

  static HobbyButtonFillTheme get thanksGiving => HobbyButtonFillTheme(
        baseColor: HobbyStyle.thanksGivingSecondary,
        textColor: HobbyButtonColors.button_text_white,
        disabledBaseColor: HobbyButtonColors.button_disabled_base_gray,
        disabledTextColor: HobbyButtonColors.button_disabled_text_gray,
        loadingColor: HobbyButtonColors.button_loading_base_gray,
      );

  static HobbyButtonFillTheme get blue => HobbyButtonFillTheme(
        baseColor: HobbyStyle.subBlue,
        textColor: HobbyButtonColors.button_text_white,
        disabledBaseColor: HobbyButtonColors.button_disabled_base_gray,
        disabledTextColor: HobbyButtonColors.button_disabled_text_gray,
        loadingColor: HobbyButtonColors.button_loading_base_gray,
      );

  static HobbyButtonFillTheme get lightBlue => HobbyButtonFillTheme(
        baseColor: HobbyStyle.subBlue10,
        textColor: HobbyStyle.subBlue,
        disabledBaseColor: HobbyButtonColors.button_disabled_base_gray,
        disabledTextColor: HobbyButtonColors.button_disabled_text_gray,
        loadingColor: HobbyButtonColors.button_loading_base_gray,
      );

  static HobbyButtonFillTheme custom({
    required Color baseColor,
    required Color textColor,
  }) =>
      HobbyButtonFillTheme(
        baseColor: baseColor,
        textColor: textColor,
        disabledBaseColor: HobbyButtonColors.button_disabled_base_gray,
        disabledTextColor: HobbyButtonColors.button_disabled_text_gray,
        loadingColor: HobbyButtonColors.button_loading_base_gray,
      );

  HobbyButtonFillTheme(
      {required this.baseColor,
      required this.textColor,
      required this.disabledBaseColor,
      required this.disabledTextColor,
      required this.loadingColor});
}

class HobbyButtonLineTheme extends HobbyButtonTheme {
  final Color baseColor;
  final Color textColor;
  final Color lineColor;
  final Color disabledBaseColor;
  final Color disabledTextColor;
  final Color disabledLineColor;
  final Color loadingColor;

  static HobbyButtonLineTheme get negationRed => HobbyButtonLineTheme(
      baseColor: HobbyButtonColors.button_base_white,
      textColor: HobbyButtonColors.button_text_negationRed,
      lineColor: HobbyButtonColors.button_line_negationRed,
      disabledBaseColor: HobbyButtonColors.button_base_white,
      disabledTextColor: HobbyButtonColors.button_disabled_text_gray,
      disabledLineColor: HobbyButtonColors.button_disabled_line_gray,
      loadingColor: HobbyButtonColors.button_loading_line_gray);

  static HobbyButtonLineTheme get deepGray => HobbyButtonLineTheme(
      baseColor: HobbyStyle.white,
      textColor: HobbyStyle.gray090,
      lineColor: HobbyStyle.gray050,
      disabledBaseColor: HobbyStyle.white,
      disabledTextColor: HobbyStyle.gray060,
      disabledLineColor: HobbyStyle.gray050,
      loadingColor: HobbyStyle.gray050);

  HobbyButtonLineTheme(
      {required this.baseColor,
      required this.textColor,
      required this.lineColor,
      required this.disabledBaseColor,
      required this.disabledTextColor,
      required this.disabledLineColor,
      required this.loadingColor});
}

class HobbyButtonIconTheme extends HobbyButtonTheme {
  final Color textColor;
  final Color disabledTextColor;

  static HobbyButtonIconTheme get deepGray => HobbyButtonIconTheme(
      textColor: HobbyButtonColors.button_text_deepGray,
      disabledTextColor: HobbyButtonColors.button_disabled_text_gray);

  static HobbyButtonIconTheme get white => HobbyButtonIconTheme(
      textColor: HobbyButtonColors.button_text_white,
      disabledTextColor: HobbyButtonColors.button_disabled_text_gray);

  HobbyButtonIconTheme(
      {required this.textColor, required this.disabledTextColor});

  HobbyButtonIconTheme copyWith({
    Color? textColor,
    Color? disabledTextColor,
  }) {
    return HobbyButtonIconTheme(
      textColor: textColor ?? this.textColor,
      disabledTextColor: disabledTextColor ?? this.disabledTextColor,
    );
  }
}

class HobbyButtonTextTheme extends HobbyButtonTheme {
  final Color textColor;
  final Color disabledTextColor;

  static HobbyButtonTextTheme get gray => HobbyButtonTextTheme(
      textColor: HobbyButtonColors.button_text_gray,
      disabledTextColor: HobbyButtonColors.button_disabled_text_gray);

  static HobbyButtonTextTheme get magenta => HobbyButtonTextTheme(
      textColor: HobbyButtonColors.button_text_magenta,
      disabledTextColor: HobbyButtonColors.button_disabled_text_gray);
  static HobbyButtonTextTheme get subBlue => HobbyButtonTextTheme(
      textColor: HobbyStyle.subBlue,
      disabledTextColor: HobbyButtonColors.button_disabled_text_gray);

  static HobbyButtonTextTheme get negationRed => HobbyButtonTextTheme(
      textColor: HobbyButtonColors.button_text_negationRed,
      disabledTextColor: HobbyButtonColors.button_disabled_text_gray);

  HobbyButtonTextTheme(
      {required this.textColor, required this.disabledTextColor});
}

class HobbyButtonOption {
  final String? text;
  final IconData? icon;
  final HobbyButtonTheme theme;
  final HobbyButtonStyle style;

  HobbyButtonOption.fill(
      {required this.text,
      required HobbyButtonFillTheme theme,
      required HobbyButtonFillStyle style})
      : theme = theme,
        style = style,
        icon = null;

  HobbyButtonOption.line(
      {required this.text,
      required HobbyButtonLineTheme theme,
      required HobbyButtonLineStyle style})
      : theme = theme,
        style = style,
        icon = null;

  HobbyButtonOption.icon(
      {required this.icon,
      required HobbyButtonIconTheme theme,
      required HobbyButtonIconStyle style})
      : theme = theme,
        style = style,
        text = '';

  HobbyButtonOption.text(
      {required this.text,
      required HobbyButtonTextTheme theme,
      required HobbyButtonTextStyle style})
      : theme = theme,
        style = style,
        icon = null;
}
