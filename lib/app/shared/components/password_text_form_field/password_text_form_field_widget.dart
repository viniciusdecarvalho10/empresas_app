import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../helpers/app_colors.dart';
import '../text_field_widget.dart';
import 'password_text_form_field_controller.dart';

class PasswordTextFormFieldWidget extends StatefulWidget {
  final Function(String) onChanged;
  final String label;
  final Function validator;
  final String? errorMessage;
  final Color? backgroundColor;
  final Color? fontColor;
  PasswordTextFormFieldWidget({
    Key? key,
    required this.onChanged,
    required this.label,
    required this.validator,
    this.errorMessage,
    this.backgroundColor,
    this.fontColor,
  }) : super(key: key);

  @override
  _PasswordTextFormFieldWidgetState createState() => _PasswordTextFormFieldWidgetState();
}

class _PasswordTextFormFieldWidgetState extends ModularState<PasswordTextFormFieldWidget, PasswordTextFormFieldController> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return TextFieldWidget(
          labelText: widget.label,
          fontColor: widget.fontColor ?? Colors.black.withOpacity(0.8),
          backgroundColor: widget.backgroundColor ?? Colors.transparent,
          obscureText: !controller.visible,
          errorMessage: widget.errorMessage,
          suffixIcon: IconButton(
            onPressed: controller.switchVisible,
            icon: controller.visible ? Icon(Icons.visibility_off, color: AppTheme.ruby) : Icon(Icons.visibility, color: AppTheme.grey40),
          ),
          onChanged: widget.onChanged,
        );
      },
    );
    // return TripleBuilder<PasswordTextFormFieldStore, Failure, bool>(
    //   store: controller.store,
    //   builder: (_, state) {
    //     return TextFieldWidget(
    //       labelText: widget.label,
    //       fontColor: widget.fontColor ?? Colors.black.withOpacity(0.8),
    //       backgroundColor: widget.backgroundColor ?? Colors.transparent,
    //       obscureText: !controller.store.state,
    //       errorMessage: widget.errorMessage,
    //       suffixIcon: IconButton(
    //         onPressed: controller.switchVisible,
    //         icon: controller.store.state
    //             ? Icon(Icons.visibility, color: AppColors.ruby)
    //             : Icon(Icons.visibility_off, color: AppColors.grey40),
    //       ),
    //       onChanged: widget.onChanged,
    //     );
    //   },
    // );
  }
}
