import 'package:flutter/material.dart';
import 'text_form_field_widget.dart';
import 'form_validator_mixin.dart';

typedef StringValueSetter = void Function(String value);

class FormWidget extends StatefulWidget {
  const FormWidget({
    required this.formKey,
    required this.emailSetter,
    required this.passwordSetter,
    super.key,
  });
  final GlobalKey<FormState> formKey;
  final StringValueSetter emailSetter;
  final StringValueSetter passwordSetter;
  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> with InputValidationMixin {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        children: [
          TextFormFieldWidget(
            prefixIcon: const Icon(Icons.email),
            isPassword: false,
            keyboardType: TextInputType.emailAddress,
            hintText: 'Email Address',
            validator: (email) {
              return isEmailValid(email!)
                  ? null
                  : 'Please enter a valid email address';
            },
            valueSetter: widget.emailSetter,
          ),
          TextFormFieldWidget(
            prefixIcon: const Icon(Icons.password),
            isPassword: true,
            keyboardType: TextInputType.text,
            hintText: 'Password',
            validator: (password) {
              return isPasswordValid(password!)
                  ? null
                  : 'Please enter a valid password';
            },
            valueSetter: widget.passwordSetter,
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 9.0, horizontal: 18.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(22),
                  shape: const StadiumBorder(),
                  textStyle: const TextStyle(
                    fontSize: 20.0,
                  ),
                  elevation: 0,
                ),
                onPressed: () {
                  if (widget.formKey.currentState?.validate() == true) {
                    widget.formKey.currentState?.save();
                  }
                },
                child: const Text('Submit'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
