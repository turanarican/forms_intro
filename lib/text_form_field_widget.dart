import 'package:flutter/material.dart';

typedef StringValueSetter = void Function(String value);

class TextFormFieldWidget extends StatefulWidget {
  const TextFormFieldWidget({
    required this.prefixIcon,
    required this.isPassword,
    required this.keyboardType,
    required this.hintText,
    required this.validator,
    required this.valueSetter,
    super.key,
  });
  final Icon prefixIcon;
  final bool isPassword;
  final TextInputType keyboardType;
  final String hintText;
  final String? Function(String?) validator;
  final StringValueSetter valueSetter;

  @override
  State<TextFormFieldWidget> createState() => _TextFormFieldWidgetState();
}

class _TextFormFieldWidgetState extends State<TextFormFieldWidget> {
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    Widget? buildPasswordVisibilitySuffixIcon() {
      if (widget.isPassword) {
        return IconButton(
          onPressed: () {
            setState(() {
              isPasswordVisible = !isPasswordVisible;
            });
          },
          icon:
              Icon(isPasswordVisible ? Icons.visibility_off : Icons.visibility),
        );
      } else {
        return null;
      }
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 9.0, horizontal: 18.0),
      child: TextFormField(
        validator: widget.validator,
        decoration: InputDecoration(
          prefixIcon: widget.prefixIcon,
          suffixIcon: buildPasswordVisibilitySuffixIcon(),
          hintText: widget.hintText,
        ),
        style: const TextStyle(
          fontSize: 18.0,
        ),
        obscureText: !isPasswordVisible && widget.isPassword,
        keyboardType: widget.keyboardType,
        onSaved: (newValue) {
          widget.valueSetter(newValue ?? '');
        },
      ),
    );
  }
}
