import 'package:flutter/material.dart';

import '../helpers/app_colors.dart';

class TextFieldWidget extends StatefulWidget {
  final Function(String?)? onSaved;
  final String Function(String?)? validator;
  final Function()? onTap;
  final Function(String)? onChanged;
  final TextInputAction? textInputAction;
  final String? labelText;
  final String? initialValue;
  final TextEditingController? controller;
  final bool readOnly;
  final bool obscureText;
  final int maxLines;
  final Color backgroundColor;
  final Color fontColor;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool showBorder;
  final Color? labelStyleColor;
  final String? hintText;
  final FocusNode? focus;
  final String? errorMessage;
  TextFieldWidget({
    Key? key,
    this.onSaved,
    this.validator,
    this.onTap,
    this.onChanged,
    this.textInputAction = TextInputAction.done,
    this.labelText,
    this.initialValue,
    this.controller,
    this.readOnly = false,
    this.obscureText = false,
    this.maxLines = 1,
    this.backgroundColor = Colors.transparent,
    this.fontColor = Colors.black,
    this.suffixIcon,
    this.prefixIcon,
    this.showBorder = true,
    this.labelStyleColor,
    this.hintText,
    this.focus,
    this.errorMessage,
  }) : super(key: key);

  @override
  _TextFieldWidgetState createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  late FocusNode focus;
  bool hasFocus = false;

  @override
  void initState() {
    focus = widget.focus ?? FocusNode();
    focus.addListener(() {
      hasFocus = focus.hasFocus;
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    focus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var colorFocus = hasFocus ? AppTheme.ruby : AppTheme.grey40;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          widget.labelText!,
          style: TextStyle(
            fontSize: 14,
            color: colorFocus,
          ),
        ),
        TextFormField(
          cursorColor: colorFocus,
          focusNode: focus,
          readOnly: widget.readOnly,
          controller: widget.controller,
          initialValue: widget.initialValue,
          obscureText: widget.obscureText,
          keyboardType: TextInputType.text,
          textInputAction: widget.textInputAction,
          maxLines: widget.maxLines,
          style: TextStyle(
            color: widget.fontColor,
          ),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(10.0),
            suffixIcon: widget.suffixIcon,
            prefixIcon: widget.prefixIcon,
            fillColor: AppTheme.whisper,
            filled: true,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
            labelStyle: TextStyle(
              color: widget.labelStyleColor == null ? Theme.of(context).accentColor : widget.labelStyleColor,
              fontWeight: FontWeight.w400,
              fontSize: 16,
            ),
            errorBorder: (widget.errorMessage?.length ?? 0) == 0 ? OutlineInputBorder(borderSide: BorderSide(color: AppTheme.whisper)) : OutlineInputBorder(borderRadius: BorderRadius.circular(4.0), borderSide: BorderSide(color: AppTheme.salmon)),
            errorText: '',
            errorStyle: TextStyle(
              fontFamily: "Rubik",
              fontWeight: FontWeight.w300,
              fontSize: 12,
              inherit: true,
              color: AppTheme.salmon,
            ),
          ),
          validator: widget.validator,
          onTap: widget.onTap,
          onSaved: widget.onSaved,
          onChanged: widget.onChanged,
        ),
      ],
    );
  }
}
