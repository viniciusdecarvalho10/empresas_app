import 'package:flutter/material.dart';
import '../../../../../../../shared/components/input_rounded_widget.dart';
import '../../../../../../../shared/components/password_text_form_field/password_text_form_field_widget.dart';
import '../../../../../../../shared/components/text_field_widget.dart';

class FormWidget extends StatelessWidget {
  final bool isFormValid;
  final VoidCallback loginPressed;
  final Function(String) emailChanged;
  final Function(String) passwordChanged;
  final String? errorMsg;
  const FormWidget({
    Key? key,
    required this.isFormValid,
    required this.loginPressed,
    required this.emailChanged,
    required this.passwordChanged,
    this.errorMsg,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
        TextFieldWidget(
          labelText: 'Email',
          fontColor: Colors.black.withOpacity(0.8),
          backgroundColor: Colors.transparent,
          onChanged: emailChanged,
          errorMessage: errorMsg,
          textInputAction: TextInputAction.next,
          suffixIcon: _buildIconError(errorMsg),
        ),
        SizedBox(height: size.height * 0.01),
        PasswordTextFormFieldWidget(
          fontColor: Colors.black.withOpacity(0.8),
          backgroundColor: Colors.transparent,
          onChanged: passwordChanged,
          validator: () => {},
          label: 'Senha',
          errorMessage: errorMsg,
        ),
        Visibility(
          visible: (errorMsg?.length ?? 0) != 0,
          child: Align(
            alignment: Alignment.topRight,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: size.height * 0.3,
              ),
              child: Text(
                errorMsg ?? '',
                style: TextStyle(color: Colors.red),
              ),
            ),
          ),
        ),
        SizedBox(height: size.height * 0.06),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: size.height * 0.02),
                child: InputRoundedWidget(
                  label: "ENTRAR",
                  onPressed: isFormValid
                      ? () async {
                          loginPressed();
                        }
                      : null,
                ),
              ),
            )
          ],
        ),
      ]),
    );
  }

  _buildIconError(String? errorMsg) {
    if (errorMsg != null && errorMsg.isNotEmpty) {
      return Container(
        child: Image.asset('assets/images/shape.png'),
      );
    }
  }
}
