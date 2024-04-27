import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kartal/kartal.dart';
import 'package:sizer/sizer.dart';

import '../../constants/app/color_constants.dart';
import '../../extensions/num_extensions.dart';
import '../text/custom_text.dart';

class TextFormFieldWidget extends StatefulWidget {
  final String? hintText;
  final bool isPassword;
  final double? width;
  final Function? onSaved;
  final Function? onChanged;

  final String? prefixIconPath;
  final EdgeInsets? contentPadding;
  final Function(String?)? validator;
  final double? borderRadius;
  final int? maxLines;
  final TextInputType? textInputType;
  final Color? prefixIconColor;
  final Color? backgroundColor;
  final bool? isAuthScreen;
  final String? title;
  final String? labelText;
  final double? fontSize;
  final Color? textColor;
  final bool? isThereShadow;
  final double? suffixIconSize;
  final String? initialValue;
  final FontWeight? hintTextFontWeight;
  final double? titleFontSize;
  final List<TextInputFormatter>? inputFormatters;
  final TextEditingController? textEditingController;
  final bool noElevation;
  final double borderWidth;
  final Widget? suffixWidget;
  final int? maxLength;
  final Widget? prefixWidget;
  const TextFormFieldWidget({
    Key? key,
    this.hintText,
    this.width = 0.88,
    this.titleFontSize = 12,
    this.isPassword = false,
    this.onSaved,
    this.onChanged,
    this.initialValue,
    this.prefixIconPath,
    this.textEditingController,
    this.validator,
    this.labelText,
    this.borderRadius = 10,
    this.textInputType = TextInputType.text,
    this.backgroundColor = Colors.white,
    this.prefixIconColor,
    this.contentPadding,
    this.isAuthScreen = true,
    this.title,
    this.maxLines = 1,
    this.fontSize = 11,
    this.textColor,
    this.isThereShadow = false,
    this.suffixIconSize = 20,
    this.inputFormatters,
    this.hintTextFontWeight = FontWeight.normal,
    this.noElevation = false,
    this.borderWidth = 1,
    this.suffixWidget,
    this.maxLength,
    this.prefixWidget,
  }) : super(key: key);

  @override
  State<TextFormFieldWidget> createState() => _TextFormFieldWidgetState();
}

class _TextFormFieldWidgetState extends State<TextFormFieldWidget> {
  late bool _isShowPassword;
  @override
  void initState() {
    _isShowPassword = widget.isPassword ? true : false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.padding.verticalLow,
      child: SizedBox(
        width: context.sized.dynamicWidth(widget.width!),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              widget.title,
              textStyle: context.general.textTheme.headline6?.copyWith(fontSize: 12.sp),
            ),
            2.h.ph,
            TextFormField(
              maxLength: widget.maxLength,
              maxLines: widget.maxLines!,
              controller: widget.textEditingController,
              initialValue: widget.initialValue,
              inputFormatters: widget.inputFormatters,
              textAlignVertical: TextAlignVertical.center,
              keyboardType: widget.textInputType,
              obscureText: _isShowPassword,
              style: context.general.textTheme.headline5
                  ?.copyWith(color: ColorConstants.instance?.cadetBlue, fontSize: widget.fontSize!.sp, fontWeight: widget.hintTextFontWeight),
              decoration: InputDecoration(
                errorMaxLines: 1,
                errorStyle: context.general.textTheme.subtitle2?.copyWith(color: Colors.red),
                suffix: widget.suffixWidget,
                prefixIcon: widget.prefixWidget,
                hintText: widget.hintText,
                labelText: widget.labelText,
                prefixIconColor: widget.prefixIconColor,
                filled: true,
                fillColor: widget.backgroundColor,
                isDense: true,
                hintStyle: context.general.textTheme.headline5
                    ?.copyWith(color: ColorConstants.instance?.cadetBlue, fontSize: widget.fontSize!.sp, fontWeight: widget.hintTextFontWeight),
                border: _buildOutlineInputBorder(),
                focusedErrorBorder: _buildOutlineInputBorder(color: const Color(0xFFFA4F4F)),
                enabledBorder: _buildOutlineInputBorder(),
                focusedBorder: _buildOutlineInputBorder(),
                errorBorder: _buildOutlineInputBorder(color: const Color(0xFFFA4F4F)),
                disabledBorder: _buildOutlineInputBorder(),
              ),
              validator: (value) => widget.validator != null ? widget.validator!(value) : null,
              onSaved: (value) {
                widget.onSaved != null ? widget.onSaved!(value) : null;
              },
              onChanged: (value) {
                widget.onChanged != null ? widget.onChanged!(value) : null;
              },
            ),
          ],
        ),
      ),
    );
  }

  OutlineInputBorder _buildOutlineInputBorder({Color? color}) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(widget.borderRadius!)),
        borderSide: BorderSide(color: color ?? ColorConstants.instance!.cadetBlue, width: widget.borderWidth));
  }
}
